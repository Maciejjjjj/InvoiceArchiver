package pl.mada.invoice_archiver.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.mada.invoice_archiver.model.entities.File;
import pl.mada.invoice_archiver.model.repositories.FileRepository;
import pl.mada.invoice_archiver.services.PdfToImageService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@Controller
public class ShowFileController {


    private final FileRepository fileRepository;
    private PdfToImageService pdfToImageService;

    @Autowired
    public ShowFileController(FileRepository fileRepository, PdfToImageService pdfToImageService) {
        this.fileRepository = fileRepository;
        this.pdfToImageService = pdfToImageService;
    }

    @GetMapping("/show-file")
    private ResponseEntity<Resource> buildFileToDisplayResponse(Long savedFileId) throws IOException {
        File fileToDisplay = fileRepository.findFileById(savedFileId);
        ByteArrayResource data = getFileToDisplayData(fileToDisplay);

        if (fileToDisplay.getContentType().equals("application/pdf")){
            byte[] fileData = fileToDisplay.getData();
            Path tmpPath = Files.createTempFile("fileToConvert", ".pdf");
            Files.write(tmpPath, fileData);


            java.io.File fileToConvert = new java.io.File(String.valueOf(tmpPath));

            data = getFileToDisplayData(pdfToImageService.convertPdfToImage(fileToConvert));

        }


        return ResponseEntity
                .ok()
                .contentType(MediaType.valueOf(fileToDisplay.getContentType()))
                .header("Content-Disposition", String.format("filename=%s", fileToDisplay.getFileName()))
                .body(data);
    }

    private ByteArrayResource getFileToDisplayData(File fileToDisplay) {
        return new ByteArrayResource(fileToDisplay.getData());
    }


}
