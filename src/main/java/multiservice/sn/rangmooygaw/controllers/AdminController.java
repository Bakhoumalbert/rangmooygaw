package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.Application;
import multiservice.sn.rangmooygaw.modele.Queue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
public class AdminController {

    private final Application.QueueService queueService;

    public AdminController(Application.QueueService queueService) {
        this.queueService = queueService;
    }

    @GetMapping("/admin")
    public String adminInterface(Model model) {
        model.addAttribute("queues", queueService.getAllQueues());
        return "admin";
    }
}
