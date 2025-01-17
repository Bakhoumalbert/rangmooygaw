package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.repository.FileAttenteRepository;
import multiservice.sn.rangmooygaw.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;

    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public Ticket saveTicket(Ticket ticket) {
        return ticketRepository.save(ticket);
    }

    @Autowired
    private FileAttenteRepository fileAttenteRepository;

    public Ticket generateTicket(Long serviceId, Long localisationId) {
        // Récupérer la file d'attente correspondante
        FileAttente fileAttente = fileAttenteRepository.findByServiceIdAndAgenceId(serviceId, localisationId)
                .orElseThrow(() -> new RuntimeException("File d'attente introuvable"));

        // Générer un nouveau ticket
        Ticket ticket = new Ticket();
        ticket.setNumero(fileAttente.getNumeroEnCours() + 1); // Générer un numéro de ticket
        ticket.setPosition(fileAttente.getTickets().size() + 1); // Position dans la file
        ticket.setPersonnesDevant(ticket.getPosition() - 1);
        ticket.setNumeroActuel(fileAttente.getNumeroEnCours());
        ticket.setFileAttente(fileAttente);

        // Enregistrer le ticket
        ticketRepository.save(ticket);

        // Mettre à jour la file d'attente
        fileAttente.incrementerNumero();
        return ticket;
    }
}
