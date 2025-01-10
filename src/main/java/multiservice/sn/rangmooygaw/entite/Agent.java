package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;

@Entity
public class Agent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAgent;

    private String nom;
    private String email;

    @ManyToOne
    @JoinColumn(name = "idAgence", insertable = false, updatable = false)
    private Agence agence;

    @Column(name = "idAgence")
    private Long idAgence;

    // Méthodes spécifiques
    public int voirNumeroEnCours(FileAttente fileAttente) {
        return fileAttente.getNumeroEnCours();
    }

    public void suivantClient(FileAttente fileAttente) {
        fileAttente.incrementerNumero();
    }

    public void precedentClient(FileAttente fileAttente) {
        fileAttente.decrementerNumero();
    }

    // Getters et setters
    public Long getIdAgent() {
        return idAgent;
    }

    public void setIdAgent(Long idAgent) {
        this.idAgent = idAgent;
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

    public Long getIdAgence() {
        return idAgence;
    }

    public void setIdAgence(Long idAgence) {
        this.idAgence = idAgence;
    }
}
