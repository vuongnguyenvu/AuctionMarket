/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.repository.AuctionRepository;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
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
    public List<AuctionEntity> getListAuction(){
        return (List<AuctionEntity>) auctionRepo.findAllAuction();
    }
    public List<AuctionEntity> getAuctionByCategoryId(int categoryId){
        return auctionRepo.findByCategoryId(categoryId);
    }
    public int getBidStep(AuctionEntity auction){
        
        int bidStep=0;
        int minimumPrice = auction.getCurrentPrice();
        if (minimumPrice>100000000) {
            bidStep=5000000;
        }else if (minimumPrice>50000000) {
            bidStep=1000000;
        } else if (minimumPrice>10000000) {
            bidStep=500000;
        } else if (minimumPrice>5000000) {
            bidStep=100000;
        } else if (minimumPrice>1000000) {
            bidStep=50000;
        } else bidStep=10000;
        return bidStep;
    }
    public AuctionEntity getAuctionByBidId(int bidId){
        return auctionRepo.findByBidId(bidId);
    }
    public List<AuctionEntity> getAuctionByUserId(int userId){
        return auctionRepo.findByUserId(userId);
    }
    public boolean checkValidExpiredTime(AuctionEntity auction){
        Timestamp today = Timestamp.valueOf(LocalDateTime.now());
        Timestamp expiredTime=auction.getExpiredTime();
        if (expiredTime.before(today)) {
            return false;
        } else return true;
    }
    
}
