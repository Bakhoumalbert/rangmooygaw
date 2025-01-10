package multiservice.sn.rangmooygaw.service;



import multiservice.sn.rangmooygaw.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    public List<multiservice.sn.rangmooygaw.entite.Service> getAllServices() {
        return serviceRepository.findAll();
    }

//    public Service saveService(Service service) {
//        return serviceRepository.save(service);
//    }
}

