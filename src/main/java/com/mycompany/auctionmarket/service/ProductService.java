/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.CategoryEntity;
import com.mycompany.auctionmarket.entity.ImageEntity;
import com.mycompany.auctionmarket.entity.ProductEntity;
import com.mycompany.auctionmarket.repository.CategoryRepository;
import com.mycompany.auctionmarket.repository.ImageRepository;
import com.mycompany.auctionmarket.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepo;
    @Autowired
    ImageRepository imageRepo;
    @Autowired
    CategoryRepository categoryRepo;
    public ProductEntity saveProduct(ProductEntity product){
       return productRepo.save(product);
    }
    public ImageEntity saveImage(ImageEntity image){
        return imageRepo.save(image);
    }
//    public ProductEntity getProductByAuctionId(int id){
//        
//        return productRepo.findByAuctionId(id);
//    }
    public List<CategoryEntity> getListCategory(){
        return (List<CategoryEntity>) categoryRepo.findAll();
    }
    public CategoryEntity getCategoryById(int id){
        return categoryRepo.findOne(id);
    }
    public ProductEntity getProductByAuctionId(int auctionId){
        return productRepo.findByAuctionId(auctionId);
    }
    
}
