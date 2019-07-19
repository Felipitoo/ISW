package hello.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import hello.converter.UserConverter;
import hello.entity.User;
import hello.repository.UserRepo;

@Service("UserService")
public class UserService {
    @Autowired
    @Qualifier("UserRepo")
    private UserRepo userrepo;

    @Autowired
    @Qualifier("UserConverter")
    private UserConverter userconverter;

    public List<User> obtenerPorPaginacion() {
        return userconverter.convertirLista(userrepo.findAll());
    }


}