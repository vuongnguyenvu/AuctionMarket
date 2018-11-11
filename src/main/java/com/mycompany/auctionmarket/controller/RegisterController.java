/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller

public class RegisterController {
@Autowired
private UserService userService;
    
@RequestMapping(value = "/register") 
public String register(Model model){
    UserEntity user = new UserEntity();
    model.addAttribute("user", user);
    return "registerForm";
}
@RequestMapping(value = "/register",method = RequestMethod.POST)
public String register(UserEntity user, Model model){
    user.setAmount(0);
    user.setRole(userService.getRoleById(2));
    userService.addUser(user);
    return "redirect:/home";
}
}
