package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.ComponentGroup;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class ComponentGroupDaoImpl implements ComponentGroupDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public ComponentGroup getComponentGroupById(int id) {
        return (ComponentGroup) sessionFactory.getCurrentSession().get(ComponentGroup.class, id);
    }

    @Override
    public void addComponentGroup(ComponentGroup componentGroup) {
        this.sessionFactory.getCurrentSession().save(componentGroup);
    }
    
    @Override
    public void updateComponentGroup(ComponentGroup componentGroup) {
        this.sessionFactory.getCurrentSession().update(componentGroup);
    }

    @Override
    public List<ComponentGroup> getAllComponentGroups() {
        return this.sessionFactory.getCurrentSession().createCriteria(ComponentGroup.class).list();
    }

    @Override
    public void deleteComponentGroup(Integer component_group_id) {
        ComponentGroup componentGroup = (ComponentGroup) sessionFactory.getCurrentSession().load(ComponentGroup.class, component_group_id);
        if (null != componentGroup) {
            componentGroup.setComponents(null);
            this.sessionFactory.getCurrentSession().delete(componentGroup);
        }
    }
}
