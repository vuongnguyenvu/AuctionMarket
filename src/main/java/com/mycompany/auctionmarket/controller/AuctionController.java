/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.ProductEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author VUKE
 */
@Controller
public class AuctionController {
    @Autowired
    AuctionService auctionService;
    @Autowired
    ProductService productService;
    @RequestMapping(value = "/auctionDetail")
    public String auctionDetail(Model model, @RequestParam(value = "auctionId") int auctionId){
        AuctionEntity auction = auctionService.getAuctionDetail(auctionId);
        ProductEntity product = productService.getProductByAuctionId(auctionId);
        
        auction.setProduct(product);
        model.addAttribute("auction", auction);
        return "auctionDetail";
    }
}
