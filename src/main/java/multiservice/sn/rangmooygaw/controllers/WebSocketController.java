package multiservice.sn.rangmooygaw.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WebSocketController {
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @PostMapping("/notify/{fileAttenteId}")
    public ResponseEntity<Void> notifierChangement(@PathVariable Long fileAttenteId) {
        messagingTemplate.convertAndSend("/fileAttente/" + fileAttenteId, "Mise à jour");
        return ResponseEntity.ok().build();
    }
}

