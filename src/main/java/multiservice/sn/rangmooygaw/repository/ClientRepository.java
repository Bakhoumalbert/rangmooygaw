package multiservice.sn.rangmooygaw.repository;

import multiservice.sn.rangmooygaw.entite.Client;
import multiservice.sn.rangmooygaw.entite.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {

    Optional<Client> findByUtilisateur(Utilisateur utilisateur);
    Optional<Client> findByEmail(String email);
    Optional<Client> findById(Long id);

    @Query("SELECT c FROM Client c WHERE c.utilisateur.email = :email")
    Optional<Client> findByUtilisateurEmail(@Param("email") String email);

}
