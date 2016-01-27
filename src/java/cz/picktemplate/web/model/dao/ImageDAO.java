package cz.picktemplate.web.model.dao;
import cz.picktemplate.web.model.Image;
import java.util.List;

public interface ImageDAO {
    Image getImagesById(int id);
    List<Image> getAllImages();
    void addImage(Image image);
    void updateImage(Image image);
    void deleteImage(Integer image_id);
/* get adress, set adress etc */
}
