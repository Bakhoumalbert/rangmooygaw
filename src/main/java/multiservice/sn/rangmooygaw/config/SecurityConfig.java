package multiservice.sn.rangmooygaw.config;

import multiservice.sn.rangmooygaw.entite.Utilisateur;
import multiservice.sn.rangmooygaw.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.util.Collections;

@EnableWebSecurity
@Configuration
public class SecurityConfig {

    @Autowired
    private UtilisateurRepository utilisateurRepository;


    // 🔹 Configuration pour les pages JSP avec sessions
    // @Bean
    // public SecurityFilterChain webSecurityFilterChain(HttpSecurity http) throws Exception {
    //     http
    //             .csrf(csrf -> csrf.disable())
    //             .authorizeHttpRequests(auth -> auth
    //                     .requestMatchers("/auth/**", "/dashboard").permitAll()
    //                     .anyRequest().authenticated()
    //             )
    //             .formLogin(form -> form
    //                     .loginPage("/auth/login")
    //                     .defaultSuccessUrl("/dashboard", true)
    //                     .permitAll()
    //             )
    //             .logout(logout -> logout
    //                     .logoutUrl("/logout")
    //                     .logoutSuccessUrl("/auth/login?logout=true")
    //                     .permitAll()
    //             )
    //             .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
    //             .authenticationProvider(authenticationProvider());

    //     return http.build();
    // }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())  // Désactive CSRF
            .authorizeHttpRequests(auth -> auth
                    .requestMatchers("/auth/**", "/WEB-INF/jsp/**").permitAll()  // ✅ Autoriser l'accès aux pages JSP
                    .requestMatchers("/auth/**").permitAll()  // ✅ Autoriser accès aux pages d'authentification
                    .requestMatchers("/dashboard").authenticated()  // ✅ Un utilisateur connecté peut accéder au dashboard
                    .requestMatchers("/admin/**").hasAuthority("ADMIN")  // ✅ Uniquement ADMIN
                    .requestMatchers("/agent/**").hasAuthority("AGENT")  // ✅ Uniquement AGENT
                    .requestMatchers("/client/**").hasAuthority("CLIENT")  // ✅ Uniquement CLIENT
                    .anyRequest().authenticated()
            )
            .formLogin(form -> form
                    .loginPage("/auth/login")
                            .successHandler(customAuthenticationSuccessHandler())
                            .failureUrl("/auth/login?error=true")
                    .permitAll()
            )
            .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/auth/login?logout=true") // ✅ Redirige après déconnexion
                    .permitAll()
            );



        return http.build();
    }




    // 🔹 Configuration pour l'API REST avec JWT
//    @Bean
//    public SecurityFilterChain apiSecurityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(auth -> auth
//                        .anyRequest().permitAll()
//                        .requestMatchers("/**").permitAll()
//                        .requestMatchers("/api/auth/**").permitAll()
//                        .requestMatchers("/api/admin/**").hasAuthority("ADMIN")
//                        .requestMatchers("/api/agent/**").hasAuthority("AGENT")
//                        .requestMatchers("/api/client/**").hasAuthority("CLIENT")
//                        .anyRequest().authenticated()
//                )
//                .formLogin(form -> form
//                    .loginPage("/auth/login")  // ✅ Page de connexion JSP
//                    .defaultSuccessUrl("/dashboard", true)  // ✅ Redirection après connexion
//                    .permitAll()
//                )
//                .logout(logout -> logout
//                    .logoutUrl("/logout")
//                    .logoutSuccessUrl("/auth/login?logout=true")
//                    .permitAll()
//                )
//                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));
//
//
//        return http.build();
//    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService(utilisateurRepository));
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

//    @Bean
//    public UserDetailsService userDetailsService() {
//        return new UserDetailsService() {
//
//            private UtilisateurRepository utilisateurRepository;
//
//            @Override
//            public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//                Utilisateur utilisateur = utilisateurRepository.findByEmail(email)
//                        .orElseThrow(() -> new UsernameNotFoundException("Utilisateur non trouvé"));
//
//                return new User(utilisateur.getEmail(), utilisateur.getMotDePasse(),
//                        Collections.singleton(new SimpleGrantedAuthority(utilisateur.getRole().name())));
//            }
//        };
//    }


    @Bean
    public UserDetailsService userDetailsService(UtilisateurRepository utilisateurRepository) {
        return email -> {
            Utilisateur utilisateur = utilisateurRepository.findByEmail(email)
                    .orElseThrow(() -> new UsernameNotFoundException("Utilisateur non trouvé : " + email));

            System.out.println("✅ Utilisateur trouvé : " + utilisateur.getEmail());
            System.out.println("🔑 Mot de passe en base : " + utilisateur.getMotDePasse());

            return new User(utilisateur.getEmail(), utilisateur.getMotDePasse(),
                    Collections.singleton(new SimpleGrantedAuthority(utilisateur.getRole().name())));
        };
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler();
    }

}
