package cz.picktemplate.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class adminController {
    
    @RequestMapping(value = "/admin2543/", method = RequestMethod.GET)
    public String index() {
        return "admin2543/index";
    }
    
    @RequestMapping(value = "/admin2543/viewTemplates", method = RequestMethod.GET)
    public String login() {
        return "admin2543/template";
    }
}
