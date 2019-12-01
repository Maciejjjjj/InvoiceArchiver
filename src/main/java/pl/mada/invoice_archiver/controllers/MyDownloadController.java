package pl.mada.invoice_archiver.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pl.mada.invoice_archiver.services.FileStorageService;
import pl.mada.invoice_archiver.model.entities.File;

@Controller
public class MyDownloadController {

   @Autowired
    private FileStorageService fileStorageService;

    @GetMapping("/download-document-{userId}-{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable Long userId, @PathVariable Long fileId) {

        File file = fileStorageService.getFile(fileId);

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(file.getContentType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFileName()+ "\"")
                .body(new ByteArrayResource(file.getData()));
    }
}
