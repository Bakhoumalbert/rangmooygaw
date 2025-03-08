package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FileAttenteRepository extends JpaRepository<FileAttente, Long> {
    Optional<FileAttente> findByService_IdServiceAndAgence_IdAgence(Long idService, Long idAgence);

}
