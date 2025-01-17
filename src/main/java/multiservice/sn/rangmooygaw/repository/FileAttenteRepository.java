package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.FileAttente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FileAttenteRepository extends JpaRepository<FileAttente, Long> {
    //Optional<FileAttente> findByServiceIdAndAgenceId(Long serviceId, Long agenceId);
    //Optional<FileAttente> findByServiceIdAndAgenceId(@Param("serviceId") Long serviceId, @Param("agenceId") Long agenceId);
    //Optional<FileAttente> findByServiceIdServiceAndAgenceIdAgence(Long serviceId, Long agenceId);
    @Query("SELECT f FROM FileAttente f WHERE f.service.idService = :serviceId AND f.agence.idAgence = :agenceId")
    Optional<FileAttente> findByServiceIdAndAgenceId(@Param("serviceId") Long serviceId, @Param("agenceId") Long agenceId);

}

