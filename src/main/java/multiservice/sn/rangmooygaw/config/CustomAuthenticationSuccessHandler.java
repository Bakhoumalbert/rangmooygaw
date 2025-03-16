package multiservice.sn.rangmooygaw.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;
import java.util.Collection;

//@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        // Récupérer le rôle de l'utilisateur connecté
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        String redirectURL = request.getContextPath();

        if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("ADMIN"))) {
            redirectURL = "/admin";
        } else if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("AGENT"))) {
            redirectURL = "/agent";
        } else if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("CLIENT"))) {
            redirectURL = "/client";
        } else {
            redirectURL = "/"; // Par défaut
        }

        response.sendRedirect(redirectURL);

    }
}
