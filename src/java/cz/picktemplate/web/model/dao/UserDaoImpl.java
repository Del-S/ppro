package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.User;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
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
    public void addUser(User user) {
        this.sessionFactory.getCurrentSession().save(user);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllEmployees() {
        return this.sessionFactory.getCurrentSession().createQuery("from 15pick12_user").list();
    }
    
    @Override
    public void deleteUser(Integer user_id) {
        User employee = (User) sessionFactory.getCurrentSession().load(User.class, user_id);
        if (null != employee) {
            this.sessionFactory.getCurrentSession().delete(employee);
        }
    }
}
