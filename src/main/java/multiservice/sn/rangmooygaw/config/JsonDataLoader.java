package multiservice.sn.rangmooygaw.config;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
public class JsonDataLoader {

    private final List<Map<String, Object>> services;
    private final Map<String, List<String>> localisations;
    private final Map<String, List<String>> agencies;
    //private final Map<String, List<Map<String, Object>>> clients;
    private final Map<String, Map<String, Integer>> ticketStatus;

    public JsonDataLoader() throws IOException {
        // Charger le fichier JSON à partir du classpath
        ObjectMapper objectMapper = new ObjectMapper();
        ClassPathResource resource = new ClassPathResource("data.json");

        // Lire tout le contenu en un seul objet
        Map<String, Object> data = objectMapper.readValue(resource.getInputStream(), new TypeReference<>() {});

        // Mapper les données aux types spécifiques avec TypeReference
        this.services = objectMapper.convertValue(data.get("services"), new TypeReference<List<Map<String, Object>>>() {});
        this.localisations = objectMapper.convertValue(data.get("localisations"), new TypeReference<Map<String, List<String>>>() {});
        this.agencies = objectMapper.convertValue(data.get("agencies"), new TypeReference<Map<String, List<String>>>() {});
        //this.clients = objectMapper.convertValue(data.get("clients"), new TypeReference<Map<String, List<Map<String, Object>>>>() {});
        this.ticketStatus = objectMapper.convertValue(data.get("ticketStatus"), new TypeReference<Map<String, Map<String, Integer>>>() {});
    }

    public Map<String, List<String>> getLocalisations() {
        return this.localisations; // Vérifiez que cette structure est initialisée correctement
    }
    
    public Map<String, List<String>> getAgencies() {
        return this.agencies;
    }

    // Méthode pour récupérer les services
    public List<Map<String, Object>> getServices() {
        return services;
    }

    

    // Méthode pour récupérer l'état des tickets
    public Map<String, Map<String, Integer>> getTicketStatus() {
        return ticketStatus;
    }
}
