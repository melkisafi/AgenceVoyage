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

import vol.metier.dao.ClientDao;
import vol.metier.dao.PassagerDao;
import vol.metier.dao.ReservationDao;
import vol.metier.dao.VolDao;
import vol.metier.model.Client;
import vol.metier.model.Passager;
import vol.metier.model.Reservation;
import vol.metier.model.Vol;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private PassagerDao passagerDao;
	@Autowired
	private ClientDao clientDao;
	@Autowired
	private VolDao volDao;
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Reservation> reservations = reservationDao.findAll();
		
		model.addAttribute("reservations", reservations);
		
		return "reservation/reservations";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		
		List<Passager> passagers = passagerDao.findAll();
		List<Client> clients = clientDao.findAll();
		List<Vol> vols = volDao.findAll();
		
		model.addAttribute("passagers", passagers);
		model.addAttribute("clients", clients);
		model.addAttribute("vols", vols);
	
		model.addAttribute("reservation",new Reservation());
		
		return "reservation/reservationEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name="id", required=true) Long id, Model model) {
		
		List<Passager> passagers = passagerDao.findAll();
		List<Client> clients = clientDao.findAll();
		List<Vol> vols = volDao.findAll();
		
		model.addAttribute("passagers", passagers);
		model.addAttribute("clients", clients);
		model.addAttribute("vols", vols);
		
		
		Reservation reservation = reservationDao.find(id);
		model.addAttribute("reservation",reservation);		
		
		return "reservation/reservationEdit";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result) {
		
		if(result.hasErrors()) {
			return "reservation/reservationEdit";
		}
		
		if(reservation.getId() == null) {
			reservationDao.create(reservation);
		} else {
			reservationDao.update(reservation);
		}
		 
		return "redirect:list";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(name="id", required=true) Long id) {
		Reservation reservation = reservationDao.find(id);
		reservationDao.delete(reservation);
		
		return "forward:list";
	}
	
}
