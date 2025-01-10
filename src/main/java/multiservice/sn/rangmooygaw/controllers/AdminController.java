package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Admin;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.service.AdminService;
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

    // Afficher tous les admins sur une page JSP
    @GetMapping
    public String getAllAdmins(Model model) {
        List<Admin> admins = adminService.getAllAdmins();
        List<FileAttente> fileAttentes = fileAttenteService.getAllFiles();
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
}
