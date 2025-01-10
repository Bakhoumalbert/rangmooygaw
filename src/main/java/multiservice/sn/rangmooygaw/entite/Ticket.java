package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;

@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTicket;

    private int numero;
    private int position;
    private int personnesDevant;
    private int numeroActuel;

    @ManyToOne
    @JoinColumn(name = "file_attente_id")
    private FileAttente fileAttente;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    // Méthode pour générer un numéro
    public void genererNumero() {
        this.numero = (int) (Math.random() * 10000); // Exemple simple
    }

    // Getters et setters

    public Long getId() {
        return idTicket;
    }

    public void setId(Long id) {
        this.idTicket = id;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getPersonnesDevant() {
        return personnesDevant;
    }

    public void setPersonnesDevant(int personnesDevant) {
        this.personnesDevant = personnesDevant;
    }

    public int getNumeroActuel() {
        return numeroActuel;
    }

    public void setNumeroActuel(int numeroActuel) {
        this.numeroActuel = numeroActuel;
    }

    public FileAttente getFileAttente() {
        return fileAttente;
    }

    public void setFileAttente(FileAttente fileAttente) {
        this.fileAttente = fileAttente;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }
}

