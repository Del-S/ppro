package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class templateController {
    @Autowired
    private TemplateDAO templateDAO;
    
    @Autowired
    private ComponentGroupDAO componentGroupDAO;
    
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
            List<ComponentGroup> componentgroups = componentGroupDAO.getAllComponentGroups();

            model.addAttribute("template", new Template());
            model.addAttribute("componentgroups", componentgroups);
            return "admin2543/new/template_new";
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_templates";
        }
    }
    
    @RequestMapping(value = {"/admin2543/detail_template"}, method = RequestMethod.GET)
    public String detail_template(Model model, @RequestParam(value = "tmp", required = false, defaultValue = "-1") final String tmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            int templateId = Integer.parseInt(tmpId);               
            Template template = templateDAO.getTemplateById(templateId);  
        
            /* Maybe some better solution? */
            if(template.getId_template() == templateId) {
                model.addAttribute("template", template);
                return "admin2543/detail/template_detail";
            } else { 
                return "redirect:view_templates";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_templates";
        }
    }
    
    @RequestMapping(value = {"/admin2543/update_template"}, method = RequestMethod.POST)
    public String update_template(Model model, @ModelAttribute("SpringWeb")Template template) {
        try {
            templateDAO.updateTemplate(template);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_templates";
    }
    
}
