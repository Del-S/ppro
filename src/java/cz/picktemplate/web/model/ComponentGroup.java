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
}
