package cz.picktemplate.web.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_component")
public class Component implements Serializable {
    @Id
    @Column(name="id_component")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_component;
    
    @Column
    @NotNull
    private Integer id_component_group;
    
    @Column
    @NotEmpty
    private String name;
    
    @Column
    private String description;
    
    /* Not really necesary */
    @Column
    private String description_link;
    
    @Column
    @NotNull
    private Integer complexity;
    
    /* Required by Hibernate */
    public Component() {
    }

    public Integer getId_component() {
        return id_component;
    }

    public void setId_component(Integer id_component) {
        this.id_component = id_component;
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

    public String getDescription_link() {
        return description_link;
    }

    public void setDescription_link(String description_link) {
        this.description_link = description_link;
    }

    public Integer getComplexity() {
        return complexity;
    }

    public void setComplexity(Integer complexity) {
        this.complexity = complexity;
    }

    public Integer getId_component_group() {
        return id_component_group;
    }

    public void setId_component_group(Integer id_component_group) {
        this.id_component_group = id_component_group;
    }
}
