package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Template;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class TemplateDaoImpl implements TemplateDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public Template getTemplateById(int id) {
        return (Template) sessionFactory.getCurrentSession().get(Template.class, id);
    }
    
    @Override
    public void addTemplate(Template template) {
        this.sessionFactory.getCurrentSession().save(template);
    }
    
    @Override
    public void updateTemplate(Template template) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(template);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Template> getAllTemplates() {
        //return this.sessionFactory.getCurrentSession().createQuery("from 15pick12_template").list();
        return this.sessionFactory.getCurrentSession().createCriteria(Template.class).list();
    }
    
    @Override
    public void deleteTemplate(Integer template_id) {
        Template template = (Template) sessionFactory.getCurrentSession().load(Template.class, template_id);
        if (null != template) {
            this.sessionFactory.getCurrentSession().delete(template);
        }
    }
}
