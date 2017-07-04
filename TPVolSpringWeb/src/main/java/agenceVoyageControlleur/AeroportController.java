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
import vol.metier.dao.VilleDao;
import vol.metier.model.Aeroport;



@Controller
@RequestMapping("/aeroport")
public class AeroportController {

	@Autowired
	private AeroportDao aeroportDao;
	
	@Autowired
	private VilleDao villeDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Aeroport> aeroports = aeroportDao.findAll();

		model.addAttribute("aeroports", aeroports);

		return "aeroport/aeroports";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("aeroport", new Aeroport());
		model.addAttribute("mode", "add");
		model.addAttribute("villes", villeDao.findAll());

		return "aeroport/aeroportEdit";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Aeroport aeroport = aeroportDao.find(id);
		model.addAttribute("aeroport", aeroport);
		model.addAttribute("mode", "edit");
		model.addAttribute("villes", villeDao.findAll());

		return "aeroport/aeroportEdit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("aeroport")@Valid Aeroport aeroport, @RequestParam("mode") String mode, BindingResult result) {
		if (mode.equals("add")) {
			aeroportDao.create(aeroport);
		} else {
			aeroportDao.update(aeroport);
		}
		
		
		
//		if(result.hasErrors()){
//			return "aeroport/aeroportEdit";
//		}
//		if (aeroport.getId() == null) {
//			aeroportDao.create(aeroport);
//		} else {
//			aeroportDao.update(aeroport);
//		}
//
		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Aeroport aeroport = aeroportDao.find(id); 
		aeroportDao.delete(aeroport);

		return "forward:list";
	}

}
