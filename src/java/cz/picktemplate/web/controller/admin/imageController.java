package cz.picktemplate.web.controller.admin;
import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.ImageDAO;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes(value = {"image"})
public class imageController{
   
    @Autowired
    private ImageDAO imageDAO;
    private int miniatura = 250;
    ImageIcon i;
    
    
        private static final Logger logger = LoggerFactory
            .getLogger(imageController.class);
 
    
    @RequestMapping(value = {"/admin2543/view_images"}, method = RequestMethod.GET)
    public String view_image(Model model) {
        List<Image> images = imageDAO.getAllImages();
        
        model.addAttribute("image", new Image());
        model.addAttribute("images", images);
        return "/admin2543/image";
    }
    @RequestMapping(value = {"/admin2543/trash_image"}, method = RequestMethod.GET)
    public String trash_image(Model model, @RequestParam(value = "image", required = false, defaultValue = "-1") final String imageId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer imagId = Integer.parseInt(imageId);                 
        
            imageDAO.deleteImage(imagId);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_images";
    }
    @RequestMapping(value = {"/admin2543/detail_image"}, method = RequestMethod.GET)
    public String detail_image(Model model, @RequestParam(value = "image", required = false, defaultValue = "-1") final String imageId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer imagId = Integer.parseInt(imageId);               
            Image image = imageDAO.getImagesById(imagId);

            /* Maybe some better solution? */
            if(imagId.equals(image.getId_image())) {
                model.addAttribute("image", image);
                return "admin2543/detail/image_detail";
            } else { 
                return "redirect:view_images";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_images";
        }
    }
    @RequestMapping(value = {"/admin2543/update_image"}, method = RequestMethod.POST)
    public String update_image(Model model, @ModelAttribute("image")Image image) {
        try {
            imageDAO.updateImage(image);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_images";
    }
    @RequestMapping(value = {"/admin2543/add_image"}, method = RequestMethod.POST)
    public String add_image(Model model, @RequestParam("file") MultipartFile file, @ModelAttribute("image")Image image, HttpServletRequest request) throws IOException {
        i = new ImageIcon(file.getOriginalFilename());
        ServletContext context = request.getServletContext();
        String rootPath = context.getRealPath("/");
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Create the file on server
                File serverFile = new File(rootPath+ "assets/uploads/" +i);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                
                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());
                // tvoreni miniatury
                ImageIcon ii = new ImageIcon(rootPath+ "assets/uploads/" +i);
                BufferedImage bi = new BufferedImage(miniatura, miniatura, BufferedImage.TYPE_INT_RGB);
                        Graphics2D g2d = (Graphics2D)bi.createGraphics();
                        g2d.addRenderingHints(new RenderingHints(RenderingHints.KEY_RENDERING,
                                RenderingHints.VALUE_RENDER_QUALITY));
                        boolean b = g2d.drawImage(ii.getImage(), 0, 0, miniatura, miniatura, null);
                        System.out.println(b);
                        ImageIO.write(bi, "jpg", new File(rootPath+ "assets/uploads/thumbnail"+File.separator+i));
                       
                
                       
            } catch (Exception e) {
               e.printStackTrace();
            }
            
        } 
        else {
            return "You failed to upload "
                    + " because the file was empty.";
        }
        image.setImage_src("assets/uploads/" +i);
        imageDAO.addImage(image);
        return "redirect:view_images";
    }
    }
   
