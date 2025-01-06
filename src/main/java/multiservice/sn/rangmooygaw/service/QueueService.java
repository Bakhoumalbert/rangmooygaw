package multiservice.sn.rangmooygaw.services;

import multiservice.sn.rangmooygaw.modele.Queue;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class QueueService {

    private final Map<String, Queue> queues = new HashMap<>();

    public QueueService() {
        // Initialisation des localités
        queues.put("Dakar Plateau", new Queue("Dakar Plateau"));
        queues.put("Pikine", new Queue("Pikine"));
    }

    public Queue getQueue(String location) {
        return queues.get(location);
    }

    public void nextClient(String location) {
        queues.get(location).incrementCurrentNumber();
    }

    public void previousClient(String location) {
        Queue queue = queues.get(location);
        if (queue.getCurrentNumber() > 0) {
            queue.decrementCurrentNumber();
        }
    }

    public Map<String, Queue> getAllQueues() {
        return queues;
    }

    // Nouvelle méthode issueTicket
    public int issueTicket(String location) {
        Queue queue = queues.get(location);
        queue.incrementLastIssuedNumber();
        return queue.getLastIssuedNumber();
    }
}
