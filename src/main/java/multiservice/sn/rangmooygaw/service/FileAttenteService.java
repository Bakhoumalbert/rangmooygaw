package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.repository.FileAttenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileAttenteService {
    @Autowired
    private FileAttenteRepository fileAttenteRepository;

    public List<FileAttente> getAllFiles() {
        return fileAttenteRepository.findAll();
    }

    public FileAttente saveFileAttente(FileAttente fileAttente) {
        return fileAttenteRepository.save(fileAttente);
    }

    public FileAttente getFileAttente(Long serviceId, Long agenceId) {
        return fileAttenteRepository.findByServiceIdAndAgenceId(serviceId, agenceId)
                .orElseThrow(() -> new RuntimeException("File d'attente introuvable pour le service et l'agence spécifiés."));
    }

    // Récupérer les localisations d'un service
    public List<Agence> getLocalisationsByServiceId(Long serviceId) {
        return fileAttenteRepository.findAll().stream()
                .filter(file -> file.getService().getIdService().equals(serviceId))
                .map(FileAttente::getAgence)
                .distinct()
                .toList();
    }
}
