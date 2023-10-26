package com.grupo5.novelaverse.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.models.Rating;
import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.services.NovelService;
import com.grupo5.novelaverse.services.RatingServicie;
import com.grupo5.novelaverse.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/rating")
public class RatingController {

    @Autowired private NovelService novelService;
    @Autowired private RatingServicie ratingServicie;
    @Autowired private UserService userService;

    @PostMapping("/{novelId}/add")
    public String ratingAdd(
        @PathVariable("novelId") Long novelId,
        @RequestParam(name = "rating", required = false)String calification,
        HttpSession session) {

        if (calification == null || session.getAttribute("userId").equals(null)) {
            return "redirect:/novel/"+novelId.toString();
        }

        Long userId = (Long) session.getAttribute("userId");
        ratingServicie.save(userId, novelId, Integer.parseInt(calification));

        Novel novel =novelService.findById(novelId);

        novel.setAvgRating(ratingServicie.getAvgRatingsByNovel(novel));

        novelService.update(novel);

        return "redirect:/novel/"+novelId.toString();
    }
    
}
