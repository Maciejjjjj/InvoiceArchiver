package pl.mada.invoice_archiver.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mada.invoice_archiver.model.entities.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {


}
