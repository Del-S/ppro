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
    private int id_address;
    
    @Column
    @NotEmpty
    private String address;
    
    @Column
    @NotEmpty
    private String city;
    
    @Column
    @NotNull
    private int postal_code;
    
    /* Required by Hibernate */
    public Address() {
    }

    public int getId_address() {
        return id_address;
    }

    public void setId_address(int id_address) {
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

    public int getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(int postal_code) {
        this.postal_code = postal_code;
    }
}
