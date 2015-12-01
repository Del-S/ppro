package cz.picktemplate.web.controller;

import cz.picktemplate.web.model.User;
import cz.picktemplate.web.model.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class adminController {
    
    @Autowired
    private UserDAO userDAO;
    
    @RequestMapping(value = {"/admin2543/", "/admin2543/index"  }, method = RequestMethod.GET)
    public String index(Model model) {
        User admin = userDAO.getUserById(0);
        
        model.addAttribute("admin", admin);
        return "admin2543/index";
    }
    
    
    @RequestMapping(value = "/admin2543/viewTemplates", method = RequestMethod.GET)
    public String login() {
        return "admin2543/template";
    }
}
