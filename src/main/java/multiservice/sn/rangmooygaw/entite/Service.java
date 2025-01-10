package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;
import multiservice.sn.rangmooygaw.entite.FileAttente;

import java.util.List;

@Entity
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idService;

    private String nom;
    private String description;

//    @OneToMany(mappedBy = "service")
//    private List<FileAttente> filesAttente;

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL)
    private List<FileAttente> filesAttente;

    // Getters et setters


    public Long getId() {
        return idService;
    }

    public void setId(Long id) {
        this.idService = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<FileAttente> getFilesAttente() {
        return filesAttente;
    }

    public void setFilesAttente(List<FileAttente> filesAttente) {
        this.filesAttente = filesAttente;
    }
}
