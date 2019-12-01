package pl.mada.invoice_archiver.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.Invoice;
import pl.mada.invoice_archiver.model.repositories.FileRepository;
import pl.mada.invoice_archiver.model.repositories.InvoiceRepository;
import pl.mada.invoice_archiver.model.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDate;

@Controller
@RequestMapping("/add-invoice")
public class AddInvoiceController {

    private final InvoiceRepository invoiceRepository;
    private final UserRepository userRepository;
    private final FileRepository fileRepository;

    @Autowired
    public AddInvoiceController(InvoiceRepository invoiceRepository, UserRepository userRepository, FileRepository fileRepository) {
        this.invoiceRepository = invoiceRepository;
        this.userRepository = userRepository;
        this.fileRepository = fileRepository;
    }

    @GetMapping
    public String prepareAddInvoicePage() {
        return "/WEB-INF/views/add-invoice-form.jsp";
    }

    @PostMapping
    public String addInvoice(AddInvoiceRequest addInvoiceRequest, Principal principal, Long savedFileId) {

        String login = principal.getName();

        Invoice invoice = new Invoice();
        invoice.setNip(addInvoiceRequest.getNip());
        invoice.setInvoiceNumber(addInvoiceRequest.getInvoiceNumber());
        invoice.setDateOfIssue(addInvoiceRequest.getDateOfIssue().plusDays(1));
        invoice.setUser(userRepository.findByLogin(login));
        invoice.setFile(fileRepository.findFileById(savedFileId));


        invoiceRepository.save(invoice);


        return "redirect:/";
    }
}
