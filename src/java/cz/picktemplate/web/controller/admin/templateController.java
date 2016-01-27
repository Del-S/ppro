package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.beans.PropertyEditorSupport;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

@Controller
@SessionAttributes(value = {"template", "componentGroups"})
@Transactional
public class templateController {
    @Autowired
    private TemplateDAO templateDAO;
    
    @Autowired
    private ComponentGroupDAO componentGroupDAO;
    
    List<ComponentGroup> componentGroups;
    private Map<String, Component> componentsMap = new HashMap<String, Component>();
    
    private static final Logger logger = Logger.getLogger(componentController.class);
    
    @RequestMapping(value = {"/admin2543/view_templates"}, method = RequestMethod.GET)
    public String view_templates(Model model) {
        List<Template> templates = templateDAO.getAllTemplates();     
        
        model.addAttribute("templates", templates);
        return "admin2543/template";
    }
    
    @RequestMapping(value = {"/admin2543/new_template"}, method = RequestMethod.GET)
    public String new_template(Model model) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            componentGroups = componentGroupDAO.getAllComponentGroups();
            
            /* Load childs (maybe better solution?) */
            for( ComponentGroup cg : componentGroups ) {
                Hibernate.initialize(cg.getComponents());
                for( Component c : cg.getComponents() ) {
                    componentsMap.put(c.getId_component().toString(), c);
                }
            }
            
            model.addAttribute("template", new Template());
            model.addAttribute("componentGroups", componentGroups);
            return "admin2543/new/template_new";
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
    @RequestMapping(value = {"/admin2543/detail_template"}, method = RequestMethod.GET)
    public String detail_template(Model model, @RequestParam(value = "tmp", required = false, defaultValue = "-1") final String tmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            int templateId = Integer.parseInt(tmpId);               
            Template template = templateDAO.getTemplateById(templateId);  
            componentGroups = componentGroupDAO.getAllComponentGroups();
            
            /* Load childs (maybe better solution?) */
            Hibernate.initialize(template.getComponents());
            for( ComponentGroup cg : componentGroups ) {
                Hibernate.initialize(cg.getComponents());
                for( Component c : cg.getComponents() ) {
                    componentsMap.put(c.getId_component().toString(), c);
                }
            }
            
            /* Maybe some better solution? */
            if(template.getId_template() == templateId) {
                model.addAttribute("template", template);
                model.addAttribute("componentGroups", componentGroups);
                return "admin2543/detail/template_detail";
            } 
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
    @RequestMapping(value = {"/admin2543/add_template"}, method = RequestMethod.POST)
    public String add_component(Model model, @Valid @ModelAttribute("template")Template template, BindingResult result) {
        try {            
            /* Return with errors */
            if(result.hasErrors()) { 
                logger.error(result.getAllErrors());   
                model.addAttribute("template", template);
                return "admin2543/new/template_new";
            }
            templateDAO.addTemplate(template);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
    @RequestMapping(value = {"/admin2543/update_template"}, method = RequestMethod.POST)
    public String update_template(Model model, @Valid @ModelAttribute("template")Template template, BindingResult result) {
        try {            
            if(result.hasErrors()) { 
                logger.error(result.getAllErrors());   
                model.addAttribute("template", template);
                return "admin2543/detail/template_detail";
            }
            templateDAO.updateTemplate(template);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
    @RequestMapping(value = {"/admin2543/trash_template"}, method = RequestMethod.GET)
    public String trash_template(Model model, @RequestParam(value = "tmp", required = false, defaultValue = "-1") final String tmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer templateId = Integer.parseInt(tmpId);                 
            
            templateDAO.deleteTemplate(templateId);        
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        binder.registerCustomEditor(Component.class, "components", new PropertyEditorSupport() {
            @Override
            public void setAsText(String id_components) {
                Component component = componentsMap.get(id_components);
                setValue((id_components.equals(""))?null:component);
            }
        });
    }
    
}
