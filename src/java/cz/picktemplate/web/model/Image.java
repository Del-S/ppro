package cz.picktemplate.web.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_image")
public class Image implements Serializable {
    @Id
    @Column(name="id_image")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_image;
    
    /* Also known as src */
    @Column
    @NotEmpty
    private String url;
    
    @Column
    private String alt;
    
    @Column
    private String description;

    /* Required by Hibernate */
    public Image() {
    }
    
    public Integer getId_image() {
        return id_image;
    }

    public void setId_image(Integer id_image) {
        this.id_image = id_image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
