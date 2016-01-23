package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.util.List;
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
@SessionAttributes(value = {"userAccount"})
public class userController {
    @Autowired
    private UserDAO userDAO;
    
    private static final Logger logger = Logger.getLogger(userController.class);
    
    /* Mappings for Components */
    @RequestMapping(value = {"/admin2543/view_users"}, method = RequestMethod.GET)
    public String view_users(Model model) {
        List<User> users = userDAO.getAllUsers();
        
        model.addAttribute("users", users);
        return "admin2543/user";
    }
    
    @RequestMapping(value = {"/admin2543/detail_user"}, method = RequestMethod.GET)
    public String detail_user(Model model, @RequestParam(value = "us", required = false, defaultValue = "-1") final String usId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer userId = Integer.parseInt(usId);               
            User user = userDAO.getUserById(userId);

            /* Maybe some better solution? */
            if(userId.equals(user.getId_user())) {
                UserAccount userAccount = new UserAccount(); // change to use user and address
                userAccount.setUser(user);
                
                model.addAttribute("userAccount", userAccount);
                return "admin2543/detail/user_detail";
            } else { 
                return "redirect:view_users";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_users";
        }
    }
    
    @RequestMapping(value = {"/admin2543/new_user"}, method = RequestMethod.GET)
    public String new_user(Model model) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            UserAccount userAccount = new UserAccount(new User(), new Address());

            model.addAttribute("userAccount", userAccount);
            return "admin2543/new/user_new";
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_users";
        }
    }
    
    @RequestMapping(value = {"/admin2543/add_user"}, method = RequestMethod.POST)
    public String add_user(Model model, @ModelAttribute("userAccount")UserAccount userAccount) {
        try {
            // update address
            User user = userAccount.getUser();
            if( (!userAccount.getPassword().isEmpty()) && (userAccount.getPassword().equals(userAccount.getPassword_check())) ) {
                user.setPassword(userAccount.getPassword());
            }
            user.setHash("password hash"); // generate password hash :)
            user.setToken("generate token");  // Also generate token
            user.setId_address(0); // create address and get id
            userDAO.addUser(user);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_users";
    }
    
    @RequestMapping(value = {"/admin2543/update_user"}, method = RequestMethod.POST)
    public String update_user(Model model, @ModelAttribute("userAccount")UserAccount userAccount) {
        try {
            User user = userAccount.getUser();
            if( (!userAccount.getPassword().isEmpty()) && (userAccount.getPassword().equals(userAccount.getPassword_check())) ) {
                user.setPassword(userAccount.getPassword());
            }
            // update address here
            userDAO.updateUser(user);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_users";
    }
    
    @RequestMapping(value = {"/admin2543/trash_user"}, method = RequestMethod.GET)
    public String trash_user(Model model, @RequestParam(value = "us", required = false, defaultValue = "-1") final String usId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer userId = Integer.parseInt(usId);                 
            
            User us = userDAO.getUserById(userId);
            // delete address by user
            userDAO.deleteUser(userId);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_users";
    }
    
}
