package cz.picktemplate.web.controller;

import cz.picktemplate.web.controller.admin.componentController;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {
    
    private static final Logger logger = Logger.getLogger(componentController.class);
    
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        
        model.addAttribute("title", "Úvod - Pick Template");
        model.addAttribute("description", "Pick Template je jednoduchý nástroj pro vybrání šablony pro web. Je vhodný, jak pro programátory tak zákazníky. Vyhledávání je založeno na hodnocení zákazníků.");
        model.addAttribute("url", request.getRequestURL().toString());     
        return "index";
    }
}
