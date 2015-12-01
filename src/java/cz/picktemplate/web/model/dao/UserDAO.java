package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.User;
import java.util.List;

public interface UserDAO {
    User getUserById(int id);
    void addUser(User user);
    List<User> getAllEmployees();
    void deleteUser(Integer user_id);
}
