/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.CategoryEntity;
import com.mycompany.auctionmarket.entity.ImageEntity;
import com.mycompany.auctionmarket.entity.ProductEntity;
import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.ProductService;
import com.mycompany.auctionmarket.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller

public class UserController {
@Autowired
private UserService userService;
@Autowired
private ProductService productService;
    
@Autowired
private AuctionService auctionService;

@Autowired
private ServletContext servletContext;
@RequestMapping(value = "/register",method = RequestMethod.POST)
public String register(UserEntity user, Model model){
//    PasswordUtil passwordUtil = new PasswordUtil();
//    user.setPassword(passwordUtil.encode(user.getPassword()));
    user.setAmount(0);
    user.setRole(userService.getRoleById(2));
    userService.addUser(user);
    return "redirect:/home";
}

@RequestMapping(value = "/user/accountDetail")
public String viewAccountDetail(Model model,Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    UserEntity user = userService.getUserByUsername(loggedUser);
    model.addAttribute("user", user);
    model.addAttribute("loggedUser", loggedUser);
    return "accountDetail";
}


}
