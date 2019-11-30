package pl.mada.invoice_archiver.model.entities;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "invoices")
public class Invoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "NIP", nullable = false)
    private String nip;
    @Column(name = "invoice_number")
    private String invoiceNumber;

    @Column(name = "date_of_issue")
    private LocalDate dateOfIssue;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne
    @JoinColumn(name = "file_id")
    private File file;


    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getNip() { return nip; }

    public void setNip(String nip) { this.nip = nip; }

    public String getInvoiceNumber() { return invoiceNumber; }

    public void setInvoiceNumber(String invoiceNumber) { this.invoiceNumber = invoiceNumber; }

    public LocalDate getDateOfIssue() { return dateOfIssue; }

    public void setDateOfIssue(LocalDate dateOfIssue) { this.dateOfIssue = dateOfIssue; }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Invoice invoice = (Invoice) o;
        return Objects.equals(id, invoice.id);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "id=" + id +
                ", company='" + nip + '\'' +
                ", invoiceNumber='" + invoiceNumber + '\'' +
                ", dateOfIssue='" + dateOfIssue + '\'' +
                '}';
    }

}
