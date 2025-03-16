package multiservice.sn.rangmooygaw.entite;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JsonIgnoreProperties("tickets") // 🔥 Ignore la liste des tickets du client
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

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 🔥 Format explicite pour JSON
    private LocalDateTime dateCreation;

    @Column(unique = true)
    private String numero;

    private String statut;

    @PrePersist
    public void genererNumero() {
        this.numero = "T-" + System.currentTimeMillis();
    }

    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }

    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }

    // Getters & Setters


    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public FileAttente getFileAttente() {
        return fileAttente;
    }

    public void setFileAttente(FileAttente fileAttente) {
        this.fileAttente = fileAttente;
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
