/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author designreel2
 */
@Controller
public class AuctionController {
@Autowired
AuctionService auctionService;
@RequestMapping(value = "/auctionDetail")
public String viewAuctionDetail(@RequestParam(value = "auctionId") int auctionId,Principal principal, Model model){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    model.addAttribute("loggedUser", loggedUser);  
    
    AuctionEntity auction = auctionService.getAuctionDetail(auctionId);
    model.addAttribute("auction", auction);
    return "auctionDetail";
}
    
}
