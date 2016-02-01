package cz.picktemplate.web.controller.admin;

import cz.picktemplate.web.model.Image;
import cz.picktemplate.web.model.User;
import cz.picktemplate.web.model.dao.ImageDAO;
import cz.picktemplate.web.model.dao.UserDAO;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@RequestMapping("login")
public class LoginController {
   
    @Autowired
    private UserDAO userDAO;
    
	@RequestMapping(method = RequestMethod.GET)
	public String login(Model model){
          
		return "login";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String userCheck(ModelMap model, HttpServletRequest request, HttpServletRequest response) throws NoSuchAlgorithmException, InvalidKeySpecException{
		
            
                final String name=request.getParameter("name");
		final String pwd=request.getParameter("pwd");
                
                
                User user = userDAO.findByUserName(name);
                
                if(user == null){
                    model.put("error", "Invalid UserName / Password");
                    return "redirect:login";
                }else{
                
                
                String pwdDB = user.getPassword();
                String salt = user.getSalt();
                
                boolean isValidUser = user.comparePasswords(pwdDB, salt, pwd);
                 
	           if(isValidUser){
                       
                       return "redirect:admin2543/index"; 
                       
                       
                   }else{
                       model.put("error", "Invalid UserName / Password");
                       return "redirect:login";
                   }
                   
                }   
        }
}
 

