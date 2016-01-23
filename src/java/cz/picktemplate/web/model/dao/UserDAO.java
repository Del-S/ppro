package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.User;
import java.util.List;

public interface UserDAO {
    User getUserById(int id);
    User getUserByLogin(String login);
    void addUser(User user);
    void updateUser(User user);
    List<User> getAllUsers();
    void deleteUser(Integer user_id);
}
