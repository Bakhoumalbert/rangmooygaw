package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.modele.Localisation;
import multiservice.sn.rangmooygaw.modele.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class HomeController {

//    private final JsonDataLoader jsonDataLoader;
//
//    public HomeController(JsonDataLoader jsonDataLoader) {
//        this.jsonDataLoader = jsonDataLoader;
//    }
//
//
//    @GetMapping
//    public String getHome(Model model) {
//        String home = "Bienvenue dans la gestion de file d'attente!";
//        model.addAttribute("home", home);
//        return "home";
//    }
//
//    @GetMapping("/services")
//    public List<Service> getServices() {
//        return jsonDataLoader.getServices();
//    }
//
//    @GetMapping("/services/{id}/localisations")
//    public List<Localisation> getLocalisationsByServiceId(@PathVariable int id) {
//        return jsonDataLoader.getLocalisationsByServiceId(id);
//    }
}

