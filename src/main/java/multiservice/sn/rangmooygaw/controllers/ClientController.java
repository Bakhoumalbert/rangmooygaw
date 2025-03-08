package multiservice.sn.rangmooygaw.controllers;


import multiservice.sn.rangmooygaw.entite.Client;
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
    private ClientService clientService;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("client", new Client());
        return "register-client";
    }

    @PostMapping("/register")
    public String registerClient(@ModelAttribute("client") Client client) {
        clientService.register(client);
        return "redirect:/client/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login-client";
    }
}
