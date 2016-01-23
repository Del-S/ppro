package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(value = {"component", "componentGroup"})
public class componentController {
    @Autowired
    private ComponentDAO componentDAO;
    
    @Autowired
    private ComponentGroupDAO componentGroupDAO;
    
    private static final Logger logger = Logger.getLogger(componentController.class);
    
    /* Mappings for Components */
    @RequestMapping(value = {"/admin2543/view_components"}, method = RequestMethod.GET)
    public String view_components(Model model) {
        List<Component> components = componentDAO.getAllComponents();
        
        model.addAttribute("component", new Component());
        model.addAttribute("components", components);
        model.addAttribute("componentGroups", this.getComponentGroupNames());
        return "admin2543/component";
    }
    
    @RequestMapping(value = {"/admin2543/detail_component"}, method = RequestMethod.GET)
    public String detail_component(Model model, @RequestParam(value = "cmp", required = false, defaultValue = "-1") final String cmpId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer componentId = Integer.parseInt(cmpId);               
            Component component = componentDAO.getComponentById(componentId);

            /* Maybe some better solution? */
            if(componentId.equals(component.getId_component())) {
                model.addAttribute("component", component);
                model.addAttribute("componentGroups", this.getComponentGroupNames());
                return "admin2543/detail/component_detail";
            } else { 
                return "redirect:view_components";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_components";
        }
    }
    
    @RequestMapping(value = {"/admin2543/add_component"}, method = RequestMethod.POST)
    public String add_component(Model model, @ModelAttribute("component")Component component) {
        try {
            componentDAO.addComponent(component);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_components";
    }
    
    @RequestMapping(value = {"/admin2543/update_component"}, method = RequestMethod.POST)
    public String update_component(Model model, @ModelAttribute("component")Component component) {
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
            Integer componentId = Integer.parseInt(cmpId);                 
        
            componentDAO.deleteComponent(componentId);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_components";
    }
    
    /* Mappings for Component Groups */
    @RequestMapping(value = {"/admin2543/view_component_groups"}, method = RequestMethod.GET)
    public String view_component_groups(Model model) {  
        List<ComponentGroup> componentGroups = componentGroupDAO.getAllComponentGroups();
        
        model.addAttribute("componentGroup", new ComponentGroup());
        model.addAttribute("componentsGroup", componentGroups);
        return "admin2543/component_group";
    }
    
    @RequestMapping(value = {"/admin2543/detail_component_group"}, method = RequestMethod.GET)
    public String detail_component_group(Model model, @RequestParam(value = "cg", required = false, defaultValue = "-1") final String cgId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer componentGroupId = Integer.parseInt(cgId);               
            ComponentGroup componentGroup = componentGroupDAO.getComponentGroupById(componentGroupId);  
        
            /* Maybe some better solution? */
            if(componentGroupId.equals(componentGroup.getId_component_group())) {
                model.addAttribute("componentGroup", componentGroup);
                return "admin2543/detail/component_group_detail";
            } else { 
                return "redirect:view_components";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_components";
        }
    }
    
    @RequestMapping(value = {"/admin2543/add_component_group"}, method = RequestMethod.POST)
    public String add_component_group(Model model, @ModelAttribute("componentGroup")ComponentGroup componentGroup) {
        try {
            componentGroupDAO.addComponentGroup(componentGroup);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_component_groups";
    }
    
    @RequestMapping(value = {"/admin2543/update_component_group"}, method = RequestMethod.POST)
    public String update_component_group(Model model, @ModelAttribute("componentGroup")ComponentGroup componentGroup) {
        try {
            componentGroupDAO.updateComponentGroup(componentGroup);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_component_groups";
    }
    
    @RequestMapping(value = {"/admin2543/trash_component_group"}, method = RequestMethod.GET)
    public String trash_component_group(Model model, @RequestParam(value = "cg", required = false, defaultValue = "-1") final String cgId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer componentGroupId = Integer.parseInt(cgId);                 
        
            componentGroupDAO.deleteComponentGroup(componentGroupId);
            List<Component> components_by_group = componentDAO.getCompontentsByRow("id_component_group", "=", componentGroupId.toString());
            for(Component c : components_by_group) {
                c.setId_component_group(0);         // Erase this from display (cannot be deleted or moved to another group)
            }
            componentDAO.updateMultipleComponent(components_by_group);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_component_groups";
    }
    
    /* Non-mapping functions */
    private Map<Integer, String> getComponentGroupNames() {
        List<ComponentGroup> componentGroups = componentGroupDAO.getAllComponentGroups();
        
        Map<Integer, String> cmpGroupNames = new LinkedHashMap<Integer, String>();
        for(ComponentGroup componentGroup : componentGroups) {
            cmpGroupNames.put(componentGroup.getId_component_group(), componentGroup.getName());
        } 
        return cmpGroupNames;
    }
}
