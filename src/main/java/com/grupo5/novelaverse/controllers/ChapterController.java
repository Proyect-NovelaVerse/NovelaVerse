package com.grupo5.novelaverse.controllers;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.Chapter;
import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.services.ChapterService;
import com.grupo5.novelaverse.services.NovelService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/novel")
public class ChapterController {

    @Autowired
    private ChapterService chapterService;
    @Autowired
    private NovelService novelService;
    
    @GetMapping("/{id}/chapter/new")
    public String newChapter(@ModelAttribute("chapter")Chapter chapter, Model model,@PathVariable("id")Long novelId){
        
        Novel novel =novelService.findById(novelId);
        model.addAttribute("novel", novel);

        // Novel novel = novelService.findById((Long) session.getAttribute("novelId"));
        // model.addAttribute("novel", novel);
        return "chapter";
    }

    @PostMapping("/chapter/new")
    public String addChapter(
        @Valid @ModelAttribute("chapter")Chapter chapter, BindingResult result,
        @RequestParam("novelId")Long novelId,HttpSession session){

        if (result.hasErrors()) {
            return "chapter"; 
        } else {
            Novel novel = novelService.findById(novelId);
            chapter.setNovel(novel);

            List<Chapter> existChapters = chapterService.getAllChaptersForNovel(novelId);
            int nexChapterOrder = existChapters.size() + 1;
            chapter.setOrder(nexChapterOrder);

            Date date = Date.from(Instant.now());
            novel.setUpdate_at(date);
            

            chapterService.save(chapter);
            return "redirect:/novel/" + novelId  ;
        }
    }
}
