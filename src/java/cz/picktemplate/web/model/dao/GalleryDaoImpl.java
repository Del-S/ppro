package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Gallery;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class GalleryDaoImpl implements GalleryDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Gallery getGalleryById(int id) {
        return (Gallery) sessionFactory.getCurrentSession().get(Gallery.class, id);
    }

    @Override
    public void addGallery(Gallery gallery) {
         this.sessionFactory.getCurrentSession().save(gallery);
    }

    @Override
    public void updateGallery(Gallery gallery) {
        this.sessionFactory.getCurrentSession().update(gallery);
    }

    @Override
    public void deleteGallery(Integer gallery_id) {
        Gallery gallery = (Gallery) sessionFactory.getCurrentSession().load(Gallery.class, gallery_id);
        if (null != gallery) {
            gallery.setImages(null);
            this.sessionFactory.getCurrentSession().delete(gallery);
        }
    }

    @Override
    public List<Gallery> getAllGalleries() {
        return this.sessionFactory.getCurrentSession().createCriteria(Gallery.class).list();
    }
}
