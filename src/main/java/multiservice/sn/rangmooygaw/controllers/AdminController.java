package multiservice.sn.rangmooygaw.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import multiservice.sn.rangmooygaw.entite.Admin;
import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.service.AdminService;
import multiservice.sn.rangmooygaw.service.ClientService;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private FileAttenteService fileAttenteService;
    @Autowired
    private ClientService clientService;



    // Afficher tous les admins sur une page JSP
    @GetMapping
    public String getAllAdmins(Model model) throws JsonProcessingException {
        List<Admin> admins = adminService.getAllAdmins();
        List<FileAttente> fileAttentes = fileAttenteService.getAllFiles();

        System.out.println(admins);
        System.out.println(fileAttentes);

        fileAttentes.forEach(file -> System.out.println(file));

        model.addAttribute("fileAttente", fileAttentes);
        model.addAttribute("admins", admins); // Passe les données à la vue
        return "admin"; // Nom du fichier JSP sans extension (admins.jsp)
    }

    // Formulaire pour ajouter un admin
    @GetMapping("/new")
    public String newAdminForm(Model model) {
        model.addAttribute("admin", new Admin()); // Objet vide pour le formulaire
        return "admin-form"; // admin-form.jsp
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

    // Lister les clients
    @GetMapping("/clients")
    public String listClients(Model model) {
        List<Client> clients = clientService.getAllClients();

        // Sérialiser en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String clientsJson = objectMapper.writeValueAsString(clients);
            System.out.println(clientsJson);
            model.addAttribute("clients", clientsJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        //model.addAttribute("clients", clients);
        return "client-list"; // Nom de la vue JSP
    }

}
