package cz.picktemplate.web.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_gallery")
public class Gallery implements Serializable {
    @Id
    @Column(name="id_gallery")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_gallery;
    @Column
    @NotEmpty
    private String name;
    
    @Column
    private String description;
    
    @Column
    private Integer id_thumbnail;
    
    @OneToMany(cascade=CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="id_gallery")
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
        result += ((name == null) ? 0 : name.hashCode());
        return result;
    }

    public Integer getId_gallery() {
        return id_gallery;
    }

    public void setId_gallery(Integer id_gallery) {
        this.id_gallery = id_gallery;
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
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getName(){
        return name;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
    public String getDescription(){
        return description;
    }
    
    
    
}
