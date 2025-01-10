package multiservice.sn.rangmooygaw.controllers;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.service.FileAttenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/files")
public class FileAttenteController {
    @Autowired
    private FileAttenteService fileAttenteService;

    @GetMapping
    public List<FileAttente> getAllFiles() {
        return fileAttenteService.getAllFiles();
    }

    @PostMapping
    public FileAttente saveFile(@RequestBody FileAttente fileAttente) {
        return fileAttenteService.saveFileAttente(fileAttente);
    }
}

