package com.grupo5.novelaverse.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.services.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private NovelService novelService;
    
    @GetMapping("")
    public String novel(Model model) {
        // List<Novel> novels = novelService.findAll();
        // model.addAttribute("novels", novels);


        List<Novel> firstNovels = novelService.findLatestNovelsAsc(4);
        model.addAttribute("firstNovels", firstNovels);

        List<Novel> latestNovels = novelService.findLatestNovelsDesc(4);
        model.addAttribute("latestNovels", latestNovels);
        return "index";
    }    

}
