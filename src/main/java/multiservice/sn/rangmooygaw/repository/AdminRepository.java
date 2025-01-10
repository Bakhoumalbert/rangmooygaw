package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
}
