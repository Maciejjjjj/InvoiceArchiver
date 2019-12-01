package pl.mada.invoice_archiver.services;

import lombok.extern.slf4j.Slf4j;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mada.invoice_archiver.controllers.AddInvoiceRequest;
import pl.mada.invoice_archiver.model.entities.File;
import pl.mada.invoice_archiver.model.repositories.FileRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
public class OcrService {

    @Autowired
    private FileRepository fileRepository;

    private final Pattern NIP_PATTERN = Pattern.compile("(\\d{10})|(\\d{3}-\\d{2}-\\d{2}-\\d{3})|(\\d{3}-\\d{3}-\\d{2}-\\d{2})");
    private final Pattern DATE_PATTERN1 = Pattern.compile("(\\d{2}-\\d{2}-\\d{4})");
    private final Pattern DATE_PATTERN2 = Pattern.compile("(\\d{4}-\\d{2}-\\d{2})");
    private final Pattern DATE_PATTERN3 = Pattern.compile("(\\d{2}\\.\\d{2}\\.\\d{4})");

    private final Pattern INVOICE_NUMBER_PATTERN = Pattern.compile("(nr[:]*)\\s*[:!@#$%^&*()£]*\\s*(\\S+)\\s*", Pattern.CASE_INSENSITIVE );

    public AddInvoiceRequest getDataFromInvoice(Long fileId) throws TesseractException {

        AddInvoiceRequest addInvoiceRequest = new AddInvoiceRequest();
        File fileToOcr = fileRepository.findFileById(fileId);

        byte[] fileData = fileToOcr.getData();
        Path tmpPath = null;
        try {
            if (fileToOcr.getContentType().equals("image/jpeg")) {
                tmpPath = Files.createTempFile("ocr", ".jpeg");
            } else if (fileToOcr.getContentType().equals("application/pdf")){
                tmpPath = Files.createTempFile("ocr", ".pdf");
            }else{
                log.info("Wrong data type!");
            }
        } catch (IOException e) {
            e.getMessage();
        }
        try {
            Files.write(tmpPath, fileData);
        } catch (IOException e) {
            e.getMessage();
        }


        Tesseract tesseract = new Tesseract();
        String userHome = System.getProperty("user.home");
        String dataPath = "tessdata_fast-master";
        tesseract.setDatapath(userHome + "/" + dataPath);
        tesseract.setLanguage("pol");


        String invoiceOcrText = tesseract.doOCR(tmpPath.toFile());
        System.out.println(invoiceOcrText);

        Matcher matcher = NIP_PATTERN.matcher(invoiceOcrText);

        if (matcher.find()) {
            String nip = matcher.group();
            addInvoiceRequest.setNip(nip);
        }
        Matcher matcher1 = DATE_PATTERN1.matcher(invoiceOcrText);

        if (matcher1.find()) {

            String dateOfIssueString = matcher1.group().substring(0,10);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

            LocalDate dateOfIssue = LocalDate.parse(dateOfIssueString, formatter);

            addInvoiceRequest.setDateOfIssue(dateOfIssue);
        }

        Matcher matcher2 = DATE_PATTERN2.matcher(invoiceOcrText);

        if (matcher2.find()) {

            String dateOfIssueString = matcher2.group().substring(0,10);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            LocalDate dateOfIssue = LocalDate.parse(dateOfIssueString, formatter);

            addInvoiceRequest.setDateOfIssue(dateOfIssue);
        }

        Matcher matcher3 = DATE_PATTERN3.matcher(invoiceOcrText);

        if (matcher3.find()) {

            String dateOfIssueString = matcher3.group().substring(0,10);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");

            LocalDate dateOfIssue = LocalDate.parse(dateOfIssueString, formatter);

            addInvoiceRequest.setDateOfIssue(dateOfIssue);
        }

        Matcher matcher4 = INVOICE_NUMBER_PATTERN.matcher(invoiceOcrText);

        if (matcher4.find()) {

            String invoiceNumber = matcher4.group(2);
            
            addInvoiceRequest.setInvoiceNumber(invoiceNumber);
        }


        return addInvoiceRequest;
    }

}
