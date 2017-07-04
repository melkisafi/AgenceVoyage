package agenceVoyageControlleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vol.metier.dao.VilleDao;
import vol.metier.model.Ville;


@Controller
@RequestMapping("/ville")
public class VilleController {
	
	@Autowired
	private VilleDao villeDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Ville> villes = villeDao.findAll();

		model.addAttribute("villes", villes);

		return "ville/ville";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("ville", new Ville());

		return "ville/villeEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Ville ville = villeDao.find(id);
		model.addAttribute("ville", ville);

		return "ville/villeEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("ville") Ville ville) {

		if (ville.getId() == null) {
			villeDao.create(ville);
		} else {
			villeDao.update(ville);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Ville ville = villeDao.find(id);
		villeDao.delete(ville);

		return "forward:list";
	}
	
}