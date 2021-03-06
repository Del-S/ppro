package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class UserDaoImpl implements UserDAO {    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public User getUserById(int id) {
        return (User) sessionFactory.getCurrentSession().get(User.class, id);
    }
    
    @Override
    public User getUserByLogin(String login) {
        return (User) sessionFactory.getCurrentSession().get(User.class, login);
    }
    
    @Override
    public void addUser(User user) {
        this.sessionFactory.getCurrentSession().save(user);
    }
    
    @Override
    public void updateUser(User user) {
        this.sessionFactory.getCurrentSession().update(user);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers() {
        return this.sessionFactory.getCurrentSession().createCriteria(User.class).list();
    }
    
    @Override
    public void deleteUser(Integer user_id) {
        User employee = (User) sessionFactory.getCurrentSession().load(User.class, user_id);
        if (null != employee) {
            this.sessionFactory.getCurrentSession().delete(employee);
        }
    }
    
    @Override
    @SuppressWarnings("unchecked")
    public User findByUserName(String login) {
        List<User> users = new ArrayList<User>();
        users = sessionFactory.getCurrentSession().createQuery("from User where login=?").setParameter(0, login).list();
                if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}
}
