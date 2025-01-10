package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.repository.AgenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgenceService {
    @Autowired
    private AgenceRepository agenceRepository;

    public List<Agence> getAllAgences() {
        return agenceRepository.findAll();
    }

    public Agence saveAgence(Agence agence) {
        return agenceRepository.save(agence);
    }
}

