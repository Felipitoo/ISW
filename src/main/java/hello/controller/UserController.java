package hello.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hello.entity.User;
import hello.repository.UserRepo;
import hello.service.UserService;

@RestController
@RequestMapping("/v1")
public class UserController {
    @Autowired
    @Qualifier("UserService")
    UserService service;

    @Autowired
    @Qualifier("UserRepo")
    UserRepo Userrepo;

    @PostMapping("/notas")
    public List<User> obtenerUsers() {
        return service.obtenerPorPaginacion();

    } 

}
