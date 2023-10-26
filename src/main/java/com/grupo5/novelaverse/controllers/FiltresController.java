package com.grupo5.novelaverse.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.services.NovelService;

@Controller
@RequestMapping("/novel")
public class FiltresController {
    
    @Autowired
    private NovelService novelService;

    @GetMapping("/filtres")
    public String filtres(Model model) {
        List<Novel> novels = novelService.findAll();
        model.addAttribute("novels", novels);
        return "filtres";
    }

    @PostMapping("/filtres")
    public String seachByFiltres(
        @RequestParam("category")String category,
        @RequestParam("rating")Double rating,
        Model model
    ){
           
        return "redirect:/novel/filtres/" + category + "/" + rating; 
    }

    @GetMapping("/filtres/{category}/{rating}")
    public String filtres(@PathVariable("category")String category,
    @PathVariable("rating")Double rating, Model model)
    {
        List<Novel> novels = novelService.buscarNovelasPorCategoriaYRating(category, rating);
        model.addAttribute("novels", novels);
        return "filtres";
    }


}
