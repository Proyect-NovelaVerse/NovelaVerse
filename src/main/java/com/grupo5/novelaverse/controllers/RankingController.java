package com.grupo5.novelaverse.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.services.SearchService;

@Controller
public class RankingController {

    @Autowired private SearchService searchService;

    @GetMapping("/ranking")
    public String rankig(Model model) {
        List<Novel> novels = searchService.getAllNovels();
        model.addAttribute("novels", novels);

        return "ranking";
    }

}
    
