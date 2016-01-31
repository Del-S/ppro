package cz.picktemplate.web.model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
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
    private String image_src;
    
    @Column
    private String image_alt;
    
    @Column
    private String description;
    
    @Column
    private String thumbnail_src;

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "id_gallery")
    private Gallery gallery;
    
    @Transient
    private Integer form_id_gallery;
    
    
    /* Required by Hibernate */
    public Image() {
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if ( !(obj instanceof Image) ) return false;

        final Image image = (Image) obj;

        if ( !image.getId_image().equals( this.getId_image()) ) return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 35; 
        int result = 1; 
        result = prime * result;
        result += ((id_image == null) ? 0 : id_image.hashCode());
        result += ((image_alt == null) ? 0 : image_alt.hashCode());
        return result;
    }
    
    public Integer getId_image() {
        return id_image;
    }

    public void setId_image(Integer id_image) {
        this.id_image = id_image;
    }

    public String getImage_src() {
        return image_src;
    }

    public void setImage_src(String image_src) {
        this.image_src = image_src;
    }

    public String getImage_alt() {
        return image_alt;
    }

    public void setImage_alt(String image_alt) {
        this.image_alt = image_alt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getThumbnail() {
        return thumbnail_src;
    }

    public void setThumbnail(String thumbnail_src) {
        this.thumbnail_src = thumbnail_src;
    }
    public Gallery getGallery() {
        return gallery;
    }

    public void setgallery(Gallery gallery) {
        this.gallery = gallery;
    }

    public Integer getForm_id_gallery() {
        return form_id_gallery;
    }

    public void setForm_id_gallery(Integer form_id_gallery) {
        this.form_id_gallery = form_id_gallery;
    }
    
}