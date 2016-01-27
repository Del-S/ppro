package cz.picktemplate.web.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "15pick12_gallery")
public class Gallery implements Serializable {
    @Id
    @Column(name="id_gallery")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_gallery;
    
    @Column
    @NotNull
    private Integer id_template;
    
    /* ID of image which is thumbnail */
    @Column
    private Integer id_thumbnail;
    
    @OneToMany
    private List<Image> images;
    
    /* Required by Hibernate */
    public Gallery() {
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if ( !(obj instanceof Gallery) ) return false;

        final Gallery gallery = (Gallery) obj;

        if ( !gallery.getId_gallery().equals( this.getId_gallery()) ) return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 27; 
        int result = 1; 
        result = prime * result;
        result += ((id_gallery == null) ? 0 : id_gallery.hashCode());
        result += ((id_template == null) ? 0 : id_template.hashCode());
        return result;
    }

    public Integer getId_gallery() {
        return id_gallery;
    }

    public void setId_gallery(Integer id_gallery) {
        this.id_gallery = id_gallery;
    }

    public Integer getId_template() {
        return id_template;
    }

    public void setId_template(Integer id_template) {
        this.id_template = id_template;
    }

    public Integer getId_thumbnail() {
        return id_thumbnail;
    }

    public void setId_thumbnail(Integer id_thumbnail) {
        this.id_thumbnail = id_thumbnail;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
}
