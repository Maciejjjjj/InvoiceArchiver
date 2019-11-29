package pl.mada.invoice_archiver.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import pl.mada.invoice_archiver.model.entities.File;
import pl.mada.invoice_archiver.model.repositories.FileRepository;

import java.io.IOException;

@Service
public class FileStorageService {

    @Autowired
    private FileRepository fileRepository;

    public File storeFile(MultipartFile file) {

        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {

            if(fileName.contains("..")) {
                throw new RuntimeException();
            }

            File fileToSave = new File(fileName, file.getContentType(), file.getBytes());

            return fileRepository.save(fileToSave);

        } catch (IOException ex) {
            throw new RuntimeException();
        }
    }

    public java.io.File getFile(String fileId) {
        return fileRepository.findById(fileId);
    }
}
