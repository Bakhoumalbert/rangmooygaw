package multiservice.sn.rangmooygaw.entite;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
public class Agent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_agent;

    private String nom;
    private String email;

    @ManyToOne
    @JoinColumn(name = "id_agence", nullable = false) // Supprimé `insertable = false, updatable = false`
    private Agence agence;

    // Getters et Setters
    public Long getId_agent() {
        return id_agent;
    }

    public void setId_agent(Long idAgent) {
        this.id_agent = idAgent;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Agence getAgence() {
        return agence;
    }

    public void setAgence(Agence agence) {
        this.agence = agence;
    }
}

