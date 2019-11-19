package pl.mada.invoice_archiver.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.Invoice;
import pl.mada.invoice_archiver.model.repositories.InvoiceRepository;
import pl.mada.invoice_archiver.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDate;

@Controller
@RequestMapping("/add-invoice")
public class InvoiceController {

    private final InvoiceRepository invoiceRepository;
    private final UserRepository userRepository;

    @Autowired
    public InvoiceController(InvoiceRepository invoiceRepository, UserRepository userRepository) {
        this.invoiceRepository = invoiceRepository;
        this.userRepository = userRepository;
    }

    @GetMapping
    public String prepareAddInvoicePage() {
        return "/WEB-INF/views/add-invoice-form.jsp";
    }

    @PostMapping
    public String addInvoice(String nip, String invoiceNumber, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate dateOfIssue, Principal principal) {

        //String login = principal.getName();

        Invoice invoice = new Invoice();
        invoice.setNip(nip);
        invoice.setInvoiceNumber(invoiceNumber);
        invoice.setDateOfIssue(dateOfIssue.plusDays(1));
        //invoice.setUser(userRepository.findByLogin(login));


        invoiceRepository.save(invoice);


        return "redirect:/";
    }
}
