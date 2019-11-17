package pl.mada.invoice_archiver.model.entities;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Objects;


@Entity
    @Table(name = "Files")
    @Getter @Setter @ToString(exclude = {"data"})
    public class File  {
        @Id
        @GeneratedValue(strategy= GenerationType.IDENTITY)
        @Column(name="id")
        private Long id;

        @Column(name = "file_name", nullable = false)
        private String fileName;
        @Column(name = "content_type", nullable = false)
        private String contentType;
        @Lob
        @Basic(fetch = FetchType.LAZY, optional = false)
        @Column(name = "data", nullable = false, columnDefinition = "MEDIUMBLOB")
        private byte[] data;

        @OneToOne(mappedBy = "file")
        private Invoice invoice;

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }

        public String getContentType() {
            return contentType;
        }

        public void setContentType(String contentType) {
            this.contentType = contentType;
        }

        public byte[] getData() {
            return data;
        }

        public void setData(byte[] data) {
            this.data = data;
        }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        File file = (File) o;
        return id.equals(file.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
        public String toString() {
            return "File{" +
                    "id=" + id +
                    ", fileName='" + fileName + '\'' +
                    ", contentType='" + contentType + '\'' +
                    '}';
        }
    }

