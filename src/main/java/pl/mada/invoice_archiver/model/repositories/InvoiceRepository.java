package pl.mada.invoice_archiver.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mada.invoice_archiver.model.entities.Invoice;

import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {

    List<Invoice> findAllByUser_Login(String login);

}
