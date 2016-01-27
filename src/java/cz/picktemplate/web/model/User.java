package cz.picktemplate.web.model;

import cz.picktemplate.web.controller.admin.userController;
import java.io.Serializable;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Random;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import org.apache.log4j.Logger;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="15pick12_user", uniqueConstraints = {
@UniqueConstraint(columnNames = "id_user"),
@UniqueConstraint(columnNames = "login"),
@UniqueConstraint(columnNames = "email")})
public class User implements Serializable {
    
    private static final Logger logger = Logger.getLogger(userController.class);
    
    @Id
    @Column(name="id_user")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_user;
    private Integer id_address;
    
    @NotEmpty
    private String login;
    @NotEmpty
    private String name;
    private String surname;
    @NotEmpty
    @Email
    private String email;
    
    @NotEmpty
    private String password;
    @NotEmpty
    private String salt;
    
    private String website;
    private String phone;
    
    @NotNull
    private Integer rights;
    private String token;
    
    /* Ps settings */
    @Transient
    private final char[] valid_hash_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+{}[]|:;<>?,./".toCharArray();
    @Transient
    private final int pass_length = 50;
    @Transient
    private final int iterations = 1258;
    @Transient
    private final int hash_length = 32;
    
    @Transient
    private final char[] valid_token_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
    @Transient
    private final int token_length = 32;
    
    /* Required by Hibernate */
    public User() {
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if ( !(obj instanceof User) ) return false;

        final User user = (User) obj;

        if ( !user.getId_user().equals( this.getId_user()) ) return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 40; 
        int result = 2; 
        result = prime * result;
        result += ((id_user == null) ? 0 : id_user.hashCode());
        result += ((name == null) ? 0 : name.hashCode());
        return result;
    }
    
    public String generateHashToken(boolean isHash) {
        if(isHash) return generateHash(valid_hash_chars, pass_length);
        else return generateHash(valid_token_chars, token_length);
    }
    
    public String generateHash(char[] valid_chars, int length) {
        SecureRandom srandom = new SecureRandom();
        Random random = new Random();
        char[] salt = new char[length];
               
        for(int i=0; i < length; ++i) {
            if ((i % 10) == 0) {
                random.setSeed(srandom.nextLong()); // 64 bits of random!
            }
            salt[i] = valid_chars[random.nextInt(valid_chars.length)];
        }
        
        return new String(salt);
    }
    
    public String hashPassword(String password, String hash) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] pass = pbkdf2(password.toCharArray(), hash, iterations, hash_length);
        return toHex(pass);
    }
    
    public boolean comparePasswords(String passDb, String hash, String pass) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] b = pbkdf2(pass.toCharArray(), hash, iterations, hash_length);
        String inputPass = toHex(b);
        return passDb.equals(inputPass);
    }
    
    private static byte[] pbkdf2(char[] password, String salt_string, int iterations, int bytes) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] salt = salt_string.getBytes();
        PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, bytes * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        return skf.generateSecret(spec).getEncoded();
    }
    
    private static String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length) - hex.length();
        if(paddingLength > 0) 
            return String.format("%02" + paddingLength + "c", 0) + hex;
        else
            return hex;
    } 

    public Integer getId_user() {
        return id_user;
    }

    public void setId_user(Integer id_user) {
        this.id_user = id_user;
    }

    public Integer getId_address() {
        return id_address;
    }

    public void setId_address(Integer id_address) {
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

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
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

    public Integer getRights() {
        return rights;
    }

    public void setRights(Integer rights) {
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
