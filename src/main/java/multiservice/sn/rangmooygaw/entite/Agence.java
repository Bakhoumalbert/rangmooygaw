package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Agence {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_service")
    private Long idAgence;

    private String nom;
    private String localisation;

    @OneToMany(mappedBy = "agence", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Agent> agents = new ArrayList<>();


    @ManyToMany
    @JoinTable(
            name = "agence_services",
            joinColumns = @JoinColumn(name = "id_agence"),
            inverseJoinColumns = @JoinColumn(name = "id_service")
    )
    private List<Services> services = new ArrayList<>();

    @OneToMany(mappedBy = "agence", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FileAttente> filesAttente = new ArrayList<>();


    // ✅ Getters et Setters
    public Long getIdAgence() {
        return idAgence;
    }

    public void setIdAgence(Long id_agence) {
        this.idAgence = id_agence;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public List<Agent> getAgents() {
        return agents;
    }

    public void setAgents(List<Agent> agents) {
        this.agents = agents;
    }

    public List<Services> getServices() {
        return services;
    }

    public void setServices(List<Services> services) {
        this.services = services;
    }

    public List<FileAttente> getFilesAttente() {
        return filesAttente;
    }

    public void setFilesAttente(List<FileAttente> filesAttente) {
        this.filesAttente = filesAttente;
    }
}
