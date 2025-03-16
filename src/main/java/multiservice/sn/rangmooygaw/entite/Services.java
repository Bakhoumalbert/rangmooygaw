package multiservice.sn.rangmooygaw.entite;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Services {
    // Getters et setters
    @Setter
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_service") // Assure-toi que le nom de colonne est correct
    private Long idService;

    @Getter
    @Column(nullable = false, length = 100)
    private String nom;

    @Column(length = 255)
    private String description;

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Ticket> tickets = new ArrayList<>();

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FileAttente> filesAttente;

    @ManyToMany(mappedBy = "services")
    private List<Agence> agences = new ArrayList<>();


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
