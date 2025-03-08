package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.config.TicketWebSocketHandler;
import multiservice.sn.rangmooygaw.entite.*;
import multiservice.sn.rangmooygaw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketHandler;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class FileAttenteService {
    @Autowired
    private FileAttenteRepository fileAttenteRepository;
    @Autowired
    private TicketWebSocketHandler ticketWebSocketHandler;

//    public FileAttente getOrCreateFile(Long serviceId, Long agenceId) {
//        return fileAttenteRepository.findByService_IdServiceAndAgence_IdAgence(serviceId, agenceId)
//                .orElseGet(() -> {
//                    FileAttente file = new FileAttente();
//                    file.setService(new Services());
//                    file.setAgence(new Agence());
//                    file.setDateCreation(new Date());
//                    return fileAttenteRepository.save(file);
//                });
//    }
//
//    public void incrementerNumeroEnCours(Long fileId) {
//
//    }

//    public void testFindFileAttente() {
//        Long serviceId = 1L;
//        Long agenceId = 1L;
//        Optional<FileAttente> fileAttente = fileAttenteRepository.findByService_IdServiceAndAgence_IdAgence(serviceId, agenceId);
//
//        fileAttente.ifPresentOrElse(
//                f -> System.out.println("File d'attente trouvée : " + f.getIdFileAttente()),
//                () -> System.out.println("Aucune file d'attente trouvée pour Service ID: " + serviceId + " et Agence ID: " + agenceId)
//        );
//    }

//    public void avancerFile(Long idService, Long idAgence) {
//        Optional<FileAttente> fileOpt = fileAttenteRepository.findByService_IdServiceAndAgence_IdAgence(idService, idAgence);
//        if (fileOpt.isPresent()) {
//            FileAttente fileAttente = fileOpt.get();
//            fileAttente.incrementerNumero();
//            fileAttenteRepository.save(fileAttente);
//        }
//    }

    public void avancerFile(Long idService, Long idAgence) {
        Optional<FileAttente> fileOpt = fileAttenteRepository.findByService_IdServiceAndAgence_IdAgence(idService, idAgence);
        if (fileOpt.isPresent()) {
            FileAttente fileAttente = fileOpt.get();
            fileAttente.incrementerNumero();
            fileAttenteRepository.save(fileAttente);

            // Notifier tous les clients via WebSockets
            try {
                ticketWebSocketHandler.sendUpdate("Le numéro en cours est maintenant : " + fileAttente.getNumeroEnCours());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public List<FileAttente> getAllFiles() {
        return fileAttenteRepository.findAll();
    }

//    public Optional<FileAttente> getFileAttente(Long idService, Long idAgence) {
//
//    }
}

