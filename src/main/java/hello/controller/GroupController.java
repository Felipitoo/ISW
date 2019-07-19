package hello.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hello.entity.Group;
import hello.repository.GroupRepo;
import hello.service.GroupService;


@RestController
@RequestMapping("/v1")
public class GroupController {
    @Autowired
    @Qualifier("GroupService")
    GroupService service;

    @Autowired
    @Qualifier("GroupRepo")
    GroupRepo Grouprepo;

    @PostMapping("/grupos")
    public List<Group> obtenerUsers() {
        return service.obtenerPorPaginacion();

    } 

}