package pl.mada.invoice_archiver.utils;


import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import java.io.File;

public class OCR {

    public static void main(String[] args) throws TesseractException {
        String inputFilePath = "C:\\Users\\Twoja stara\\Desktop\\projekty\\Java\\1Kurs\\Projekt grupowy\\pomoce\\OcrTest.pdf";

        Tesseract tesseract = new Tesseract();

        tesseract.setDatapath("C:\\Users\\Twoja stara\\Desktop\\projekty\\Java\\1Kurs\\Projekt grupowy\\pomoce\\tessdata_fast-master");

        tesseract.setLanguage("pol");

        String testText = tesseract.doOCR(new File(inputFilePath));
        System.out.println(testText);
    }

}
