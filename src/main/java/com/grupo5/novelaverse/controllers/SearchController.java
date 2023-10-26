package com.grupo5.novelaverse.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.services.SearchService;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @GetMapping("/search")
    public String buscarNovelasPorTitulo(@RequestParam(name = "q", required = false) String q, Model model) {
        List<Novel> resultados = searchService.buscarNovelasPorTitulo(q);
        model.addAttribute("resultados", resultados);
        
        if (resultados.isEmpty()) {
            resultados = searchService.getAllNovels();
        }   
        return "search";
    }
    
    
    
}
