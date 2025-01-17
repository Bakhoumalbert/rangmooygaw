package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.List;

@Entity
public class FileAttente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFileAttente;

    @Temporal(TemporalType.DATE)
    private Date dateCreation;

    @Column(nullable = false)
    private int numeroEnCours;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idService", nullable = false)
    private Service service;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idAgence", nullable = false)
    private Agence agence;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idAdmin", nullable = false)
    private Admin admin;

    @OneToMany(mappedBy = "fileAttente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Ticket> tickets;
    // Méthodes spécifiques
    public void incrementerNumero() {
        this.numeroEnCours++;
    }

    public void decrementerNumero() {
        if (this.numeroEnCours > 0) {
            this.numeroEnCours--;
        }
    }

    // Getters et setters

    public Long getIdFileAttente() {
        return idFileAttente;
    }

    public void setIdFileAttente(Long idFileAttente) {
        this.idFileAttente = idFileAttente;
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

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Agence getAgence() {
        return agence;
    }

    public void setAgence(Agence agence) {
        this.agence = agence;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    // Méthode toString pour débogage
    @Override
    public String toString() {
        return "FileAttente{" +
                "idFileAttente=" + idFileAttente +
                ", dateCreation=" + dateCreation +
                ", numeroEnCours=" + numeroEnCours +
                ", service=" + (service != null ? service.getNom() : "null") +
                ", agence=" + (agence != null ? agence.getLocalisation() : "null") +
                ", admin=" + (admin != null ? admin.getNom() : "null") +
                '}';
    }
}
