package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Agence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AgenceRepository extends JpaRepository<Agence, Long> {
}

