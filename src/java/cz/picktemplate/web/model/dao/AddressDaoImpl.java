package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Address;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional  
public class AddressDaoImpl implements AddressDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Address getAddressById(int id) {
        return (Address) sessionFactory.getCurrentSession().get(Address.class, id);
    }

    @Override
    public void addAddress(Address address) {
        this.sessionFactory.getCurrentSession().save(address);
    }

    @Override
    public void updateAddress(Address address) {
        this.sessionFactory.getCurrentSession().update(address);
    }

    @Override
    public void deleteAddress(Integer address_id) {
        Address address = (Address) sessionFactory.getCurrentSession().load(Address.class, address_id);
        if (null != address) {
            this.sessionFactory.getCurrentSession().delete(address);
        }
    }
}
