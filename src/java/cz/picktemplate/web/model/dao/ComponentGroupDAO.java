package cz.picktemplate.web.model.dao;

import cz.picktemplate.web.model.ComponentGroup;
import java.util.List;

public interface ComponentGroupDAO {
    ComponentGroup getComponentGroupById(int id);
    void addComponentGroup(ComponentGroup componentGroup);
    void updateComponentGroup(ComponentGroup componentGroup);
    List<ComponentGroup> getAllComponentGroups();
    void deleteComponentGroup(Integer component_group_id);
}
