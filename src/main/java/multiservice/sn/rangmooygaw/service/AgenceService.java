package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.repository.AgenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AgenceService {
    @Autowired
    private AgenceRepository agenceRepository;

    /**
     * Récupère toutes les agences.
     */
    public List<Agence> getAllAgences() {
        return agenceRepository.findAll();
    }

    /**
     * Sauvegarde une nouvelle agence ou met à jour une agence existante.
     */
    public Agence saveAgence(Agence agence) {
        return agenceRepository.save(agence);
    }

    /**
     * Récupère une agence par son ID avec gestion des erreurs.
     */
    public Optional<Agence> getAgenceById(Long id) {
        return agenceRepository.findById(id);
    }

    /**
     * Supprime une agence après vérification.
     */
    public void deleteAgence(Long id) {
        if (agenceRepository.existsById(id)) {
            agenceRepository.deleteById(id); // ✅ Supprime l'agence
        } else {
            throw new IllegalArgumentException("Agence introuvable !");
        }
    }

    public Optional<Agence> findByNom(String nom) {
        return agenceRepository.findByNom(nom);
    }

}
