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
@Table(name = "15pick12_user_ratings")
public class UserRatings implements Serializable {
    @Id
    @Column(name = "id_rating")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id_rating;
    
    @Column
    @NotEmpty
    private int id_template;
    
    @Column
    private int id_previous_template;
    
    @Column
    private int id_user;

    @Column
    @NotEmpty
    private int rating;
    
    /* Required by Hibernate */
    public UserRatings() {
    }

    public int getId_rating() {
        return id_rating;
    }

    public void setId_rating(int id_rating) {
        this.id_rating = id_rating;
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public int getId_previous_template() {
        return id_previous_template;
    }

    public void setId_previous_template(int id_previous_template) {
        this.id_previous_template = id_previous_template;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
