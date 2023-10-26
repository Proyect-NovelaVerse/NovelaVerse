package com.grupo5.novelaverse.controllers;

import java.util.List;
import java.util.Set;

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
import org.springframework.web.multipart.MultipartFile;

import com.grupo5.novelaverse.models.Novel;
import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.services.NovelService;
import com.grupo5.novelaverse.services.UserService;
import com.grupo5.novelaverse.util.File;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
@RequestMapping("/novel")
public class NovelController {

    @Autowired private NovelService novelService;
    @Autowired private UserService userService;
   


    @GetMapping("/add")
    public String addNovelView(@ModelAttribute("novel") Novel novela, HttpSession session) {
        if (session.getAttribute("userId") == null){
            return "redirect:/";   
        }
        return "novel_add";
    }

    @PostMapping("/add")
    public String addNovel(
        @Valid @ModelAttribute("novel") Novel novel,
        BindingResult result,
        @RequestParam(name = "img", required = false) MultipartFile img,
        Model model,
        HttpSession session) {
            
            File file = new File();
            String saveDirectory = "src//main//resources//static//img//novel_frontpages//";
            String prefixFileName = "imgnovel";

            Novel novelVerification = novelService.findByTitle(novel.getTitle());

            if (novelVerification != null) {
                model.addAttribute("novelError", "El nombre de la novela ya existe");
            }
            
            if (img == null || img.isEmpty()) {
                model.addAttribute("imgError", "Seleccione un archivo de imagen");
            }

            if (model.containsAttribute("novelError") || model.containsAttribute("imgError")) {
                return "novel_add";
            }

            if (result.hasErrors()) {
                return "novel_add";
            }
            
            Novel newNovel = novelService.save(novel);
            String fileUploadResult = file.uploadFile(img, saveDirectory, prefixFileName, newNovel.getId());
            newNovel.setFrontpage(fileUploadResult);
            novelService.save(newNovel);
            Long novelId = newNovel.getId();

        return "redirect:/novel/" + novelId + "/chapter/new";
    }   


    
    @GetMapping("/{novelId}")
    public String novel( Model model, HttpSession session, @PathVariable(value = "novelId") Long novelId ){
        Novel novel = novelService.findById(novelId);
        model.addAttribute("novel",novel);
        return "novel_info";
    }

    @GetMapping("/{id}/add/biblioteca")
    public String addBiblioteca(@PathVariable("id")Long novelId, HttpSession session){
        Long userId = (Long) session.getAttribute("userId");

        Novel novel = novelService.findById(novelId);
        User user = userService.findById(userId);

        Set<User> users = novel.getBiblioUser();
        users.add(user);
        novel.setBiblioUser(users);
        novelService.save(novel);
        return "redirect:/novel/" + novelId;
    }
    
    
    @GetMapping("/delete/{id}")
    public String deleteNovel(@PathVariable("id")Long novelId){
        
        novelService.delete(novelId);
        return "redirect:/home"; 
    }
}
