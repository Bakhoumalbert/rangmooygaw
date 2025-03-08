package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Agent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AgentRepository extends JpaRepository<Agent, Long> {

}
