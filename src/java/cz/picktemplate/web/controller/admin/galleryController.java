package cz.picktemplate.web.controller.admin;
import cz.picktemplate.web.model.*;
import cz.picktemplate.web.model.dao.GalleryDAO;
import cz.picktemplate.web.model.dao.ImageDAO;
import java.beans.PropertyEditorSupport;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.WebRequest;

@Controller
@SessionAttributes(value = {"images","gallery"})
@Transactional
public class galleryController{
   
    @Autowired
    private ImageDAO imageDAO;
    @Autowired
    private GalleryDAO galleryDAO;
    
    ImageIcon i;
    List<Image> images;
    Map<String, Image> imageMap;
    
    private static final Logger logger = LoggerFactory.getLogger(galleryController.class);
    
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
    public String detail_gallery(Model model, @RequestParam(value = "gallery", required = false, defaultValue = "-1") final String galId) {
        /* Convert in RequestParam is returning error 400 - better this way */
        try {
            Integer galleryId = Integer.parseInt(galId);               
            Gallery gallery = galleryDAO.getGalleryById(galleryId);
            images = imageDAO.getImagesByRow("id_gallery", "is", "NULL");
            images.addAll(gallery.getImages());
            this.getImagesMap();
            
            /* Maybe some better solution? */
            if(galleryId.equals(gallery.getId_gallery())) {
                model.addAttribute("gallery", gallery);
                model.addAttribute("images", images);
                return "admin2543/detail/gallery_detail";
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_galleries";
    }
    
    @RequestMapping(value = {"/admin2543/update_gallery"}, method = RequestMethod.POST)
    public String update_template(Model model, @Valid @ModelAttribute("gallery")Gallery gallery, BindingResult result) {
        try {
            for(Image i : gallery.getImages()) {
                logger.info(i.getImage_alt().toString());
            }
            
            /* Return with errors */
            if(result.hasErrors()) { 
                //logger.error(result.getAllErrors());   
                model.addAttribute("gallery", gallery);
                return "admin2543/detail/gallery_detail";
            }
            
            galleryDAO.updateGallery(gallery);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_galleries";
    }

    @RequestMapping(value = {"/admin2543/add_gallery"}, method = RequestMethod.POST)
    public String add_component(Model model, @Valid @ModelAttribute("gallery")Gallery gallery, BindingResult result) {
        try { 
            /* Return with errors */
            if(result.hasErrors()) { 
                //logger.error(result.getAllErrors());   
                model.addAttribute("gallery", gallery);
                return "admin2543/new/gallery_new";
            }

            galleryDAO.addGallery(gallery);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:view_galleries";
    }
    
    @RequestMapping(value = {"/admin2543/new_gallery"}, method = RequestMethod.GET)
    public String new_gallery(Model model) {
        /* Convert in RequestParam is returning error 400 - better this way */
        images = imageDAO.getImagesByRow("id_gallery", "is", "NULL");
        this.getImagesMap();
        
        
        model.addAttribute("gallery", new Gallery());
        model.addAttribute("images", images);
        return "admin2543/new/gallery_new";
    }
    
    /* Non-mapping functions */
    private Map<String, Image> getImagesMap() {        
        imageMap = new LinkedHashMap<String, Image>();
        for(Image img : images) {
            imageMap.put(img.getId_image().toString(), img);
        } 
        return imageMap;
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        binder.registerCustomEditor(Image.class, "images", new PropertyEditorSupport() {
            @Override
            public void setAsText(String id_images) {
                Image image = imageMap.get(id_images);
                setValue((id_images.equals(""))?null:image);
            }
        });
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
   
