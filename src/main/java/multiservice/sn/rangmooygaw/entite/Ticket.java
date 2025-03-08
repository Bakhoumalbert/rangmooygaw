package multiservice.sn.rangmooygaw.entite;


import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_client") // Clé étrangère dans la table Ticket
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_fille_attente")
    private FileAttente fileAttente;

    @ManyToOne
    @JoinColumn(name = "id_service")
    private Services service;

    @ManyToOne
    @JoinColumn(name = "id_agence")
    private Agence agence;

    private int position; // Position dans la file

    private boolean enCoursDeTraitement = false; // True si l'agent est en train de traiter ce ticket

    private boolean traite = false; // True si le ticket a été traité

    private LocalDateTime dateCreation = LocalDateTime.now();

    // Getters & Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Services getServices() {
        return service;
    }

    public void setServices(Services services) {
        this.service = services;
    }

    public Services getService() {
        return service;
    }

    public void setService(Services service) {
        this.service = service;
    }

    public Agence getAgence() {
        return agence;
    }

    public void setAgence(Agence agence) {
        this.agence = agence;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public boolean isEnCoursDeTraitement() {
        return enCoursDeTraitement;
    }

    public void setEnCoursDeTraitement(boolean enCoursDeTraitement) {
        this.enCoursDeTraitement = enCoursDeTraitement;
    }

    public boolean isTraite() {
        return traite;
    }

    public void setTraite(boolean traite) {
        this.traite = traite;
    }

    public LocalDateTime getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDateTime dateCreation) {
        this.dateCreation = dateCreation;
    }
}
