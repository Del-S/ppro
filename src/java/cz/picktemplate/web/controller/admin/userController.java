package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.*;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.List;
import java.util.Random;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
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
            Address address = addressDAO.getAddressById(user.getId_address());

            /* Maybe some better solution? */
            if(userId.equals(user.getId_user())) {
                UserAccount userAccount = new UserAccount(); // change to use user and address
                userAccount.setUser(user);
                userAccount.setAddress(address);
                
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
    public String add_user(Model model, @ModelAttribute("userAccount")UserAccount userAccount, BindingResult result) {
        try {
            Address address = userAccount.getAddress();
            User user = userAccount.getUser();

            /* Sets password only if the two passwords are set */
            if( (!user.getPassword().isEmpty()) && (user.getPassword().equals(userAccount.getPassword_check())) ) {
                /* Create custom password_check error */
                String salt = user.generateHashToken(true);
                user.setSalt(salt);
                String password = user.hashPassword(user.getPassword(), salt);
                user.setPassword(password);
            } else {
                // TODO: Return error
            }
            user.setToken(user.generateHashToken(false));
            
            /* Check for errors in form */
            Boolean addressSave = false;    // Address is not required
            if( (!address.getAddress().isEmpty()) || (!address.getCity().isEmpty()) || (!address.getPostal_code().isEmpty()) ) {
                result.pushNestedPath("address");
                validator.validate(address, result);
                result.popNestedPath();
                addressSave = true;
            } 

            result.pushNestedPath("user");
            validator.validate(user, result);
            result.popNestedPath();
            
            /* Return with errors */
            if(result.hasErrors()) { 
                logger.error(result.getAllErrors());
                model.addAttribute("userAccount", userAccount);
                return "admin2543/new/user_new";
            }
            
            /* Saves address and user */
            if(addressSave) { 
                addressDAO.addAddress(address); 
                user.setId_address(address.getId_address());
            } else {
                user.setId_address(null);
            }
            userDAO.addUser(user);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_users";
    }
    
    @RequestMapping(value = {"/admin2543/update_user"}, method = RequestMethod.POST)
    public String update_user(Model model, @ModelAttribute("userAccount")UserAccount userAccount, BindingResult result) {
        try {
            User user = userAccount.getUser();
            Address address = userAccount.getAddress();
            
            /* Sets password only if the two passwords are set */
            if( (!userAccount.getPassword().isEmpty()) && (userAccount.getPassword().equals(userAccount.getPassword_check())) ) {
                /* Create custom password_check error */
                String salt = user.generateHashToken(true);
                user.setSalt(salt);
                String password = user.hashPassword(userAccount.getPassword(), salt);
                user.setPassword(password);
            }
            
            /* Check for errors in form */
            Boolean addressSave = false;    // Address is not required
            if( (!address.getAddress().isEmpty()) || (!address.getCity().isEmpty()) || (!address.getPostal_code().isEmpty()) ) {
                result.pushNestedPath("address");
                validator.validate(address, result);
                result.popNestedPath();
                addressSave = true;
            } 

            result.pushNestedPath("user");
            validator.validate(user, result);
            result.popNestedPath();
            
            /* Return with errors */
            if(result.hasErrors()) { 
                logger.error(result.getAllErrors());
                model.addAttribute("userAccount", userAccount);
                return "admin2543/detail/user_detail";
            }
            
            /* Saves address and user */
            if(addressSave) { 
                addressDAO.updateAddress(address); 
            }
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
            if(us.getId_address() != null) {
                addressDAO.deleteAddress(us.getId_address());
            }
            userDAO.deleteUser(userId);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_users";
    }
}
