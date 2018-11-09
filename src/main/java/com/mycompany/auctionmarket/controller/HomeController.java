/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
    public boolean login=false;
    @RequestMapping(value = "/home")
    public String home(Model model){
        model.addAttribute("login", login);
        return "home";
    }
    @RequestMapping(value = "/user/home")
    public String userhome(Model model){
        login=true;
        model.addAttribute("login", login);
        return "home";
    }
    
}
