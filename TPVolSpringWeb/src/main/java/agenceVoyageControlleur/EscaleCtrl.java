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
	public String edit(@RequestParam(name = "id", required = true) EscaleId id, Model model) {
		Escale escale = escaleDao.find(id);
		List<Aeroport> aeroports = aeroportDao.findAll();
//		Aeroport aeroport = aeroportDao.find(escale.getAeroport());
		model.addAttribute("escale", escale);
		model.addAttribute("aeroports", aeroports);

		return "escale/escaleEdit";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("escale", new Escale());
		
		List<Vol> vols = volDao.findAll();
		model.addAttribute("vols", vols );
		
		List<Aeroport> aeroports= aeroportDao.findAll();
		model.addAttribute("aeroports",aeroports);
		
		return "escale/escalesEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("escale") @Valid Escale escale, BindingResult result) {
		
		
		
		
		//Derniere etape
		//create escale
		
//		
//		if (result.hasErrors()){
//			return "escale/escalesEdit";
//		}
		
//		if (escale.getVol().getId() != null && escale.getAeroport().getId()!=null) {
//			escaleDao.update(escale);
//		} else {
			escaleDao.create(escale);
//		}
		return "redirect:list";
	}
}
