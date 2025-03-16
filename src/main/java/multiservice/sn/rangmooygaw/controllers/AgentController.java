package multiservice.sn.rangmooygaw.controllers;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/agent")
public class AgentController {

    @Autowired
    private TicketRepository ticketRepository;

    @GetMapping
    public String voirTickets(Model model) {
        List<Ticket> tickets = ticketRepository.findAll();

        System.out.println(tickets);

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());

            System.out.println("Avant conversion JSON");
            String ticketsJson = objectMapper.writeValueAsString(tickets);
            System.out.println("Après conversion JSON : " + ticketsJson);

            model.addAttribute("ticketsJson", ticketsJson);
        } catch (Exception e) {
            System.out.println("Erreur lors de la conversion JSON : " + e.getMessage());
            model.addAttribute("ticketsJson", "[]");
        }


        return "agent/agent";
    }
    // ✅ Méthode pour traiter un ticket
    @PostMapping("/traiter-ticket")
    public String traiterTicket(@RequestParam("idTicket") Long idTicket, RedirectAttributes redirectAttributes) {
        Optional<Ticket> optionalTicket = ticketRepository.findById(idTicket);

        if (optionalTicket.isPresent()) {
            Ticket ticket = optionalTicket.get();
            ticket.setStatut("TRAITÉ"); // Mettre à jour le statut
            ticketRepository.save(ticket);

            // ✅ Message de succès
            redirectAttributes.addFlashAttribute("successMessage", "Le ticket a été traité avec succès !");
        } else {
            // ❌ Erreur si le ticket n'existe pas
            redirectAttributes.addFlashAttribute("errorMessage", "Ticket introuvable.");
        }

        return "redirect:/agent/dashboard"; // ✅ Rediriger après le traitement
    }
}
