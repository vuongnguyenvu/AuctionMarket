/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.TransactionService;
import com.mycompany.auctionmarket.service.UserService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private AuctionService auctionService;
    @Autowired
    private TransactionService transactionService;
@RequestMapping(value = "/admin/customerManagement")
public String customerManagement(Model model, Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
        model.addAttribute("loggedUser", loggedUser);
    List<UserEntity> listUser = userService.getListUser();
    model.addAttribute("listUser", listUser);
    return "customerManagement";
}
//@RequestMapping(value = "/admin/delete")
//public String deleteUser(@RequestParam(value = "userId") int userId){
//    userService.deleteUserByID(userId);
//    return "redirect:/admin/customerManagement";
//}
@RequestMapping(value = "/admin/topup")
public String topUpMoney(@RequestParam(value = "userId") int userId,
                            @RequestParam(value = "top_up_amount") int top_up_amount){
    userService.topUpAmount(userId, top_up_amount);
    return "redirect:/admin/customerManagement";
}
@RequestMapping(value = "/admin/viewAccountDetail")
public String viewAccountDetail(@RequestParam(value = "userId") int userId, Model model,Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
        model.addAttribute("loggedUser", loggedUser);
    UserEntity user = userService.getUserByUserId(userId);
    List<TransactionEntity> listTransaction = transactionService.getListTransactionByUserId(user.getUser_id());
    user.setListTransaction(listTransaction);
    model.addAttribute("user", user);
    return "accountDetail";
}
@RequestMapping(value = "admin/auctionManagement")
public String auctionManagement(Model model, Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
        model.addAttribute("loggedUser", loggedUser);
    List<AuctionEntity> listAuction = auctionService.getListAuction();
    model.addAttribute("listAuction", listAuction);
    return "auctionManagement";
    
}
}
