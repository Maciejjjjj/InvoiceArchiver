package pl.mada.invoice_archiver.controllers;

import org.apache.tomcat.util.http.parser.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.services.FileStorageService;

import java.io.File;

@Controller
@RequestMapping("/downloadFile/{fileId}")

public class MyDownloadController {

    @Autowired
    private FileStorageService fileStorageService;

    public void downloadFile(@PathVariable String fileId) {
       File file = fileStorageService.getFile(fileId);

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(file.getAbsolutePath())
               .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName()+ "\"")
                .body(new ByteArrayResource(file.g));
    }

}
