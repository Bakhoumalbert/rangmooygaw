package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Services;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Services, Long> {

}
