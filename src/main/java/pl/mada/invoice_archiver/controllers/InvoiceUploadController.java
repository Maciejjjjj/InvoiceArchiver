package pl.mada.invoice_archiver.controllers;

import net.sourceforge.tess4j.TesseractException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pl.mada.invoice_archiver.services.FileStorageService;
import pl.mada.invoice_archiver.services.OcrService;

@Controller
@RequestMapping("/upload")
public class InvoiceUploadController {

    private static final Logger logger = LoggerFactory.getLogger(InvoiceUploadController.class);

    @Autowired
    private FileStorageService fileStorageService;
    @Autowired
    private OcrService ocrService;


    @GetMapping
    public String prepareAddInvoicePage() {
        return "/WEB-INF/views/invoice-upload.jsp";
    }

    @PostMapping
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model) throws TesseractException {
        Long savedFileId = fileStorageService.storeFile(file);
        model.addAttribute("savedFileId", savedFileId);
        AddInvoiceRequest addInvoiceRequest = new AddInvoiceRequest();
        String nip = ocrService.getNipFromInvoice(savedFileId);
        addInvoiceRequest.setNip(nip);
        model.addAttribute("addInvoiceRequest", addInvoiceRequest);
        return "/WEB-INF/views/add-invoice-form.jsp";
    }


}
