package cz.picktemplate.web.model.dao;

import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class OrderDaoImpl implements OrderDAO {
    @Autowired
    private SessionFactory sessionFactory;
}
