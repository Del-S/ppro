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
public class componentController {
    @Autowired
    private ComponentDAO componentDAO;
    
    @RequestMapping(value = {"/admin2543/view_components"}, method = RequestMethod.GET)
    public String view_components(Model model) {
        List<Component> components = componentDAO.getAllComponents();
        
        model.addAttribute("component", new Component());
        model.addAttribute("components", components);
        return "admin2543/component";
    }
    
    @RequestMapping(value = {"/admin2543/add_component"}, method = RequestMethod.POST)
    public String add_component(Model model, @ModelAttribute("SpringWeb")Component component) {
        try {
            componentDAO.addComponent(component);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_components";
    }
    
    @RequestMapping(value = {"/admin2543/detail_component"}, method = RequestMethod.GET)
    public String detail_component(Model model, @RequestParam(value = "cmp", required = false, defaultValue = "-1") final String cmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            int componentId = Integer.parseInt(cmpId);               
            Component component = componentDAO.getComponentById(componentId);  
        
            /* Maybe some better solution? */
            if(component.getId_component() == componentId) {
                model.addAttribute("component", component);
                return "admin2543/component_detail";
            } else { 
                return "redirect:view_components";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_components";
        }
    }
    
    @RequestMapping(value = {"/admin2543/update_component"}, method = RequestMethod.POST)
    public String update_component(Model model, @ModelAttribute("SpringWeb")Component component) {
        try {
            componentDAO.updateComponent(component);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_components";
    }
    
    @RequestMapping(value = {"/admin2543/trash_component"}, method = RequestMethod.GET)
    public String trash_component(Model model, @RequestParam(value = "cmp", required = false, defaultValue = "-1") final String cmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            int componentId = Integer.parseInt(cmpId);                 
        
            componentDAO.deleteComponent(componentId);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_components";
    }
    
}
