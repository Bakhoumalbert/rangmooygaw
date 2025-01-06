package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.service.QueueService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AgentController {

    private final QueueService queueService;

    public AgentController(QueueService queueService) {
        this.queueService = queueService;
    }

    @GetMapping("/agent")
    public String agentInterface(@RequestParam(value = "location", required = false) String location, Model model) {
        if (location == null || location.isEmpty()) {
            location = "Dakar Plateau"; // Localisation par défaut
        }
        model.addAttribute("location", location);
        model.addAttribute("currentNumber", queueService.getQueue(location).getCurrentNumber());
        model.addAttribute("queues", queueService.getAllQueues());
        return "agent";
    }

    @PostMapping("/agent/{location}/next")
    public String nextClient(@PathVariable String location, Model model) {
        queueService.nextClient(location);
        return "redirect:/agent?location=" + location;
    }

    @PostMapping("/agent/{location}/previous")
    public String previousClient(@PathVariable String location, Model model) {
        queueService.previousClient(location);
        return "redirect:/agent?location=" + location;
    }
}