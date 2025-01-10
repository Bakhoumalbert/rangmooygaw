package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {
}
