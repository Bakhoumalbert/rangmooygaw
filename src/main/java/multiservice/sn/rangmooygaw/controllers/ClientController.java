package multiservice.sn.rangmooygaw.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import multiservice.sn.rangmooygaw.entite.*;
import multiservice.sn.rangmooygaw.repository.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private AgenceRepository agenceRepository;

    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private ClientRepository clientRepository;

    @GetMapping
    public String afficherPageClient(Model model, @AuthenticationPrincipal User utilisateur) throws JsonProcessingException {
        // 🔍 Log de l'utilisateur authentifié
        System.out.println("Utilisateur connecté : " + utilisateur.getUsername());

        // ✅ Récupérer l'utilisateur depuis la base
        Utilisateur userEntity = utilisateurRepository.findByEmail(utilisateur.getUsername())
                .orElseThrow(() -> new IllegalArgumentException("⚠️ Utilisateur introuvable en base !"));

        System.out.println("Utilisateur trouvé : " + userEntity.getId());

        // ✅ Récupérer le client lié à cet utilisateur
        Client client = clientRepository.findByUtilisateurEmail(utilisateur.getUsername())
                .orElseThrow(() -> new IllegalArgumentException("⚠️ Client introuvable pour cet utilisateur !"));

        System.out.println("Client trouvé : " + client.getId());

        // ✅ Récupérer les tickets associés
        List<Ticket> tickets = ticketRepository.findByClient(client);
        System.out.println("Nombre de tickets trouvés : " + tickets.size());

        // Convertir les listes en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

        String ticketJson = objectMapper.writeValueAsString(tickets);

        model.addAttribute("ticketJson", ticketJson);

        return "client/client";
    }

    @GetMapping("/file-attente")
    public String afficherFileAttente(Model model) throws JsonProcessingException {
        List<Agence> agences = agenceRepository.findAll();
        List<Services> services = serviceRepository.findAll();

        // Convertir les listes en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        String agencesJson = objectMapper.writeValueAsString(agences);
        String servicesJson = objectMapper.writeValueAsString(services);

        // Récupérer les services disponibles par agence
        Map<Long, List<Services>> servicesParAgence = new HashMap<>();
        for (Agence agence : agences) {
            servicesParAgence.put(agence.getIdAgence(), agence.getServices());  // 💡 Relation ManyToMany
        }
        String servicesParAgenceJson = objectMapper.writeValueAsString(servicesParAgence);

        System.out.println("services +++ : "+servicesParAgenceJson);
        model.addAttribute("agencesJson", agencesJson);
        model.addAttribute("servicesParAgenceJson", servicesParAgenceJson); // 💡 Ajouter la relation Agence → Services

        return "client/file-attente";
    }



    @PostMapping("/prendre-ticket")
    public String prendreTicket(@RequestParam("agenceId") Long agenceId,
                                @RequestParam("serviceId") Long serviceId,
                                @AuthenticationPrincipal User utilisateur,
                                RedirectAttributes redirectAttributes) {

        // Récupérer l'utilisateur connecté
        Optional<Utilisateur> utilisateurOpt = utilisateurRepository.findByEmail(utilisateur.getUsername());

        if (utilisateurOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Utilisateur introuvable.");
            return "redirect:/client/file-attente";
        }

        // Récupérer le client associé à l'utilisateur
        Optional<Client> clientOpt = clientRepository.findByUtilisateur(utilisateurOpt.get());

        if (clientOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Aucun client associé à cet utilisateur.");
            return "redirect:/client/file-attente";
        }

        Optional<Agence> agenceOpt = agenceRepository.findById(agenceId);
        Optional<Services> serviceOpt = serviceRepository.findById(serviceId);

        if (agenceOpt.isPresent() && serviceOpt.isPresent()) {
            Ticket ticket = new Ticket();
            ticket.setDateCreation(LocalDateTime.now());
            ticket.setNumero("T-" + System.currentTimeMillis());
            ticket.setStatut("EN ATTENTE");
            ticket.setAgence(agenceOpt.get());
            ticket.setService(serviceOpt.get());
            ticket.setClient(clientOpt.get());

            ticketRepository.save(ticket);

            // ✅ Ajout du message flash
            redirectAttributes.addFlashAttribute("successMessage", "Votre ticket a été créé avec succès !");
        } else {
            // ✅ En cas d'erreur
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur : Agence ou Service introuvable.");
        }

        return "redirect:/client";  // ✅ Redirection avec message
    }

    @GetMapping("/tickets")
    public String voirTicketsClient(Model model, @AuthenticationPrincipal User utilisateur) {
        // Récupérer le client à partir de l'utilisateur authentifié
        Utilisateur userEntity = utilisateurRepository.findByEmail(utilisateur.getUsername())
                .orElseThrow(() -> new IllegalArgumentException("Utilisateur introuvable"));

        Client client = clientRepository.findByUtilisateur(userEntity)
                .orElseThrow(() -> new IllegalArgumentException("Client introuvable"));


        // Récupérer les tickets associés à ce client
        List<Ticket> tickets = ticketRepository.findByClient(client);

        // Convertir en JSON pour JavaScript
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule()); // Pour gérer LocalDateTime correctement
        try {
            String ticketsJson = objectMapper.writeValueAsString(tickets);
            model.addAttribute("ticketsJson", ticketsJson);
        } catch (JsonProcessingException e) {
            model.addAttribute("ticketsJson", "[]");
        }

        return "client/tickets"; // Afficher la page JSP correspondante
    }

}
