package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.security.SecureRandom;
import java.util.List;
import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.SmartValidator;
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
    
    @Autowired
    private AddressDAO addressDAO;
    
    @Autowired
    SmartValidator validator;
    
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
    public String add_user(Model model, @Valid @ModelAttribute("userAccount")UserAccount userAccount, BindingResult result) {
        try {
            Address address = userAccount.getAddress();
            User user = userAccount.getUser();
            Boolean addressSave = false;
            
            /* Address is not required */
            if( (!address.getAddress().isEmpty()) || (!address.getCity().isEmpty()) || (!address.getPostal_code().isEmpty()) ) {
                result.pushNestedPath("address");
                validator.validate(address, result);
                result.popNestedPath();
                addressSave = true;
            } 
                   
            /* Saves id of address to user */
            if(addressSave) { 
                addressDAO.addAddress(address); 
                user.setId_address(address.getId_address());
            } else {
                user.setId_address(-1);
            }
            
            /* Sets password only if the two passwords are set */
            if( (!user.getPassword().isEmpty()) && (user.getPassword().equals(userAccount.getPassword_check())) ) {
                /* Create custom password_check error */
                String hash = this.generateHash();
                user.setHash(hash);
                user.setPassword(this.hashPassword(userAccount.getPassword(), hash));
            }
            
            user.setToken("sdv");  // Also generate token
            //userDAO.addUser(user);
            
            /* Return form errors */
            if(result.hasErrors()) { 
                logger.error(result.getAllErrors());
                model.addAttribute("userAccount", userAccount);
                return "admin2543/new/user_new";
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        //return "redirect:view_users";
        
        model.addAttribute("userAccount", userAccount);
        return "admin2543/new/user_new";
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
    
    public String generateHash() {
        //String VALID_PW_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+{}[]|:;<>?,./";
        SecureRandom random = new SecureRandom();
        String hash = "";
        
        try { random.getInstance("SHA1PRNG"); } catch (Exception e) { e.printStackTrace(); }
        random.setSeed(253466875);
        byte[] salt = new byte[50];
        random.nextBytes(salt);
        
        for(int i=0; i<salt.length; i++) {
            
        }
        
        // Finish this :)
        
            logger.error(" Secure Random # generated using setSeed(byte[]) is  " + salt.toString());
        return "hash";
    }
    
    public String hashPassword(String password, String hash) {
        
        return password;
    }
    
}
