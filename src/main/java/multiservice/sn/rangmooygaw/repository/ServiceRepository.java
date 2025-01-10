package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {

}
