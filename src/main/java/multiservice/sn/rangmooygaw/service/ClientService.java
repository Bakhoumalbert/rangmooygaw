package multiservice.sn.rangmooygaw.service;

import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;

    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    public Client saveClient(Client client) {
        return clientRepository.save(client);
    }

    public Optional<Client> getClientById(Long id) {
        return clientRepository.findById(id);
    }

    public void updateClient(Client client) {
        clientRepository.save(client);
    }

    public void deleteClient(Long id) {
        clientRepository.deleteById(id);
    }

    public void register(Client client) {
        // Vérifier si l'email est déjà utilisé
        Optional<Client> existingClient = clientRepository.findByEmail(client.getEmail());
        if (existingClient.isPresent()) {
            throw new RuntimeException("Un compte avec cet email existe déjà !");
        }

        // Enregistrement du client
        clientRepository.save(client);
    }
}

