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
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Table(name="15pick12_user", uniqueConstraints = {
@UniqueConstraint(columnNames = "id_user"),
@UniqueConstraint(columnNames = "login"),
@UniqueConstraint(columnNames = "login")})
public class User implements Serializable {
    
    @Id
    @Column(name="id_user")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_user;
    private int id_address;
    
    @NotEmpty
    private String login;
    @NotEmpty
    private String name;
    private String surname;
    private String email;
    
    @NotEmpty
    private String password;
    @NotEmpty
    private String hash;
    
    private String website;
    private String phone;
    
    @NotNull
    private int rights;
    private String token;
    
    /* Required by Hibernate */
    public User() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_address() {
        return id_address;
    }

    public void setId_address(int id_address) {
        this.id_address = id_address;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRights() {
        return rights;
    }

    public void setRights(int rights) {
        this.rights = rights;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
