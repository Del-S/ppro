package cz.picktemplate.web.model.dao;
import cz.picktemplate.web.model.Image;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class ImageDaoImpl implements ImageDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Image> getAllImages() {
        return this.sessionFactory.getCurrentSession().createCriteria(Image.class).list();
         }

    @Override
    public Image getImagesById(int id) {
        return (Image) sessionFactory.getCurrentSession().get(Image.class, id);
    }

    @Override
    public void addImage(Image image) {
        this.sessionFactory.getCurrentSession().save(image);
    }

    @Override
    public void updateImage(Image image) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(image);
    }

    @Override
    public void deleteImage(Integer image_id) {
    Image image = (Image) sessionFactory.getCurrentSession().load(Image.class, image_id);
        if (null != image) {
            this.sessionFactory.getCurrentSession().delete(image);
        }    
    }
    @Override
    public List<Image> getImagesByRow(String row, String operand , String stringArray) {
        return this.sessionFactory.getCurrentSession().createCriteria(Image.class).add(Restrictions.sqlRestriction(row + " " + operand + " (" + stringArray + ")")).list();  
    }

    @Override
    public void updateMultipleImage(List<Image> images) {
        try {
            for(Image image : images) { 
                this.sessionFactory.getCurrentSession().update(image);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
