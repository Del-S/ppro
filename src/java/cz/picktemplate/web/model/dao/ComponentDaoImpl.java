package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Component;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class ComponentDaoImpl implements ComponentDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Component getComponentById(int id) {
        return (Component) sessionFactory.getCurrentSession().get(Component.class, id);
    }

    @Override
    public void addComponent(Component component) {
        this.sessionFactory.getCurrentSession().save(component);
    }
    
    @Override
    public void updateComponent(Component component) {
        //this.sessionFactory.getCurrentSession().saveOrUpdate(component);
        try {
            this.sessionFactory.getCurrentSession().update(component);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Component> getAllComponents() {
        return this.sessionFactory.getCurrentSession().createCriteria(Component.class).list();
    }

    @Override
    public void deleteComponent(Integer component_id) {
        Component component = (Component) sessionFactory.getCurrentSession().load(Component.class, component_id);
        if (null != component) {
            this.sessionFactory.getCurrentSession().delete(component);
        }
    }
}
