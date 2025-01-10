package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileAttenteRepository extends JpaRepository<FileAttente, Long> {
}

