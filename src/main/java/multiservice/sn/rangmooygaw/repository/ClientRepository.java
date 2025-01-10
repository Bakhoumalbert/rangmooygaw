package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
}
