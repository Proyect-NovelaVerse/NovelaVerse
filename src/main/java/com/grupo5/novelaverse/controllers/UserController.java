package com.grupo5.novelaverse.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo5.novelaverse.models.User;
import com.grupo5.novelaverse.services.UserService;
import com.grupo5.novelaverse.validators.UserValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
@RequestMapping("/user")
public class UserController{

    @Autowired
    private UserService userService;
    @Autowired
    private UserValidator userValidator;
    
    @GetMapping("/register")
    public String register(@ModelAttribute("user")User user){
        // return "login";
        return "user_register";
    }

    @PostMapping("/register")
    public String newRegister(
        @Valid @ModelAttribute("user")User user, BindingResult result, HttpSession session,Model model) {
            
        userValidator.validate(user, result);   
        
        User uniqueEmail = userService.findByEmail(user.getEmail());
        if (uniqueEmail != null) {
            ObjectError error = new ObjectError("email", "Email ya se encuentra en uso");
            result.addError(error);     
        }       

        if (result.hasErrors()) {
            // return "login";
            return "user_register";
        } else {
            User newUser = userService.registerUser(user);
            session.setAttribute("userId", newUser.getId());
            return "redirect:/user/perfil";
        }
 

            
    }

    @GetMapping("/login")
    public String login(@ModelAttribute("user")User us) {
        return "inicio_session";
    }

    @PostMapping("/login")
    public String login(
     @RequestParam("email")String email, @RequestParam("password")String password,
        Model model, HttpSession session,@ModelAttribute("user") User user
        ){
        
           if (!userService.authenticateUser(email, password)) {
                model.addAttribute("error", "Datos Incorrectos ó invalidos");
                return "inicio_session";
            } else {
                User authUser = userService.findByEmail(email);
                session.setAttribute("userId", authUser.getId());
                return "redirect:/";
            }
    }

    @GetMapping("/perfil")
    public String perfil(Model model,HttpSession session,User user){
        Long id = (Long) session.getAttribute("userId");
        user = userService.findById(id); 
        model.addAttribute("user", user);

        return "user_perfil";
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable("id")Long userId,Model model){
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        return "update";
    }

    @PostMapping("/{id}/edit")
    public String update(@Valid @ModelAttribute("user")User user, BindingResult result){

        if (result.hasErrors()) {
            return "update";
        } else {
            userService.registerUser(user);
            return "redirect:/user/perfil#info";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    
}

