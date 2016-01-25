package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Component;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
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
        this.sessionFactory.getCurrentSession().update(component);
    }

    @Override
    public List<Component> getAllComponents() {
        return this.sessionFactory.getCurrentSession().createCriteria(Component.class).list();
    }

    @Override
    public void deleteComponent(Integer component_id) {
        Component component = (Component) sessionFactory.getCurrentSession().load(Component.class, component_id);
        if (null != component) {
            component.setComponentGroup(null);
            this.sessionFactory.getCurrentSession().delete(component);
        }
    }
    
    @Override
    public List<Component> getCompontentsByRow(String row, String operand , String stringArray) {
        return this.sessionFactory.getCurrentSession().createCriteria(Component.class).add(Restrictions.sqlRestriction(row + " " + operand + " (" + stringArray + ")")).list();  
    }

    @Override
    public void updateMultipleComponent(List<Component> components) {
        try {
            for(Component component : components) { 
                this.sessionFactory.getCurrentSession().update(component);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
