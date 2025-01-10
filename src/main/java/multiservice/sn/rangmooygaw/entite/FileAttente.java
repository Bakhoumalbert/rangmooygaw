package multiservice.sn.rangmooygaw.entite;


import jakarta.persistence.*;


import java.util.Date;
import java.util.List;

@Entity
public class FileAttente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFileAttente;

//    @Temporal(TemporalType.DATE)
//    private Date dateCreation;

    @Temporal(TemporalType.DATE)
    private java.util.Date dateCreation;

    @Column(name = "idService", insertable = false, updatable = false)
    private Long idService;

    @ManyToOne
    @JoinColumn(name = "idService")
    private Service service;

    @Column(name = "idAgence", insertable = false, updatable = false)
    private Long idAgence;

    private int numeroEnCours;

    @ManyToOne
    @JoinColumn(name = "idAdmin")
    private Admin admin;

    @OneToMany(mappedBy = "fileAttente")
    private List<Ticket> tickets;

    // Méthodes pour incrémenter/décrémenter le numéro
    public void incrementerNumero() {
        this.numeroEnCours++;
    }

    public void decrementerNumero() {
        this.numeroEnCours--;
    }

    // Getters et setters
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

    public Long getServiceId() {
        return idService;
    }

    public void setServiceId(Long serviceId) {
        this.idService = serviceId;
    }

    public Long getAgenceId() {
        return idAgence;
    }

    public void setAgenceId(Long agenceId) {
        this.idAgence = agenceId;
    }

    public int getNumeroEnCours() {
        return numeroEnCours;
    }

    public void setNumeroEnCours(int numeroEnCours) {
        this.numeroEnCours = numeroEnCours;
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


    @ManyToOne
    @JoinColumn(name = "idAgence")
    private Agence agence;

    // Getters et setters
    public Long getIdFileAttente() {
        return idFileAttente;
    }

    public void setIdFileAttente(Long idFileAttente) {
        this.idFileAttente = idFileAttente;
    }

    public Long getIdService() {
        return idService;
    }

    public void setIdService(Long idService) {
        this.idService = idService;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Long getIdAgence() {
        return idAgence;
    }

    public void setIdAgence(Long idAgence) {
        this.idAgence = idAgence;
    }

    public Agence getAgence() {
        return agence;
    }

    public void setAgence(Agence agence) {
        this.agence = agence;
    }



}

