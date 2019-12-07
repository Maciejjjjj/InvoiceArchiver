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

@Controller
public class ShowFileController {


    private final FileRepository fileRepository;

    @Autowired
    public ShowFileController(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }

    @GetMapping("/show-file")
    private ResponseEntity<Resource> buildFileToDisplayResponse(Long savedFileId) {
        File fileToDisplay = fileRepository.findFileById(savedFileId);
        ByteArrayResource data = getFileToDisplayData(fileToDisplay);
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
