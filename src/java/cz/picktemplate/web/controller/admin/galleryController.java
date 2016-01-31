package cz.picktemplate.web.controller.admin;
import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.GalleryDAO;
import cz.picktemplate.web.model.dao.ImageDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import javax.swing.ImageIcon;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.transaction.Transactional;
import javax.validation.Valid;

@Controller
@SessionAttributes(value = {"image","gallery"})
@Transactional
public class galleryController{
   
    @Autowired
    private ImageDAO imageDAO;
    @Autowired
    private GalleryDAO galleryDAO;
    
    ImageIcon i;
    
    List<Image> images;
    private Map<String, Component> imagesMap = new HashMap<String, Component>();
    
    
        private static final Logger logger = LoggerFactory
            .getLogger(imageController.class);
    
    @RequestMapping(value = {"/admin2543/view_galleries"}, method = RequestMethod.GET)
    public String view_galleries(Model model) {
        List<Gallery> galleries = galleryDAO.getAllGalleries();

        model.addAttribute("galleries", galleries);
        return "/admin2543/gallery";
    }
    @RequestMapping(value = {"/admin2543/trash_gallery"}, method = RequestMethod.GET)
    public String trash_gallery(Model model, @RequestParam(value = "gallery", required = false, defaultValue = "-1") final String galleryID) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer galleryyID = Integer.parseInt(galleryID); 
           
            galleryDAO.deleteGallery(galleryyID);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_galleries";
    }
    @RequestMapping(value = {"/admin2543/detail_gallery"}, method = RequestMethod.GET)
    public String detail_gallery(Model model, @RequestParam(value = "gallery", required = false, defaultValue = "-1") final String galleryId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer galleryyId = Integer.parseInt(galleryId);               
            Gallery gallery = galleryDAO.getGalleryById(galleryyId);
            /* Maybe some better solution? */
            if(galleryyId.equals(gallery.getId_gallery())) {
                model.addAttribute("gallery", gallery);
                return "admin2543/detail/gallery_detail";
            } else { 
                return "redirect:view_galleries";
            }
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:view_galleries";
        }
    }
    @RequestMapping(value = {"/admin2543/update_gallery"}, method = RequestMethod.POST)
    public String update_template(Model model, @Valid @ModelAttribute("gallery")Gallery gallery) {
        try {
                model.addAttribute("gallery", gallery);
                galleryDAO.updateGallery(gallery);
                return "admin2543/detail/gallery_detail";
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_galleries";
    }

    @RequestMapping(value = {"/admin2543/add_gallery"}, method = RequestMethod.POST)
    public String add_component(Model model, @Valid @ModelAttribute("gallery")Gallery gallery) {
        try { 
            
            List<Gallery> galleries = galleryDAO.getAllGalleries();
                model.addAttribute("gallery", gallery);
                model.addAttribute("galleries", galleries);
                model.addAttribute("images", this.getImagesName());
                //model.addAttribute("images", this.getSrc());
                
            galleryDAO.addGallery(gallery);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_gallery";
    }
    @RequestMapping(value = {"/admin2543/new_gallery"}, method = RequestMethod.GET)
    public String new_gallery(Model model) {
        /* Convert in RequestParam is returning error 400 - better this way */
             List<Gallery> galleries = galleryDAO.getAllGalleries();
             
             model.addAttribute("gallery", new Gallery());
             model.addAttribute("galleries", galleries);
             model.addAttribute("images", this.getImagesName());
            return "admin2543/new/gallery_new";
    }
    
    /* Non-mapping functions */
    private Map<Integer, String> getImagesName() {
        List<Image> images = imageDAO.getAllImages();
        
        Map<Integer, String> imageNames = new LinkedHashMap<Integer, String>();
        for(Image img : images) {
            imageNames.put(img.getId_image(), img.getImage_alt());
        } 
        return imageNames;
    }
    private List<Integer> getID() {
        
        List<Image> images = imageDAO.getAllImages();
        
        List<Integer> id = new ArrayList<>();
        for(Image im : images) {
            id.add(im.getId_image());
        } 
        return id;
    }
    
     private List<String> getSrc() {
        
        List<Image> images = imageDAO.getAllImages();
        
        List<String> imageSrc = new ArrayList<>();
        for(Image image : images) {
            imageSrc.add("../"+image.getThumbnail());
        } 
        return imageSrc;
    }
     private void updateImage (){
         
     }
    }
   
