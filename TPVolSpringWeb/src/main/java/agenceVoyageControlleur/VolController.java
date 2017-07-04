package agenceVoyageControlleur;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vol.metier.dao.AeroportDao;
import vol.metier.dao.CompagnieAerienneDao;
import vol.metier.dao.VolDao;
import vol.metier.model.Vol;

@Controller
@RequestMapping("/vol")
public class VolController {

	@Autowired
	private VolDao volDao;
	
	@Autowired
	private AeroportDao aeroportDao;
	
	@Autowired
	private CompagnieAerienneDao compagnieAerienneDao;
	 	
//	@Autowired
//	private EscaleDao escaleDao;
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Vol> vols = volDao.findAll();

		model.addAttribute("vols", vols);

		return "vol/vols";
	}
	
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("mode", "add");
		model.addAttribute("vol", new Vol());
		
		model.addAttribute("vols", volDao.findAll());
		 
		
		//Envoi de deux listes d'aéroports à la JSP
		model.addAttribute("departs", aeroportDao.findAll());
		model.addAttribute("arrivees", aeroportDao.findAll());
		
		return "vol/volEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name="id", required=true) Long id, Model model){
		model.addAttribute("mode", "edit");
		Vol vol =volDao.find(id);
		model.addAttribute("vol", vol);
		model.addAttribute("vols", volDao.findAll());
		
		
		return "vol/volEdit";
	}
	
	
	@RequestMapping(value= "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("vol")@Valid Vol vol, @RequestParam("mode") String mode, BindingResult result){
		if (mode.equals("add")) {
			volDao.create(vol);
		} else {
			volDao.update(vol);
		}
		
		
		
//		if(result.hasErrors()){
//			return "aeroport/aeroportEdit";
//		}
//		if (vol.getId() == null) {
//			volDao.create(vol);
//		} else {
//			volDao.update(vol);
//		}
//
		return "redirect:list";
	}
	
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name="id", required = true)Long id){
		Vol vol = volDao.find(id);
		volDao.delete(vol);
		
		return "forward:list";
	}
}
