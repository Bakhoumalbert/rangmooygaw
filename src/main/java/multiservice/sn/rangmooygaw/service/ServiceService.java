package multiservice.sn.rangmooygaw.service;


import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.entite.Services;
import multiservice.sn.rangmooygaw.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    public List<Services> getAllServices() {
        return serviceRepository.findAll();
    }

    public Services saveService(Services services) {
        return serviceRepository.save(services);
    }

    public Optional<Services> getServiceById(Long id) {
        return serviceRepository.findById(id);
    }

    public void deleteService(Long id) {
        serviceRepository.deleteById(id);
    }
}

