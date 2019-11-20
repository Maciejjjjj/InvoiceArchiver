package pl.mada.invoice_archiver.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.Invoice;
import pl.mada.invoice_archiver.model.repositories.InvoiceRepository;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/show-all-invoices")
public class ShowInvoiceController {

    private final InvoiceRepository invoiceRepository;

    public ShowInvoiceController(InvoiceRepository invoiceRepository) {
        this.invoiceRepository = invoiceRepository;
    }

    @GetMapping
        public String prepareHomePage (Model model){
            List<Invoice> allInvoices = invoiceRepository.findAll();
            model.addAttribute("invoices", allInvoices);
            return "WEB-INF/views/show-invoice.jsp";

        }
}
