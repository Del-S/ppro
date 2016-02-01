package cz.picktemplate.web.controller;

import cz.picktemplate.web.controller.admin.componentController;
import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(value = {"template", "componentGroups"})
@Transactional
public class indexController {
    @Autowired
    private TemplateDAO templateDAO;
    
    @Autowired
    private ComponentGroupDAO componentGroupDAO;
    
    @Autowired
    private ImageDAO imageDAO;
    
    private static final Logger logger = Logger.getLogger(indexController.class);
    
    List<ComponentGroup> componentGroups;
    List<Template> templates;
    List<Image> images;
    private Map<String, Component> componentsMap = new HashMap<String, Component>();
    
    @RequestMapping(value = {"/", "/index.html", "/pick_template_eshop", "/pick_template_eshop/"}, method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        componentGroups = componentGroupDAO.getAllComponentGroups();
        templates = templateDAO.getAllTemplates();
        
        /* Load childs (maybe better solution?) */
        for( ComponentGroup cg : componentGroups ) {
            Hibernate.initialize(cg.getComponents());
            for( Component c : cg.getComponents() ) {
                componentsMap.put(c.getId_component().toString(), c);
            }
        }
        
        for( Template t : templates ) {
            Hibernate.initialize(t.getGallery());
            Hibernate.initialize(t.getComponents());
            Gallery gal = t.getGallery();
            if( gal != null ) {
                Integer id_thumbnail_gallery = gal.getId_thumbnail_gallery();
                t.setThumbnail( imageDAO.getImagesById(id_thumbnail_gallery) );
            }
        }
        
        // Static data and SEO
        model.addAttribute("title", "Úvod - Pick Template");
        model.addAttribute("description", "Pick Template je jednoduchý nástroj pro vybrání šablony pro web. Je vhodný, jak pro programátory tak zákazníky. Vyhledávání je založeno na hodnocení zákazníků.");
        model.addAttribute("url", request.getRequestURL().toString()); 
        model.addAttribute("h1", "Pick Template"); 
        
        // Dynamic data
        model.addAttribute("componentGroups", componentGroups);
        model.addAttribute("templates", templates);
        return "index";
    }   
    
    @RequestMapping(value = {"/template_detail/{id_template}/", "/template_detail/{id_template}/index"}, method = RequestMethod.GET)
    public String detail_template(Model model, HttpServletRequest request, @PathVariable String id_template) {
        try { 
            int templateId = Integer.parseInt(id_template);                
            Template template = templateDAO.getTemplateById(templateId);
            images = null;
            Image thumbnail = null;
            Gallery gal = template.getGallery();
            if(gal != null) { 
                Hibernate.initialize(gal.getImages());
                images = gal.getImages(); 
                thumbnail = imageDAO.getImagesById(gal.getId_thumbnail_gallery());
            }
            
            // Get gallery
            String allComponents = "";
            for( Component c : template.getComponents() ) {
                allComponents += c.getName() + ", ";
            }
            allComponents = allComponents.substring(0, allComponents.length()-2);
            
            // Static data and SEO
            model.addAttribute("title", template.getName() + " - Pick Template");
            model.addAttribute("description", "Pick Template je jednoduchý nástroj pro vybrání šablony pro web. Je vhodný, jak pro programátory tak zákazníky. Vyhledávání je založeno na hodnocení zákazníků.");
            model.addAttribute("url", request.getRequestURL().toString()); 
            model.addAttribute("h1", template.getName()); 
            
            model.addAttribute("template", template); 
            model.addAttribute("allComponents", allComponents); 
            model.addAttribute("thumbnail", thumbnail);
            model.addAttribute("images", images);            
            return "template_detail";
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index.html";
    }
    
    @RequestMapping(value = {"/info/"}, method = RequestMethod.GET)
    public String info(Model model, HttpServletRequest request) {
        try {             
            // Static data and SEO
            model.addAttribute("title", "Informace - Pick Template");
            model.addAttribute("description", "Pick Template je jednoduchý nástroj pro vybrání šablony pro web. Je vhodný, jak pro programátory tak zákazníky. Vyhledávání je založeno na hodnocení zákazníků.");
            model.addAttribute("url", request.getRequestURL().toString()); 
            model.addAttribute("h1", "Informace"); 
            return "info";
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index.html";
    }
    
    @RequestMapping(value = {"/kontakt/"}, method = RequestMethod.GET)
    public String kontakt(Model model, HttpServletRequest request) {
        try {             
            // Static data and SEO
            model.addAttribute("title", "Kontakt - Pick Template");
            model.addAttribute("description", "Pick Template je jednoduchý nástroj pro vybrání šablony pro web. Je vhodný, jak pro programátory tak zákazníky. Vyhledávání je založeno na hodnocení zákazníků.");
            model.addAttribute("url", request.getRequestURL().toString()); 
            model.addAttribute("h1", "Kontakt"); 
            return "kontakt";
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index.html";
    }
}
