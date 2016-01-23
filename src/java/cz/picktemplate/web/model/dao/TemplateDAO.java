package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Template;
import java.util.List;

public interface TemplateDAO {
    Template getTemplateById(int id);
    void addTemplate(Template template);
    void updateTemplate(Template template);
    List<Template> getAllTemplates();
    void deleteTemplate(Integer template_id);
}
