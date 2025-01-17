package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.service.ClientService;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import multiservice.sn.rangmooygaw.service.ServiceService;
import multiservice.sn.rangmooygaw.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ServiceService serviceService; // Gère les services
    @Autowired
    private FileAttenteService fileAttenteService; // Gère les files d'attente
    @Autowired
    private TicketService ticketService; // Gère les tickets

    // Afficher la page de sélection du service
    @GetMapping("/select-service")
    public String selectService(Model model) {
        model.addAttribute("services", serviceService.getAllServices());
        return "select-service"; // Nom de la vue JSP
    }

    // Afficher les localisations d'un service
    @PostMapping("/select-location")
    public String selectLocation(@RequestParam Long serviceId, Model model) {
        model.addAttribute("localisations", fileAttenteService.getLocalisationsByServiceId(serviceId));
        model.addAttribute("serviceId", serviceId); // Conserver le service sélectionné
        return "select-location"; // Nom de la vue JSP
    }

    // Générer le ticket et afficher les informations
    @PostMapping("/get-ticket")
    public String getTicket(@RequestParam Long serviceId, @RequestParam Long localisationId, Model model) {
        Ticket ticket = ticketService.generateTicket(serviceId, localisationId);
        model.addAttribute("ticket", ticket);
        return "ticket-info"; // Nom de la vue JSP
    }

    @GetMapping("/file-attente")
    public String getFileAttente(@RequestParam Long serviceId, @RequestParam Long agenceId, Model model) {
        FileAttente fileAttente = fileAttenteService.getFileAttente(serviceId, agenceId);
        model.addAttribute("fileAttente", fileAttente);
        return "file-attente-info"; // Nom de la vue JSP
    }
}
