/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.repository.AuctionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 *
 * @author VUKE
 */
@Service
public class AuctionService {
    @Autowired
    AuctionRepository auctionRepo;
    public AuctionEntity saveAuction(AuctionEntity auction){
        AuctionEntity auctionEntity = auctionRepo.save(auction);
        System.out.println(auctionEntity);
        return auctionEntity;
    }
    public AuctionEntity getAuctionDetail(int id){
        return auctionRepo.findOne(id);
    }
}
