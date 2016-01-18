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
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_template")
public class Template implements Serializable {
    @Id
    @Column(name = "id_template")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_template;
    private int id_gallery;
    @NotNull
    private int id_user;
    
    /* Can be changed to string */
    @OneToMany
    private List<Template> similar_templates;
    
    @NotEmpty
    private String name;
    private String description;
    
    private int price_implement;
    private int price_editing;
    
    /* This actualy has to be saved in db */
    @OneToMany
    private List<Component> components;

    @OneToMany
    private List<UserRatings> user_ratings;
    
    /* Required by Hibernate */
    public Template() {
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public List<Template> getSimilar_templates() {
        return similar_templates;
    }

    public void setSimilar_templates(List<Template> similar_templates) {
        this.similar_templates = similar_templates;
    }

    public int getId_gallery() {
        return id_gallery;
    }

    public void setId_gallery(int id_gallery) {
        this.id_gallery = id_gallery;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice_implement() {
        return price_implement;
    }

    public void setPrice_implement(int price_implement) {
        this.price_implement = price_implement;
    }

    public int getPrice_editing() {
        return price_editing;
    }

    public void setPrice_editing(int price_editing) {
        this.price_editing = price_editing;
    }

    public List<Component> getComponents() {
        return components;
    }

    public void setComponents(List<Component> components) {
        this.components = components;
    }

    public List<UserRatings> getUser_ratings() {
        return user_ratings;
    }

    public void setUser_ratings(List<UserRatings> user_ratings) {
        this.user_ratings = user_ratings;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
}
