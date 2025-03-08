package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Agent;
import multiservice.sn.rangmooygaw.entite.Ticket;
import multiservice.sn.rangmooygaw.service.AgentService;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import multiservice.sn.rangmooygaw.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import java.util.List;

@Controller
@RequestMapping("/agent")
public class AgentController {

    @Autowired
    private FileAttenteService fileAttenteService;

    @PostMapping("/avancer-file")
    public ResponseEntity<Void> avancerFile(@RequestParam Long idService, @RequestParam Long idAgence) {
        fileAttenteService.avancerFile(idService, idAgence);
        return ResponseEntity.ok().build();
    }
}
