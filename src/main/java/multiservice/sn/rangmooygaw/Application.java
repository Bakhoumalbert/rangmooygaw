package multiservice.sn.rangmooygaw;

import multiservice.sn.rangmooygaw.modele.Queue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

    @Service
    public static class QueueService {

        private final Map<String, Queue> queues = new HashMap<>();

        public QueueService() {
            // Initialisation des files d'attente
            queues.put("Dakar Plateau", new Queue("Dakar Plateau") {
            });
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
            queue.incrementCurrentNumber();
            if (queue.getCurrentNumber() > 0) {
                queue.incrementLastIssuedNumber();
            }
        }

        public Map<String, Queue> getAllQueues() {
            return queues;
        }
    }
}
