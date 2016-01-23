package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Address;

public interface AddressDAO {
    Address getAddressById(int id);
    void addAddress(Address address);
    void updateAddress(Address address);
    void deleteAddress(Integer address_id);
}
