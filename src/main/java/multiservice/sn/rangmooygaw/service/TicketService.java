package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.*;
import multiservice.sn.rangmooygaw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private SimpMessagingTemplate messagingTemplate; // Injecte WebSocket


    @Autowired
    private AgenceRepository agenceRepository;

    public Ticket creerTicket(Long serviceId, Long agenceId) {
        Services service =  serviceRepository.findById(serviceId)
                .orElseThrow(() -> new RuntimeException("Service introuvable"));

        Agence agence = agenceRepository.findById(agenceId)
                .orElseThrow(() -> new RuntimeException("Agence introuvable"));

        // Calculer la position dans la file
        int position = ticketRepository.countByServiceAndAgence(service, agence) + 1;

        Ticket ticket = new Ticket();
        ticket.setService(service);
        ticket.setAgence(agence);
        ticket.setPosition(position);

        return ticketRepository.save(ticket);
    }

    public Ticket appelerClientSuivant(Long agenceId, Long serviceId) {
        Agence agence = agenceRepository.findById(agenceId)
                .orElseThrow(() -> new RuntimeException("Agence introuvable"));

        Services service = serviceRepository.findById(serviceId)
                .orElseThrow(() -> new RuntimeException("Service introuvable"));

        List<Ticket> tickets = ticketRepository.findByAgenceAndServiceAndTraiteFalseOrderByPositionAsc(agence   , service);

        if (tickets.isEmpty()) {
            throw new RuntimeException("Aucun client en attente");
        }

        Ticket ticket = tickets.get(0);
        ticket.setEnCoursDeTraitement(true);
        ticketRepository.save(ticket);

        return ticket;
    }

}
