package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class adminController {
    
    @Autowired
    private UserDAO userDAO;
    
    @RequestMapping(value = {"/admin2543/", "/admin2543/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin2543/index";
    }
    
    @RequestMapping(value = {"/admin2543/login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "admin2543/login";
    }
    
    /*@RequestMapping(value = {"/admin2543/login"}, method=RequestMethod.POST)
    public String executeLogin(Model model)
    {
        try {
            boolean isValidUser = loginDelegate.isValidUser(loginBean.getUsername(), loginBean.getPassword());
            if(isValidUser)
            {
                System.out.println("User Login Successful");
                request.setAttribute("loggedInUser", loginBean.getUsername());
                model = new ModelAndView("welcome");
            } else {
                model = new ModelAndView("login");
                model.addObject("loginBean", loginBean);
                request.setAttribute("message", "Invalid credentials!!");
            }
 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return "admin2543/login";
    }*/
   
    
    @RequestMapping(value = {"/admin2543/view_users"}, method = RequestMethod.GET)
    public String view_users(Model model) {
        List<User> users = userDAO.getAllUsers();
        
        model.addAttribute("users", users);
        return "admin2543/user";
    }
}
