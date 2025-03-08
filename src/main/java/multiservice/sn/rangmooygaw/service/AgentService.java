package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Agent;
import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.repository.AgentRepository;
import multiservice.sn.rangmooygaw.repository.FileAttenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AgentService {
    @Autowired
    private AgentRepository agentRepository;

//    public void suivantClient(Long idFileAttente) {
//        Optional<FileAttente> fileAttenteOpt = fileAttenteRepository.findById(idFileAttente);
//        if (fileAttenteOpt.isPresent()) {
//            FileAttente fileAttente = fileAttenteOpt.get();
//            fileAttente.setNumeroEnCours(fileAttente.getNumeroEnCours() + 1);
//            fileAttenteRepository.save(fileAttente);
//        }
//    }
//
//    public void precedentClient(Long idFileAttente) {
//        Optional<FileAttente> fileAttenteOpt = fileAttenteRepository.findById(idFileAttente);
//        if (fileAttenteOpt.isPresent()) {
//            FileAttente fileAttente = fileAttenteOpt.get();
//            fileAttente.setNumeroEnCours(Math.max(0, fileAttente.getNumeroEnCours() - 1));
//            fileAttenteRepository.save(fileAttente);
//        }
//    }


    public List<Agent> getAllAgents() {
        return agentRepository.findAll();
    }

//    public List<Agent> getAgentsByAgence(Long agenceId) {
//        return agentRepository.findByAgenceId(agenceId);
//    }

    public Agent saveAgent(Agent agent) {
        return agentRepository.save(agent);
    }

    // Supprimer un agent par ID
    public void deleteAgentById(Long id) {
        agentRepository.deleteById(id);
    }

    public Optional<Agent> getAgentById(Long id) {
        return agentRepository.findById(id);
    }
}
