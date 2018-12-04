/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.entity.CategoryEntity;
import com.mycompany.auctionmarket.entity.ImageEntity;
import com.mycompany.auctionmarket.entity.ProductEntity;
import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
import com.mycompany.auctionmarket.service.ProductService;
import com.mycompany.auctionmarket.service.TransactionService;
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

@Autowired
private TransactionService transactionService;
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
    List<TransactionEntity> listTransaction = transactionService.getListTransactionByUserId(user.getUser_id());
    user.setListTransaction(listTransaction);
    model.addAttribute("user", user);
    model.addAttribute("loggedUser", loggedUser);
    return "accountDetail";
}
@RequestMapping(value = "/user/myBid")
public String viewMyBid(Model model,Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    model.addAttribute("loggedUser", loggedUser);
    UserEntity user = userService.getUserByUsername(loggedUser);
    List<BidEntity> listBid=userService.getListBidByUserId(user.getUser_id());
    if (listBid!=null&&!listBid.isEmpty()) {
        for (BidEntity bid : listBid) {
        bid.setAuction(auctionService.getAuctionByBidId(bid.getBid_id()));
        }
    }
    
    model.addAttribute("listBid", listBid);
    return "myBid";
}
@RequestMapping(value = "/user/myAuction")
public String viewMyAuction(Model model,Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    model.addAttribute("loggedUser", loggedUser);
    UserEntity user = userService.getUserByUsername(loggedUser);
    List<AuctionEntity> listAuction = auctionService.getAuctionByUserId(user.getUser_id());
    model.addAttribute("listAuction", listAuction);
    return "myAuction";
}


}
