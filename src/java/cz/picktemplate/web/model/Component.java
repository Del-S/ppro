package cz.picktemplate.web.model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
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
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "id_component_group")
    private ComponentGroup componentGroup;
    
    @Transient
    private Integer form_id_component_group;
    
    /* Required by Hibernate */
    public Component() {
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if ( !(obj instanceof Component) ) return false;

        final Component component = (Component) obj;

        if ( !component.getId_component().equals( this.getId_component()) ) return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 35; 
        int result = 1; 
        result = prime * result;
        result += ((id_component == null) ? 0 : id_component.hashCode());
        result += ((name == null) ? 0 : name.hashCode());
        return result;
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

    public ComponentGroup getComponentGroup() {
        return componentGroup;
    }

    public void setComponentGroup(ComponentGroup componentGroup) {
        this.componentGroup = componentGroup;
    }

    public Integer getForm_id_component_group() {
        return form_id_component_group;
    }

    public void setForm_id_component_group(Integer form_id_component_group) {
        this.form_id_component_group = form_id_component_group;
    }
}
