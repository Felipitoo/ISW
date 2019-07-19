package hello.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import hello.entity.User;

@Component("UserConverter")
public class UserConverter {
    public List<User> convertirLista(List<User> users) {
        List<User> musers = new ArrayList<>();
        for (User user : users){
            musers.add(new User(user));
        }
        return musers;
    }
}