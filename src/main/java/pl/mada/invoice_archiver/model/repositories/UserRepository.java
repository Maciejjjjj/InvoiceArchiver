package pl.mada.invoice_archiver.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mada.invoice_archiver.model.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByLogin(String login);

}
