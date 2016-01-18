package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.Component;
import java.util.List;

public interface ComponentDAO {
    Component getComponentById(int id);
    void addComponent(Component component);
    void updateComponent(Component component);
    List<Component> getAllComponents();
    void deleteComponent(Integer component_id);
}
