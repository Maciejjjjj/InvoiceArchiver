package pl.mada.invoice_archiver.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mada.invoice_archiver.model.entities.File;
import pl.mada.invoice_archiver.model.repositories.FileRepository;
import pl.mada.invoice_archiver.model.repositories.UserRepository;

import java.security.Principal;

@Controller

public class ShowJpegFileController {

    @Autowired
    private FileRepository fileRepository;

    @GetMapping("/showfile")
    private ResponseEntity<Resource> buildProfileFileResponse(Long fileId) {
        File profileFile = fileRepository.findFileById(fileId);
        ByteArrayResource data = getProfileFileData(profileFile);
        return ResponseEntity
                .ok()
                .contentType(MediaType.valueOf(profileFile.getContentType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + profileFile.getFileName())
                .body(data);
    }

    private ByteArrayResource getProfileFileData(File profileFile) {
        return new ByteArrayResource(profileFile.getData());
    }

}
// model do przekazywania parametru na widok