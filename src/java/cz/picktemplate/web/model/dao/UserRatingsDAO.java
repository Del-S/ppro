package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.UserRatings;
import java.util.List;

public interface UserRatingsDAO {
    UserRatings getUserRatingsById(int id);
    void addUserRatings(UserRatings userRating);
    void updateUserRatings(UserRatings userRating);
    List<UserRatings> getAllUserRatings();
    void deleteUserRatings(Integer userRating_id);
    
    List<UserRatings> getUserRatingsByRow(String row, String operand , String stringArray);
}
