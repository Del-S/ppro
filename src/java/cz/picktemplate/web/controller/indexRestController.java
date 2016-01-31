/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.picktemplate.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(value = {"template"})
@Transactional
@RestController
public class indexRestController { 
    @Autowired
    private TemplateDAO templateDAO;
    
    @Autowired
    private ImageDAO imageDAO;
    
    private static final Logger logger = Logger.getLogger(indexRestController.class);
    List<Template> allTemplates;
    
    @RequestMapping(value = {"/update_template_display"}, method = RequestMethod.POST)
    @ResponseBody
    public List<Template> updateTemplateDisplay(@RequestBody String components) throws Exception {
        try {
            allTemplates = templateDAO.getAllTemplates();

            ObjectMapper mapper = new ObjectMapper();
            List<String> componentaArray = mapper.readValue(components, List.class);
            List<String> componentTemplateArray = new ArrayList<String>();
            List<Template> outTemplates = new ArrayList<Template>();
            
            /* 
                Load components
                If (selected components are not empty) then create list of template components and compare them.
                Else all templates will be displayed
            */
            for( Template t : allTemplates ) {
                Hibernate.initialize(t.getComponents());
                if( !componentaArray.isEmpty() ) {
                    for(Component c : t.getComponents()) {
                        componentTemplateArray.add(c.getId_component().toString());
                    }
                    if(componentTemplateArray.containsAll(componentaArray)) { outTemplates.add(t); }
                } else {
                    outTemplates = allTemplates;
                }
                componentTemplateArray.clear();
            }

            logger.info(components);
            
            for(Template t : outTemplates) {
                Hibernate.initialize(t.getGallery());
                Gallery gal = t.getGallery();
                if( gal != null ) {
                    Integer id_thumbnail_gallery = gal.getId_thumbnail_gallery();
                    t.setThumbnail( imageDAO.getImagesById(id_thumbnail_gallery) );
                }
            }
            // Here will be call for get all templates by components
            return outTemplates;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
