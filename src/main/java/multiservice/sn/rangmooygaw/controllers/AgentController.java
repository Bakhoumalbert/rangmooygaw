package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.Agent;
import multiservice.sn.rangmooygaw.service.AgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/agents")
public class AgentController {
    @Autowired
    private AgentService agentService;

    @GetMapping
    public List<Agent> getAllAgents() {
        return agentService.getAllAgents();
    }

    @PostMapping
    public Agent saveAgent(@RequestBody Agent agent) {
        return agentService.saveAgent(agent);
    }
}
