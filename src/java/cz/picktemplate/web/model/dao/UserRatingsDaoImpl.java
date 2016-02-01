package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.UserRatings;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class UserRatingsDaoImpl implements UserRatingsDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public UserRatings getUserRatingsById(int id) {
        return (UserRatings) sessionFactory.getCurrentSession().get(UserRatings.class, id);
    }

    @Override
    public void addUserRatings(UserRatings userRatings) {
        this.sessionFactory.getCurrentSession().save(userRatings);
    }
    
    @Override
    public void updateUserRatings(UserRatings userRatings) {
        this.sessionFactory.getCurrentSession().update(userRatings);
    }

    @Override
    public List<UserRatings> getAllUserRatings() {
        return this.sessionFactory.getCurrentSession().createCriteria(UserRatings.class).list();
    }

    @Override
    public void deleteUserRatings(Integer component_id) {
        UserRatings userRatings = (UserRatings) sessionFactory.getCurrentSession().load(UserRatings.class, component_id);
        if (null != userRatings) {
            this.sessionFactory.getCurrentSession().delete(userRatings);
        }
    }
    
    @Override
    public List<UserRatings> getUserRatingsByRow(String row, String operand , String stringArray) {
        return this.sessionFactory.getCurrentSession().createCriteria(UserRatings.class).add(Restrictions.sqlRestriction(row + " " + operand + " (" + stringArray + ")")).list();  
    }
}
