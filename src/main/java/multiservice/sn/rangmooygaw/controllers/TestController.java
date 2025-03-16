package multiservice.sn.rangmooygaw.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestController {

    @GetMapping("/admin")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String adminAccess() {
        return "Bienvenue ADMIN 🛠️";
    }

    @GetMapping("/agent")
    @PreAuthorize("hasAuthority('AGENT')")
    public String agentAccess() {
        return "Bienvenue AGENT 📦";
    }

    @GetMapping("/client")
    @PreAuthorize("hasAuthority('CLIENT')")
    public String clientAccess() {
        return "Bienvenue CLIENT 🛒";
    }
}
