package cz.picktemplate.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="15pick12_user")
public class User {
    
    @Id
    @Column(name="id_user")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_user;
    private int id_address;
    
    @Column
    @NotEmpty
    private String user_login;
    @Column
    @NotEmpty
    private String user_name;
    @Column
    private String user_surname;
    
    @Column
    @NotEmpty
    private String user_password;
    @Column
    @NotEmpty
    private String user_hash;
    
    @Column
    private String user_website;
    @Column
    private String user_phone;
    
    @Column
    private int user_rights;
    @Column
    private String user_token;
    
    public User() {}
    public User(String user_login, String user_name, String user_surname) {
        this.user_login = user_login;
        this.user_name = user_name;
        this.user_surname = user_surname;
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

    public String getUser_login() {
        return user_login;
    }

    public void setUser_login(String user_login) {
        this.user_login = user_login;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_surname() {
        return user_surname;
    }

    public void setUser_surname(String user_surname) {
        this.user_surname = user_surname;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_hash() {
        return user_hash;
    }

    public void setUser_hash(String user_hash) {
        this.user_hash = user_hash;
    }

    public String getUser_website() {
        return user_website;
    }

    public void setUser_website(String user_website) {
        this.user_website = user_website;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public int getUser_rights() {
        return user_rights;
    }

    public void setUser_rights(int user_rights) {
        this.user_rights = user_rights;
    }

    public String getUser_token() {
        return user_token;
    }

    public void setUser_token(String user_token) {
        this.user_token = user_token;
    }
    
}
