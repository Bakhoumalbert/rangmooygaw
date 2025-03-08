package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.service.AgenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/agence")
public class AgenceController {
    @Autowired
    private AgenceService agenceService;

    @GetMapping
    public List<Agence> getAllAgences() {
        return agenceService.getAllAgences();
    }

    @PostMapping
    public Agence saveAgence(@RequestBody Agence agence) {
        return agenceService.saveAgence(agence);
    }

}

