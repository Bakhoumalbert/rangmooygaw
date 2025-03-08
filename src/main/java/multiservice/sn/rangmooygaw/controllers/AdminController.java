package multiservice.sn.rangmooygaw.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import multiservice.sn.rangmooygaw.entite.*;
import multiservice.sn.rangmooygaw.service.*;
import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private AgenceService agenceService;
    @Autowired
    private ServiceService serviceService;
    @Autowired
    private AgentService agentService;

    // Afficher tous les admins sur une page JSP
    @GetMapping
    public String getAllAdmins(Model model) throws JsonProcessingException {

        return "admin"; // Nom du fichier JSP sans extension (admins.jsp)
    }

    // Formulaire pour ajouter un admin
    @GetMapping("/new-client")
    public String newAdminForm(Model model) {
        model.addAttribute("admin", new Admin()); // Objet vide pour le formulaire
        return "client-form"; // client-form.jsp
    }

    // Enregistrer un nouvel admin
    @PostMapping
    public String saveAdmin(@ModelAttribute Admin admin) {
        adminService.saveAdmin(admin);
        return "redirect:/admin"; // Redirige vers la liste des admins
    }

    // Afficher la page de création d'un client
    @GetMapping("/create-client")
    public String showCreateClientForm(Model model) {
        model.addAttribute("client", new Client());
        return "create-client"; // Nom de la vue JSP
    }

    // Enregistrer un nouveau client
    @PostMapping("/create-client")
    public String saveClient(@ModelAttribute("client") Client client) {
        clientService.saveClient(client);
        return "redirect:/admin/clients"; // Redirige vers la liste des clients
    }

    // Afficher la page de création d'une agence
    @GetMapping("/create-agence")
    public String showCreateAgenceForm(Model model) {
        model.addAttribute("agence", new Agence());
        return "create-agence"; // Nom de la vue JSP
    }

    @PostMapping("/create-agence")
    public String saveAgence(@ModelAttribute("agence") Agence agence, RedirectAttributes redirectAttributes) {
        try {
            agenceService.saveAgence(agence);
            redirectAttributes.addFlashAttribute("successMessage", "Agence créée avec succès !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors de la création de l'agence.");
        }
        return "redirect:/admin/agences";
    }


//    // Enregistrer une nouvelle agence
//    @PostMapping("/create-agence")
//    public String saveAgence(@ModelAttribute("agence") Agence agence) {
//        agenceService.saveAgence(agence); // Appel au service pour enregistrer
//        return "redirect:/admin/agences"; // Redirige vers la liste des agences
//    }
//    // 🔹 Enregistrer une nouvelle agence
//    @PostMapping("/create-agence")
//    public String saveAgence(@ModelAttribute("agence") Agence agence, RedirectAttributes redirectAttributes) {
//        try {
//            agenceService.saveAgence(agence);
//            redirectAttributes.addFlashAttribute("successMessage", "Agence créée avec succès !");
//        } catch (Exception e) {
//            redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors de la création de l'agence.");
//        }
//        return "redirect:/admin/agences";
//    }


    // Afficher la page de création d'un service
    @GetMapping("/create-service")
    public String showCreateServiceForm(Model model) {
        model.addAttribute("service", new Services());
        return "create-service"; // Nom de la vue JSP
    }

    // Enregistrer un nouveau service
    @PostMapping("/create-service")
    public String saveService(@ModelAttribute("service") Services service) {
        serviceService.saveService(service); // Appel au service pour enregistrer
        return "redirect:/admin/services"; // Redirige vers la liste des services
    }

    // Lister les clients
    @GetMapping("/clients")
    public String listClients(Model model) {
        List<Client> clients = clientService.getAllClients();

        // Sérialisation JSON avec échappement des caractères
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String clientsJson = objectMapper.writeValueAsString(clients);
            String safeClientsJson = StringEscapeUtils.escapeJson(clientsJson);
            model.addAttribute("clients", safeClientsJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        //model.addAttribute("clients", clients);
        return "client-list"; // Nom de la vue JSP
    }

    // Lister les agences
    @GetMapping("/agences")
    public String listAgences(Model model) {
        List<Agence> agences = agenceService.getAllAgences();

        // Sérialiser en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String agenceJson = objectMapper.writeValueAsString(agences);
            System.out.println("liste agence " + agenceJson);
            model.addAttribute("agences", agenceJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "list-agences"; // Nom de la vue JSP
    }

    // Lister les services
    @GetMapping("/services")
    public String listServices(Model model) {
        List<Services> services = serviceService.getAllServices();
        // Sérialiser en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String serviceJson = objectMapper.writeValueAsString(services);
            model.addAttribute("services", serviceJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "list-services"; // Nom de la vue JSP
    }

    // Gestion des agents
    @GetMapping("/agents")
    public String listAgents(Model model) {
        List<Agent> agents = agentService.getAllAgents();
        List<Agence> agences = agenceService.getAllAgences();

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String agentJson = objectMapper.writeValueAsString(agents);
            String agenceJson = objectMapper.writeValueAsString(agences);

            System.out.println(agentJson);
            model.addAttribute("agents", agentJson);
            model.addAttribute("agences", agenceJson);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "list-agent"; // Vue JSP pour afficher les agents
    }

    // Afficher le formulaire de création d'agent
    @GetMapping("/create-agent")
    public String showCreateAgentForm(Model model) {

        List<Agence> agences = agenceService.getAllAgences();
        List<Agent> agents = agentService.getAllAgents();

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String agentJson = objectMapper.writeValueAsString(agents);
            String agenceJson = objectMapper.writeValueAsString(agences);
            model.addAttribute("agent", agentJson);
            model.addAttribute("agences", agenceJson);

            System.out.println("Agence" + agenceJson);
            System.out.println("Agent"+agentJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "create-agent"; // Nom de la vue JSP
    }

    // Enregistrer un nouvel agent
    @PostMapping("/create-agent")
    public String saveAgent(@ModelAttribute("agent") Agent agent) {
        System.out.println("Agent : " + agent.getNom());
        System.out.println("Email : " + agent.getEmail());
        System.out.println("Agence ID : " + agent.getId_agent());
        agentService.saveAgent(agent);
        return "redirect:/admin/agents"; // Redirige vers la liste des agents
    }

    // Afficher la page de modification d'un client
    @GetMapping("/edit-client/{id}")
    public String showEditClientForm(@PathVariable Long id, Model model) {
        Optional<Client> client = clientService.getClientById(id);
        if (client != null) {
            model.addAttribute("client", client);
            return "edit-client"; // Page JSP pour modifier
        }
        return "redirect:/admin/clients";
    }

    // Mettre à jour un client
    @PostMapping("/update-client")
    public String updateClient(@ModelAttribute Client client) {
        clientService.updateClient(client);
        return "redirect:/admin/clients";
    }

//    // Supprimer un client
//    @GetMapping("/delete-client/{id}")
//    public ResponseEntity<Void> deleteClient(@PathVariable Long id) {
//        clientService.deleteClient(id);
//        return ResponseEntity.ok().build();
//    }

    // Supprimer un client
    @GetMapping("/delete-client/{id}")
    public String deleteClient(@PathVariable Long id) {
        clientService.deleteClient(id);
        return "redirect:/admin/clients";
    }

    // Modifier une agence (Page de modification)
    @GetMapping("/edit-agence/{id}")
    public String showEditAgenceForm(@PathVariable Long id, Model model) {
        Optional<Agence> optionalAgence = agenceService.getAgenceById(id);

        if (optionalAgence.isPresent()) {
            Agence agence = optionalAgence.get();
            model.addAttribute("agence", agence);
            System.out.println("Agence trouvée : " + agence);

            // Sérialiser l'agence en JSON pour l'affichage côté client
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                String agenceJson = objectMapper.writeValueAsString(agence);
                model.addAttribute("agences", agenceJson);
                System.out.println("Agence JSON : " + agenceJson);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return "edit-agence"; // Page JSP pour modifier l'agence
        } else {
            System.out.println("Agence non trouvée pour l'ID : " + id);
            return "redirect:/admin/agences"; // Rediriger si l'agence n'existe pas
        }
    }

    // Mettre à jour une agence
    @PostMapping("/update-agence")
    public String updateAgence(@ModelAttribute Agence agence) {
        agenceService.saveAgence(agence);
        return "redirect:/admin/agences";
    }

    // Supprimer une agence
    @DeleteMapping("/delete-agence/{id}")
    public ResponseEntity<Void> deleteAgence(@PathVariable Long id) {
        agenceService.deleteAgence(id);
        return ResponseEntity.ok().build();
    }

    /**
     * 🎯 Afficher le formulaire de modification d'un agent
     * @param id ID de l'agent à modifier
     * @param model Modèle pour passer les données à la vue
     * @return La page edit-agent.jsp
     */
    @GetMapping("/edit-agent/{id}")
    public String showEditAgentForm(@PathVariable Long id, Model model) {
        Optional<Agent> agentOpt = agentService.getAgentById(id);
        List<Agence> agences = agenceService.getAllAgences();

        if (agentOpt.isPresent()) {
            Agent agent = agentOpt.get();
            model.addAttribute("agent", agent);

            // Sérialisation JSON en toute sécurité
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                String agencesJson = objectMapper.writeValueAsString(agences);
                // Échapper les caractères spéciaux pour éviter une erreur en JSP
                String safeAgencesJson = StringEscapeUtils.escapeJson(agencesJson);
                model.addAttribute("agences", safeAgencesJson);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return "edit-agent"; // Retourne la page JSP de modification
        } else {
            return "redirect:/admin/agents"; // Redirige si l'agent n'existe pas
        }
    }

    /**
     * 🎯 Mettre à jour un agent
     * @param agent L'agent mis à jour
     * @return Redirection vers la liste des agents après modification
     */
    @PostMapping("/update-agent")
    public String updateAgent(@ModelAttribute Agent agent) {
        agentService.saveAgent(agent);
        return "redirect:/admin/agents";
    }

    // Supprimer une agence
    @DeleteMapping("/delete-agent/{id}")
    public ResponseEntity<Void> deleteAgent(@PathVariable Long id) {
        agentService.deleteAgentById(id);
        return ResponseEntity.ok().build();
    }

    // Modifier une agence (Page de modification)
    @GetMapping("/edit-service/{id}")
    public String showEditServiceForm(@PathVariable Long id, Model model) {
        Optional<Services> optionalService = serviceService.getServiceById(id);

        if (optionalService.isPresent()) {
            Services service = optionalService.get();
            model.addAttribute("service", service);
            System.out.println("Service trouvée : " + service);

            // Sérialiser l'agence en JSON pour l'affichage côté client
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                String serviceJson = objectMapper.writeValueAsString(service);
                model.addAttribute("services", serviceJson);
                System.out.println("Service JSON : " + serviceJson);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return "edit-service"; // Page JSP pour modifier l'agence
        } else {
            System.out.println("Service non trouvée pour l'ID : " + id);
            return "redirect:/admin/services"; // Rediriger si le service n'existe pas
        }
    }

    // Mettre à jour une agence
    @PostMapping("/update-service")
    public String updateService(@ModelAttribute Services service) {
        serviceService.saveService(service);
        return "redirect:/admin/services";
    }

    // Supprimer une agence
    @DeleteMapping("/delete-service/{id}")
    public ResponseEntity<Void> deleteService(@PathVariable Long id) {
        serviceService.deleteService(id);
        return ResponseEntity.ok().build();
    }
}
