package pl.mada.invoice_archiver.controllers;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/download-document")
public class MyDownloadController {

    private static final String FILE_PATH = "C:/tmp/Fruit-Category.pdf";
    private static final String APPLICATION_PDF = "application/pdf";

    @RequestMapping(value = "/download-document", method = RequestMethod.GET, produces = APPLICATION_PDF)
    public @ResponseBody HttpEntity<byte[]> downloadByEntity() throws IOException {
        File file = getFile();
        byte[] document = FileCopyUtils.copyToByteArray(file);

        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("application", "pdf"));
        header.set("Content-Disposition", "inline; filename=" + file.getName());
        header.setContentLength(document.length);

        return new HttpEntity<byte[]>(document, header);
    }

    private File getFile() throws FileNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()){
            throw new FileNotFoundException(" File not found with path: " + FILE_PATH + ".");
        }
        return file;
    }

}
