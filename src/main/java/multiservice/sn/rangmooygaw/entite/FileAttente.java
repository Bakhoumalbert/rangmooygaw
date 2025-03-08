package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class FileAttente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFileAttente;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreation;

    private int numeroEnCours = 0; // Numéro actuellement en traitement

    @ManyToOne
    @JoinColumn(name = "id_service", nullable = false)
    private Services service;

    @ManyToOne
    @JoinColumn(name = "id_agence", nullable = false)
    private Agence agence;

    @OneToMany(mappedBy = "fileAttente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Ticket> tickets = new ArrayList<>();

    // Générer un nouveau numéro de ticket
    public int genererTicket() {
        return tickets.size() + 1;
    }

    public Long getId() {
        return idFileAttente;
    }

    public void setId(Long id) {
        this.idFileAttente = id;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }

    public int getNumeroEnCours() {
        return numeroEnCours;
    }

    public void setNumeroEnCours(int numeroEnCours) {
        this.numeroEnCours = numeroEnCours;
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

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public String getIdFileAttente() {
        return idFileAttente.toString();
    }

    public void incrementerNumero() {
        this.numeroEnCours++;
    }

    public void decrementerNumero() {
        if (this.numeroEnCours > 0) {
            this.numeroEnCours--;
        }
    }
}
