package pl.mada.invoice_archiver.controllers;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class AddInvoiceRequest {

    private String nip;
    private String invoiceNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfIssue;
}
