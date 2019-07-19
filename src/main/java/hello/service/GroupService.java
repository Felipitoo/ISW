package hello.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import hello.converter.GroupConverter;
import hello.entity.Group;
import hello.repository.GroupRepo;

@Service("GroupService")
public class GroupService {
    @Autowired
    @Qualifier("GroupRepo")
    private GroupRepo Grouprepo;

    @Autowired
    @Qualifier("GroupConverter")
    private GroupConverter Groupconverter;

    public List<Group> obtenerPorPaginacion() {
        return Groupconverter.convertirLista(Grouprepo.findAll());
    }


}