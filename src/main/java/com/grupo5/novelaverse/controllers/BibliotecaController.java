package com.grupo5.novelaverse.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.services.NovelService;
import com.grupo5.novelaverse.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class BibliotecaController {
    
    @Autowired
    private NovelService novelService;
    @Autowired
    private UserService userService;

    @GetMapping("/biblioteca")
    public String biblioteca(Model model,HttpSession session){

        Long userId = (Long) session.getAttribute("userId");

        List<Novel> novels = novelService.findAll();
        model.addAttribute("novels", novels);

        User user = userService.findById(userId);
        model.addAttribute("user", user);

        return "biblioteca";
    }
}
