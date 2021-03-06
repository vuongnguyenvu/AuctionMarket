/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
import com.mycompany.auctionmarket.service.UserService;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class BidController {
@Autowired
UserService userService;
@Autowired
AuctionService auctionService;
@Autowired
BidService bidService;

    @RequestMapping(value = "/user/bid")
    public String makeBid(@RequestParam(value = "auctionId") int auctionId,
                          @RequestParam(value = "biderName") String biderName,
                          @RequestParam(value = "bidAmount") int bidAmount,
                          RedirectAttributes rm,
                          Model model){
        String message="";
        UserEntity user = userService.getUserByUsername(biderName);
        AuctionEntity auction = auctionService.getAuctionDetail(auctionId);
        BidEntity bid = new BidEntity();
        bid.setUser(user);
        bid.setBid_amount(bidAmount);
        if (bidService.checkValidBid(bid, user.getUser_id())) {
            auction.setCurrentPrice(bidAmount);
            AuctionEntity savedAuction = auctionService.saveAuction(auction);
            bid.setAuction(savedAuction);
            Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
            bid.setBidTime(currentTime);
            bid.setWin(false);
            
            BidEntity savedBid = bidService.saveBid(bid);
        } else message = "Not enough money for bid, please topping up!";
        
        rm.addAttribute("message", message);
        rm.addAttribute("auctionId", auctionId);
        return "redirect:/user/auctionDetail";
    }
}
