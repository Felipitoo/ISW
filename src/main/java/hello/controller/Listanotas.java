package hello.controller;

import hello.model.MNota;
import hello.service.NotaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import hello.entity.Nota;

import java.util.List;

@Controller

@RequestMapping("/prueba")
public class Listanotas {

    @Autowired
    private NotaService NotaService;

    @GetMapping("/notas")
    public ModelAndView devolverTodos(){
        List <MNota> lista_notas;
        lista_notas = NotaService.buscar_notas();
        ModelAndView mav = new ModelAndView("notas");
        mav.addObject("notas", lista_notas);
        return mav;
    }
}