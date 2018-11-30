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
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
import com.mycompany.auctionmarket.service.ProductService;
import com.mycompany.auctionmarket.service.UserService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author designreel2
 */
@Controller
public class AuctionController {
@Autowired
private UserService userService;
@Autowired
private ProductService productService;
    
@Autowired
private AuctionService auctionService;

@Autowired
private ServletContext servletContext;

@Autowired
private BidService bidService;
@RequestMapping(value = "/user/creatAuction")
public String gotoAuctionForm(Model model,Principal principal){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    model.addAttribute("loggedUser", loggedUser);   
    List<CategoryEntity> listCategory = productService.getListCategory();
    model.addAttribute("listCategory", listCategory);
    AuctionEntity auction = new AuctionEntity();
    model.addAttribute("auction", auction);
    return "creatAuction";
}
@RequestMapping(value = "/user/creatAuction",method = RequestMethod.POST)
public String creatAuction(Model model,Principal principal,AuctionEntity auction, @RequestParam("file") MultipartFile file,
                            @RequestParam(value = "days")int days,
                            @RequestParam(value = "hours")int hours,
                            @RequestParam(value = "minutes")int minutes) throws FileNotFoundException, IOException{
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    UserEntity user = userService.getUserByUsername(loggedUser) ;
    auction.setUser(user);
    int currentPrice = auction.getMinimum_price();
    auction.setCurrentPrice(currentPrice);
//    if (auctionService.checkValidExpiredTime(auction)) {
//        auction.setStatus(true);
//    }
//    Timestamp today = Timestamp.valueOf(LocalDateTime.now());
    LocalDateTime today = LocalDateTime.now();
    Timestamp expiredTime = Timestamp.valueOf(today.plusMinutes(days*1440+hours*60+minutes));
    auction.setBegin_time(Timestamp.valueOf(today));
    auction.setExpiredTime(expiredTime);
    auction.setStatus(true);
    ProductEntity product = auction.getProduct();
    CategoryEntity category = productService.getCategoryById(auction.getProduct().getCategory().getCategory_id());
    product.setCategory(category);
    ProductEntity savedProduct = productService.saveProduct(product);
    auction.setProduct(savedProduct);
    AuctionEntity savedAuction = auctionService.saveAuction(auction);
    String contextPath=servletContext.getContextPath().toString();

//    String pathFolder = "E:/0.JAVA/final project/AuctionMarket/src/main/webapp/images/product-details/";
    String pathFolder = "D:/1.Vu-V6297/JAVA/0.final project/AuctionMarket/src/main/webapp/images/product-details/";
    File dir = new File(pathFolder);
    if(!dir.exists()) {
        dir.mkdir();
    }
    
    byte[] bytes = file.getBytes();
    String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
    
    File serverFile = new File(fileSource);
    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
    stream.write(bytes);
    stream.close();
    String filePath = "images/product-details/"+serverFile.getName();
    ImageEntity image = new ImageEntity();
    image.setPath(filePath);
    image.setProduct(savedProduct);
    productService.saveImage(image);
    return "redirect:/home";
}
@RequestMapping(value = "user/auctionDetail")
public String viewAuctionDetail(@RequestParam(value = "auctionId") int auctionId,
                                @RequestParam(value = "message") String message,
                                Principal principal, Model model){
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    model.addAttribute("loggedUser", loggedUser);  
    List<CategoryEntity> listCategory = productService.getListCategory();
    model.addAttribute("listCategory", listCategory);
    AuctionEntity auction = auctionService.getAuctionDetail(auctionId);
    List<BidEntity> listBid = bidService.getListBidByAuctionId(auctionId);
    auction.setListBid(listBid);
    model.addAttribute("auction", auction);
    model.addAttribute("message", message);
    int bidStep=auctionService.getBidStep(auction);
    int minimumBid = auction.getCurrentPrice()+bidStep;
    model.addAttribute("minimumBid", minimumBid);
    model.addAttribute("bidStep", bidStep);
    return "auctionDetail";
}
    
}
