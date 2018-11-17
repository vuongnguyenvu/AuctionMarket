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
import com.mycompany.auctionmarket.service.PasswordUtil;
import com.mycompany.auctionmarket.service.ProductService;
import com.mycompany.auctionmarket.service.UserService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


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
public String creatAuction(Model model,Principal principal,AuctionEntity auction, @RequestParam("file") MultipartFile file) throws FileNotFoundException, IOException{
    String loggedUser;
        if (principal!=null) {
            loggedUser = principal.getName();
        }
        else 
        loggedUser = "nologin"; 
    UserEntity user = userService.getUserByUsername(loggedUser) ;
    auction.setUser(user);
    ProductEntity product = auction.getProduct();
    CategoryEntity category = productService.getCategoryById(auction.getProduct().getCategory().getCategory_id());
    product.setCategory(category);
    ProductEntity savedProduct = productService.saveProduct(product);
    auction.setProduct(savedProduct);
    AuctionEntity savedAuction = auctionService.saveAuction(auction);
    String contextPath=servletContext.getContextPath().toString();
//    String pathFolder = contextPath+"/images/product-details";
//    String pathFolder = servletContext.getRealPath("/images/product-details/");
    String pathFolder = "E:/0.JAVA/final project/AuctionMarket/src/main/webapp/images/product-details/";
    
//    String pathFolder = "E:/uploaded";
    File dir = new File(pathFolder);
    if(!dir.exists()) {
        dir.mkdir();
    }
    
//    MultipartFile file = savedAuction.getFile();
    byte[] bytes = file.getBytes();
    String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
    
    File serverFile = new File(fileSource);
    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
    stream.write(bytes);
    stream.close();
//    String filePath = serverFile.getPath();
//    filePath = serverFile.getPath();
    String filePath = "images/product-details/"+serverFile.getName();
    ImageEntity image = new ImageEntity();
    image.setPath(filePath);
    image.setProduct(savedProduct);
    productService.saveImage(image);
    model.addAttribute("loggedUser", loggedUser); 
    model.addAttribute("auction", auction);
    return "redirect:/home";
}
}
