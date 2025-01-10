package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAdmin;

    private String nom;
    private String email;

    @OneToMany(mappedBy = "admin")
    private List<FileAttente> filesAttente;

    // Getters et setters

    public Long getId() {
        return idAdmin;
    }

    public void setId(Long id) {
        this.idAdmin = id;
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

    public List<FileAttente> getFilesAttente() {
        return filesAttente;
    }

    public void setFilesAttente(List<FileAttente> filesAttente) {
        this.filesAttente = filesAttente;
    }
}

