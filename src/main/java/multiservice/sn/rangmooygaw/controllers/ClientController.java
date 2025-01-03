package multiservice.sn.rangmooygaw.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import multiservice.sn.rangmooygaw.config.JsonDataLoader;
import multiservice.sn.rangmooygaw.modele.Queue;
import multiservice.sn.rangmooygaw.services.QueueService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClientController {

    private final QueueService queueService;
    private final JsonDataLoader jsonDataLoader;

    public ClientController(QueueService queueService, JsonDataLoader jsonDataLoader) {
        this.queueService = queueService;
        this.jsonDataLoader = jsonDataLoader;
    }


//    @GetMapping("/")
//    public String showHome(Model model) {
//        // Services disponibles
//        model.addAttribute("services", queueService.getAllQueues().keySet());
//        return "client_home";
//    }
    @GetMapping("/")
    public String showHome(Model model) throws JsonProcessingException {
        model.addAttribute("services", jsonDataLoader.getServices());
        model.addAttribute("localisations", new ObjectMapper().writeValueAsString(jsonDataLoader.getLocalisations()));
        return "client_home";
    }


    @PostMapping("/select")
    public String selectService(@RequestParam String location, Model model) {
        // Obtenir un ticket pour la localisation sélectionnée
        int ticketNumber = queueService.issueTicket(location);
        int currentNumber = queueService.getQueue(location).getCurrentNumber();
        int position = ticketNumber - currentNumber;
        int peopleAhead = position - 1;

        // Ajouter les détails au modèle pour affichage
        model.addAttribute("location", location);
        model.addAttribute("ticketNumber", ticketNumber);
        model.addAttribute("position", position);
        model.addAttribute("peopleAhead", peopleAhead);
        model.addAttribute("currentNumber", currentNumber);

        return "client_ticket";
    }
}
