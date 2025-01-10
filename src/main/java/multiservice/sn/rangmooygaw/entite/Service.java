import jakarta.persistence.*;
import multiservice.sn.rangmooygaw.entite.FileAttente;

import java.util.List;

@Entity
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String description;

    @OneToMany(mappedBy = "service")
    private List<FileAttente> filesAttente;

    // Getters et setters
}
