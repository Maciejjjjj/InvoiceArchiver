package pl.mada.invoice_archiver.services;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.springframework.stereotype.Service;
import pl.mada.invoice_archiver.model.entities.File;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Service
public class PdfToImageService {

    public File convertPdfToImage(java.io.File pdfFile) throws IOException {

        PDDocument document = PDDocument.load(pdfFile);
        PDFRenderer pdfRenderer = new PDFRenderer(document);

        for (int page = 0; page < document.getNumberOfPages(); ++page) {
            BufferedImage image = pdfRenderer.renderImageWithDPI(
                    page, 300, ImageType.RGB);

            java.io.File jpgFile = new java.io.File("image.jpg");

            ImageIO.write(image, "jpg", jpgFile);

            

        }

        File convertedFile = new File();
        convertedFile.setData();

        return convertedFile;
    }
}

