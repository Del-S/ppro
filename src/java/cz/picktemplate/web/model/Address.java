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
@Table(name = "15pick12_address")
public class Address implements Serializable {
    @Id
    @Column(name="id_address")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_address;
    
    @Column
    @NotEmpty
    private String address;
    
    @Column
    @NotEmpty
    private String city;
    
    @Column
    @NotEmpty
    private String postal_code;
    
    /* Required by Hibernate */
    public Address() {
    }

    public Integer getId_address() {
        return id_address;
    }

    public void setId_address(Integer id_address) {
        this.id_address = id_address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }
}
