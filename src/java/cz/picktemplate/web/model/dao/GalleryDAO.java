package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Gallery;
import java.util.List;

public interface GalleryDAO {
    Gallery getGalleryById(int id);
    void addGallery(Gallery gallery);
    void updateGallery(Gallery gallery);
    List<Gallery> getAllGalleries();
    void deleteGallery(Integer gallery_id);
}
