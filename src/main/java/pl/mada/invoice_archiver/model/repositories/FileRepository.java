package pl.mada.invoice_archiver.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mada.invoice_archiver.model.entities.File;

public interface FileRepository extends JpaRepository<File, Long> {

}
