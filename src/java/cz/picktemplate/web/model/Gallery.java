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
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_gallery")
public class Gallery implements Serializable {
    @Id
    @Column(name="id_gallery")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_gallery;
    
    @Column
    @NotEmpty
    private int id_template;
    
    /* ID of image which is thumbnail */
    @Column
    private int id_thumbnail;
    
    @OneToMany
    private List<Image> images;

    public int getId_gallery() {
        return id_gallery;
    }

    public void setId_gallery(int id_gallery) {
        this.id_gallery = id_gallery;
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public int getId_thumbnail() {
        return id_thumbnail;
    }

    public void setId_thumbnail(int id_thumbnail) {
        this.id_thumbnail = id_thumbnail;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
}
