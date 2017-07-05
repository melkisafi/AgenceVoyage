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

import vol.metier.dao.LoginDao;
import vol.metier.model.Login;



@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginDao loginDao;
	

	@RequestMapping("/list")
	public String list(Model model) {
		List<Login> logins = loginDao.findAll();

		model.addAttribute("logins", logins);

		return "login/login";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("login", new Login());
		model.addAttribute("mode", "add");
		//model.addAttribute("admin", loginDao.findAll());

		return "login/loginEdit";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Login login = loginDao.find(id);
		model.addAttribute("login", login);
		model.addAttribute("mode", "edit");
		//model.addAttribute("admins", loginDao.findAll());

		return "login/loginEdit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("login")@Valid Login login, @RequestParam("mode") String mode, BindingResult result) {
		if (mode.equals("add")) {
			loginDao.create(login);
		} else {
			loginDao.update(login);
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
		Login login = loginDao.find(id); 
		loginDao.delete(login);

		return "forward:list";
	}

}
