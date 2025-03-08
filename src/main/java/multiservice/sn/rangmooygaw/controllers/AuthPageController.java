package multiservice.sn.rangmooygaw.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthPageController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // ✅ Affiche WEB-INF/jsp/login.jsp
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // ✅ Affiche WEB-INF/jsp/register.jsp
    }
}
