package agenceVoyageControlleur;

import java.util.List;

import javax.validation.Valid;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vol.metier.dao.AeroportDao;
import vol.metier.dao.EscaleDao;
import vol.metier.dao.VolDao;
import vol.metier.model.Aeroport;
import vol.metier.model.Escale;
import vol.metier.model.EscaleId;
import vol.metier.model.Vol;

@Controller
@RequestMapping("/escale")
public class EscaleCtrl {
	
	@Autowired
	private EscaleDao escaleDao;
	
	@Autowired
	private AeroportDao aeroportDao;
	
	@Autowired
	private VolDao volDao;
	
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("/list")
	public String list(Model model) {

		List<Escale> escales =  escaleDao.findAll();
		model.addAttribute("escales", escales);
		
		return "escale/escales";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "vol", required = true) Long volId, @RequestParam(name = "aero", required = true) Long aeroId, Model model) {

		EscaleId id = new EscaleId();
		Vol vol = volDao.find(volId);
		Aeroport aeroport = aeroportDao.find(aeroId);
		
		id.setAeroport(aeroport);
		id.setVol(vol);
		
		Escale escale = escaleDao.find(id);
		model.addAttribute("escale",escale);
		
		List<Vol> vols = volDao.findAll();
		model.addAttribute("vols", vols );
		
		List<Aeroport> aeroports= aeroportDao.findAll();
		model.addAttribute("aeroports",aeroports);
		
		model.addAttribute("mode", "edit");
		return "escale/escalesEdit";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("escale", new Escale());
		
		List<Vol> vols = volDao.findAll();
		model.addAttribute("vols", vols );
		
		List<Aeroport> aeroports= aeroportDao.findAll();
		model.addAttribute("aeroports",aeroports);
		model.addAttribute("mode", "add");
		
		return "escale/escalesEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("escale") @Valid Escale escale, @RequestParam("mode") String mode, BindingResult result) {
		escale.setVol(volDao.find(escale.getVol().getId()));  
		escale.setAeroport(aeroportDao.find(escale.getAeroport().getId()));
		
//		
//		if (result.hasErrors()){
//			return "escale/escalesEdit";
//		}
		
		if (mode.equals("add")) {
			escaleDao.create(escale);
		} else {
		escaleDao.update(escale);
		}
		return "redirect:list";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(name = "vol", required = true) Long volId, @RequestParam(name = "aero", required = true) Long aeroId, Model model) {
		EscaleId id = new EscaleId();
		Vol vol = volDao.find(volId);
		Aeroport aeroport = aeroportDao.find(aeroId);
		
		id.setAeroport(aeroport);
		id.setVol(vol);
		
		escaleDao.delete(id);
		return "forward:list";
	}
}
