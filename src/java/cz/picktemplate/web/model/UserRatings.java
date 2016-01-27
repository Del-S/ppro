package cz.picktemplate.web.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "15pick12_user_ratings")
public class UserRatings implements Serializable {
    @Id
    @Column(name = "id_rating")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_rating;
    
    @Column
    @NotNull
    private Integer id_template;
    
    @Column
    private Integer id_previous_template;
    
    @Column
    private Integer id_user;

    @Column
    @NotNull
    private Integer rating;
    
    /* Required by Hibernate */
    public UserRatings() {
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if ( !(obj instanceof UserRatings) ) return false;

        final UserRatings userRatings = (UserRatings) obj;

        if ( !userRatings.getId_rating().equals( this.getId_rating()) ) return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 48; 
        int result = 2; 
        result = prime * result;
        result += ((id_rating == null) ? 0 : id_rating.hashCode());
        result += ((id_template == null) ? 0 : id_template.hashCode());
        return result;
    }

    public Integer getId_rating() {
        return id_rating;
    }

    public void setId_rating(Integer id_rating) {
        this.id_rating = id_rating;
    }

    public Integer getId_template() {
        return id_template;
    }

    public void setId_template(Integer id_template) {
        this.id_template = id_template;
    }

    public Integer getId_previous_template() {
        return id_previous_template;
    }

    public void setId_previous_template(Integer id_previous_template) {
        this.id_previous_template = id_previous_template;
    }

    public Integer getId_user() {
        return id_user;
    }

    public void setId_user(Integer id_user) {
        this.id_user = id_user;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
