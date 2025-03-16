package multiservice.sn.rangmooygaw.controllers;


import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.entite.Role;
import multiservice.sn.rangmooygaw.entite.Utilisateur;
import multiservice.sn.rangmooygaw.repository.ClientRepository;
import multiservice.sn.rangmooygaw.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/auth")
public class AuthPageController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ClientRepository clientRepository;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // ✅ Affiche WEB-INF/jsp/login.jsp
    }

    // Traiter la connexion (POST)
    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String motDePasse) {
        // Ajoutez ici la logique d'authentification si besoin
        return "redirect:/client"; // Redirige après connexion réussie
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // ✅ Affiche WEB-INF/jsp/register.jsp
    }

    @PostMapping("/register")
    public String register(@RequestParam String nom,
                           @RequestParam String email,
                           @RequestParam String motDePasse,
                           @RequestParam String role,
                           Model model) {

        if (utilisateurRepository.findByEmail(email).isPresent()) {
            model.addAttribute("error", "Cet email est déjà utilisé.");
            return "register";
        }

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(nom);
        utilisateur.setEmail(email);
        utilisateur.setMotDePasse(passwordEncoder.encode(motDePasse));
        utilisateur.setRole(Role.valueOf(role));

        // ✅ Créer et lier un client
        Client client = new Client();
        client.setNom(nom);
        client.setEmail(email);
        client.setUtilisateur(utilisateur); // Lier au compte utilisateur

        // Sauvegarde
        utilisateurRepository.save(utilisateur);
        clientRepository.save(client);

        return "redirect:/auth/login";
    }


}
