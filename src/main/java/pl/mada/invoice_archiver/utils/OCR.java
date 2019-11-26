package pl.mada.invoice_archiver.utils;


import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import pl.mada.invoice_archiver.model.repositories.CompanyRepository;
import pl.mada.invoice_archiver.model.repositories.InvoiceRepository;

import java.io.File;

@Controller
public class OCR {

    private final CompanyRepository companyRepository;
    private final InvoiceRepository invoiceRepository;

    @Autowired
    public OCR(CompanyRepository companyRepository, InvoiceRepository invoiceRepository) {
        this.companyRepository = companyRepository;
        this.invoiceRepository = invoiceRepository;
    }


    public static void main(String[] args) throws TesseractException {
        String inputFilePath = "C:\\Users\\Twoja stara\\Desktop\\projekty\\Java\\1Kurs\\Projekt grupowy\\pomoce\\Faktury\\JPGTest.jpg";

        Tesseract tesseract = new Tesseract();

        tesseract.setDatapath("C:\\Users\\Twoja stara\\Desktop\\projekty\\Java\\1Kurs\\Projekt grupowy\\pomoce\\tessdata_fast-master");

        tesseract.setLanguage("pol");

        boolean contains = false;

        String testText = tesseract.doOCR(new File(inputFilePath));
        System.out.println(testText);


        if (testText.contains("9860240369")) {
            contains = true;
        }

        System.out.println(contains);

    }
}

