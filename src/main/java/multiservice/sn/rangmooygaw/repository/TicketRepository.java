package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Agence;
import multiservice.sn.rangmooygaw.entite.Services;
import multiservice.sn.rangmooygaw.entite.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {
    List<Ticket> findByAgenceAndServiceAndTraiteFalseOrderByPositionAsc(Agence agence, Services service);
    int countByServiceAndAgence(Services services, Agence agence);
}