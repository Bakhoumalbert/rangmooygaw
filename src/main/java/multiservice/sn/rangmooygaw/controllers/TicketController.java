package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import multiservice.sn.rangmooygaw.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/tickets")
public class TicketController {
    @Autowired
    private TicketService ticketService;

    @PostMapping("/nouveau")
    public ResponseEntity<Ticket> creerTicket(@RequestParam Long serviceId, @RequestParam Long agenceId) {
        Ticket ticket = ticketService.creerTicket(serviceId, agenceId);
        return ResponseEntity.ok(ticket);
    }

    @PostMapping("/suivant")
    public ResponseEntity<Ticket> appelerClientSuivant(@RequestParam Long agenceId, @RequestParam Long serviceId) {
        Ticket ticket = ticketService.appelerClientSuivant(agenceId, serviceId);
        return ResponseEntity.ok(ticket);
    }
}
