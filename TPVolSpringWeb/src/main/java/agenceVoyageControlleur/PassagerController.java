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

import vol.metier.dao.PassagerDao;
import vol.metier.model.Passager;

@Controller
@RequestMapping("/passager")
public class PassagerController {

	@Autowired
	private PassagerDao passagerDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Passager> passagers = passagerDao.findAll();

		model.addAttribute("passagers", passagers);

		return "passager/passagers";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("passager", new Passager());	
		return "passager/passagerEdit";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Passager passager = passagerDao.find(id);
		model.addAttribute("passager", passager);


		return "passager/passagerEdit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("passager") @Valid Passager passager, BindingResult result) {
		
		if(result.hasErrors()) {
			return "passager/passagerEdit";
		}

		if (passager.getId() == null) {
			passagerDao.create(passager);
		} else {
			passagerDao.update(passager);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Passager passager = passagerDao.find(id);
		passagerDao.delete(passager);

		return "forward:list";
	}

}
