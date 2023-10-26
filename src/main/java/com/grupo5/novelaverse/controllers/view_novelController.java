package com.grupo5.novelaverse.controllers;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.Chapter;
import com.grupo5.novelaverse.models.ChapterCommentary;
import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.services.ChapterCommentaryService;
import com.grupo5.novelaverse.services.ChapterService;
import com.grupo5.novelaverse.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class view_novelController {

    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ChapterCommentaryService chapterCommentaryService;
    @Autowired
    private UserService userService;

    @GetMapping("/novel/{novelId}/chapter/{chapterOrder}")
    public String getChapterByNovelAndChapterOrder(@PathVariable String novelId, @PathVariable String chapterOrder,
            Model model) {

        if (!StringUtils.isNumeric(novelId) || !StringUtils.isNumeric(chapterOrder)) {

            model.addAttribute("errorMessage", "El capítulo que estás buscando no existe.");
            return "view_novel";
        }
        Long novelIdLong = Long.parseLong(novelId);
        Integer chapterOrderInt = Integer.parseInt(chapterOrder);

        Chapter chapter = chapterService.getChapterByNovelAndChapterOrder(novelIdLong, chapterOrderInt);
        if (chapter == null) {
            model.addAttribute("errorMessage", "El capítulo que estás buscando no existe.");
            return "view_novel";
        } else {
            Chapter nextChapter = chapterService.getNextChapterByNovelAndChapterOrder(novelIdLong, chapterOrderInt);
            Chapter previousChapter = chapterService.getPreviousChapterByNovelAndChapterOrder(novelIdLong, chapterOrderInt);
            List<ChapterCommentary> comentarios = chapterCommentaryService.getComentariosByChapter(chapter);

            model.addAttribute("comentarios", comentarios);
            model.addAttribute("chapter", chapter);
            model.addAttribute("hasNext", nextChapter != null);
            model.addAttribute("nextChapterOrder", nextChapter != null ? nextChapter.getOrder() : null);
            model.addAttribute("hasPrevious", previousChapter != null);
            model.addAttribute("previousChapterOrder", previousChapter != null ? previousChapter.getOrder() : null);
        }

        return "view_novel";
    }

    @PostMapping("/novel/{novelId}/chapter/{chapterOrder}")
    public String publicarComentario(
            @PathVariable Long novelId,
            @PathVariable Integer chapterOrder,
            @RequestParam String texto,
            HttpSession session) {


        if (session.getAttribute("userId") == null) {

            return "redirect:/user/login";
        }
        Long userId = (Long) session.getAttribute("userId");
        ChapterCommentary comentario = new ChapterCommentary();
        Chapter chapter = chapterService.getChapterByNovelAndChapterOrder(novelId, chapterOrder);
        if (chapter != null) {
            User user = userService.getUserById(userId);
            comentario.setChapter(chapter);
            comentario.setComment(texto);
            comentario.setUser(user);

            chapterCommentaryService.guardarComentario(comentario);
        }

        return "redirect:/novel/{novelId}/chapter/{chapterOrder}";
    }

}