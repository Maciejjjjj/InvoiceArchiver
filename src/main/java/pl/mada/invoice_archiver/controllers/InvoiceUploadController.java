//package pl.mada.invoice_archiver.controllers;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
//import pl.mada.invoice_archiver.model.entities.File;
//import pl.mada.invoice_archiver.payload.UploadFileResponse;
//import pl.mada.invoice_archiver.services.FileStorageService;
//
//@Controller
//@RequestMapping("/upload")
//public class InvoiceUploadController {
//
//    @GetMapping
//    public String prepareAddInvoicePage() {
//        return "/WEB-INF/views/invoice-upload.jsp";
//    }
//
//    @PostMapping
//    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file) {
//        File file = FileStorageService.storeFile(file);
//
//
//
//        return new UploadFileResponse(file.getFileName(),
//                file.getContentType(), file.getData());
//    }
//
//
//}
