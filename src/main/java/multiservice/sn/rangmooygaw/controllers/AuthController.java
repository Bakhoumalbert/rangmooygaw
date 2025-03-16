package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.config.JwtUtil;
import multiservice.sn.rangmooygaw.entite.LoginRequest;
import multiservice.sn.rangmooygaw.entite.Utilisateur;
import multiservice.sn.rangmooygaw.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<?> authenticate(@RequestBody LoginRequest loginRequest) {
        try {

            // Vérifier l'utilisateur en base
            Utilisateur utilisateur = utilisateurRepository.findByEmail(loginRequest.getEmail())
                    .orElseThrow(() -> new UsernameNotFoundException("Utilisateur non trouvé"));


            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getMotDePasse())
            );

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtUtil.generateToken((UserDetails) authentication.getPrincipal());

            return ResponseEntity.ok(new AuthResponse(jwt));

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Échec de l'authentification");
        }
    }



    @PostMapping("/register")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<?> register(@RequestBody Utilisateur utilisateur) {
        utilisateur.setMotDePasse(passwordEncoder.encode(utilisateur.getMotDePasse())); // Hash du mot de passe

        utilisateurRepository.save(utilisateur);
        return ResponseEntity.ok("Utilisateur inscrit avec succès !");
    }


}
