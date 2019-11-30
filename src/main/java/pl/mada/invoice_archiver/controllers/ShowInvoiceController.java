package pl.mada.invoice_archiver.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.Invoice;
import pl.mada.invoice_archiver.model.repositories.InvoiceRepository;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/show-all-invoices")
public class ShowInvoiceController {

    private final InvoiceRepository invoiceRepository;

    public ShowInvoiceController(InvoiceRepository invoiceRepository)

    {
        this.invoiceRepository = invoiceRepository;
    }

    @GetMapping
        public String prepareHomePage(Model model, Principal principal){
            List<Invoice> allInvoices = invoiceRepository.findAllByUser_Login(principal.getName());
            model.addAttribute("invoicesAll", allInvoices);
            model.addAttribute("user",principal);
            return "WEB-INF/views/show-invoice.jsp";

        }
}
