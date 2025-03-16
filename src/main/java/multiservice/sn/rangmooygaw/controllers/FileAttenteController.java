package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.repository.FileAttenteRepository;
import multiservice.sn.rangmooygaw.repository.TicketRepository;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import multiservice.sn.rangmooygaw.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class FileAttenteController {

    @GetMapping("/file-attente")
    public String fileAttentePage() {
        return "file-attente"; // Doit correspondre au fichier fileAttente.jsp
    }
}
