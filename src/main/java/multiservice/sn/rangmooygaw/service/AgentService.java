package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Agent;
import multiservice.sn.rangmooygaw.repository.AgentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgentService {
    @Autowired
    private AgentRepository agentRepository;

    public List<Agent> getAllAgents() {
        return agentRepository.findAll();
    }

    public Agent saveAgent(Agent agent) {
        return agentRepository.save(agent);
    }
}
