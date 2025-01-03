package multiservice.sn.rangmooygaw.config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class JsonDataLoader {

    private final List<Map<String, Object>> services;
    private final Map<String, List<String>> localisations;

    public JsonDataLoader(ResourceLoader resourceLoader) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        Resource resource = resourceLoader.getResource("classpath:data.json");

        if (!resource.exists()) {
            throw new IOException("Fichier data.json introuvable dans le classpath");
        }

        // Désérialisation typée avec TypeReference
        Map<String, Object> data = objectMapper.readValue(
                resource.getInputStream(),
                new TypeReference<Map<String, Object>>() {}
        );

        // Désérialisation avec typage sécurisé
        this.services = objectMapper.convertValue(data.get("services"), new TypeReference<List<Map<String, Object>>>() {});
        this.localisations = objectMapper.convertValue(data.get("localisations"), new TypeReference<Map<String, List<String>>>() {});
    }

    public List<Map<String, Object>> getServices() {
        return services;
    }

    public Map<String, List<String>> getLocalisations() {
        return localisations;
    }
}
