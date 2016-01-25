package cz.picktemplate.web.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "15pick12_component_group")
public class ComponentGroup implements Serializable {
    @Id
    @Column(name="id_component_group")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_component_group;
    
    @Column
    @NotEmpty
    private String name;
    
    @Column
    private String description;
    
    @OneToMany(cascade=CascadeType.ALL, mappedBy="componentGroup", orphanRemoval = true)
    private List<Component> components;
    
    /* Required by Hibernate */
    public ComponentGroup() {
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

    public Integer getId_component_group() {
        return id_component_group;
    }

    public void setId_component_group(Integer id_component_group) {
        this.id_component_group = id_component_group;
    }

    public List<Component> getComponents() {
        return components;
    }

    public void setComponents(List<Component> components) {
        this.components = components;
    }
}
