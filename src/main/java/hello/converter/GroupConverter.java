package hello.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import hello.entity.Group;



@Component("GroupConverter")
public class GroupConverter {
    public List<Group> convertirLista(List<Group> groups) {
        List<Group> mgroups = new ArrayList<>();
        for (Group group : groups){
            mgroups.add(new Group(group));
        }
        return mgroups;
    }
}