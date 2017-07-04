package agenceVoyageControlleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vol.metier.dao.ClientDao;
import vol.metier.model.Client;
import vol.metier.model.ClientEI;
import vol.metier.model.ClientMoral;
import vol.metier.model.ClientPhysique;
import vol.metier.model.TitreMoral;
import vol.metier.model.TitrePhysique;

@Controller
@RequestMapping("/client")
public class ClientController {
	@Autowired
	private ClientDao clientDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Client> clients = clientDao.findAll();

		model.addAttribute("clients", clients);

		return "client/client";
	}
	
	@RequestMapping("/addMoral")
	public String addMoral(Model model){	
		model.addAttribute("client", new ClientMoral());
		model.addAttribute("titreMoral", TitreMoral.values());
		return "client/clientMoral";
	}
	
	@RequestMapping("/addPhysique")
	public String addPhysique(Model model){	
		model.addAttribute("client", new ClientPhysique());
		model.addAttribute("titrePhysique", TitrePhysique.values());
		return "client/clientPhysique";
	}
	
	@RequestMapping("/addEI")
	public String addEI(Model model){	
		model.addAttribute("client", new ClientEI());
		return "client/clientEI";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Client client = clientDao.find(id);
		model.addAttribute("client", client);
		if(client instanceof ClientPhysique)
			return "client/clientPhysique";
		else if(client instanceof ClientMoral)
			return "client/clientMoral";
		else
			return "client/clientEI";
	}
	
	@RequestMapping(value = "/savePhy", method = RequestMethod.POST)
	public String save(@ModelAttribute("client") ClientPhysique client) {	
		if (client.getId() == null) {
			clientDao.create(client);
		} else {
			clientDao.update(client);
		}

		return "redirect:list";
	}
	
	@RequestMapping(value = "/saveMor", method = RequestMethod.POST)
	public String save(@ModelAttribute("client") ClientMoral client) {

		if (client.getId() == null) {
			clientDao.create(client);
		} else {
			clientDao.update(client);
		}

		return "redirect:list";
	}
	
	@RequestMapping(value = "/saveEI", method = RequestMethod.POST)
	public String save(@ModelAttribute("client") ClientEI client) {

		if (client.getId() == null) {
			clientDao.create(client);
		} else {
			clientDao.update(client);
		}

		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		Client client = clientDao.find(id);
		clientDao.delete(client);

		return "forward:list";
	}
	
}
