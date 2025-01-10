package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import multiservice.sn.rangmooygaw.repository.FileAttenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileAttenteService {
    @Autowired
    private FileAttenteRepository fileAttenteRepository;

    public List<FileAttente> getAllFiles() {
        return fileAttenteRepository.findAll();
    }

    public FileAttente saveFileAttente(FileAttente fileAttente) {
        return fileAttenteRepository.save(fileAttente);
    }
}
