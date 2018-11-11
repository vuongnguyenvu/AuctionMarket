/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.UserEntity;
import java.security.Principal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {
//    public String login="";
    @RequestMapping(value = "/home")
    public String home(Model model, Principal principal){
        String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
        model.addAttribute("loggedUser", loggedUser);
        return "home";
    }
    @RequestMapping(value = "/login")
    public String login(Model model, Principal principal){
        String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
        model.addAttribute("loggedUser", loggedUser);
        UserEntity user = new UserEntity();
        model.addAttribute("user", user);
        return "login";
    }
    @RequestMapping(value = "/user/home")
    public String userhome(Model model){
        return "redirect:/home";
    }
    @RequestMapping(value = "/logout")
    public String logout(Model model){
        return "redirect:/home";
        
    }
    
}
