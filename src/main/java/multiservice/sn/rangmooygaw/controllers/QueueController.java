package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.modele.Localisation;
import multiservice.sn.rangmooygaw.modele.Service;
import multiservice.sn.rangmooygaw.modele.Ticket;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2")
public class QueueController {
//
//    private final JsonDataLoader jsonDataLoader;
//
//    public ClientController(JsonDataLoader jsonDataLoader) {
//        this.jsonDataLoader = jsonDataLoader;
//    }
//
//    @GetMapping("/")
//    public String showHome(Model model) {
//        model.addAttribute("services", jsonDataLoader.getServices());
//        return "client_home";
//    }
//
//    @PostMapping("/select")
//    public String selectService(@RequestParam String service, @RequestParam String localisation, Model model) {
//        model.addAttribute("service", service);
//        model.addAttribute("localisation", localisation);
//
//        int ticketNumber = (int) (Math.random() * 1000); // Simuler un numéro de ticket
//        int currentNumber = (int) (Math.random() * ticketNumber); // Simuler le numéro actuel
//
//        int position = ticketNumber - currentNumber;
//        int peopleAhead = position - 1;
//
//        model.addAttribute("ticketNumber", ticketNumber);
//        model.addAttribute("currentNumber", currentNumber);
//        model.addAttribute("position", position);
//        model.addAttribute("peopleAhead", peopleAhead);
//
//        return "client_ticket";
//    }
}
