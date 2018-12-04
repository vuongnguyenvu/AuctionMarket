/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.repository.AuctionRepository;
import com.mycompany.auctionmarket.repository.BidRepository;
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
    
    @Autowired
    BidService bidService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    TransactionService transactionService;
    
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
    public List<AuctionEntity> getHighestCurrentPriceAuction(){
        return auctionRepo.findHighestCurrentPriceAuction();
    }
    public AuctionEntity getLatestAuction(){
        return auctionRepo.findlatestAuction();
    }
    public List<AuctionEntity> getListAvailableAuction(){
        return auctionRepo.findAvailableAuction();
    }
    public boolean checkValidExpiredTime(AuctionEntity auction){
        Timestamp today = Timestamp.valueOf(LocalDateTime.now());
        Timestamp expiredTime=auction.getExpiredTime();
        if (expiredTime.before(today)) {
            return false;
        } else return true;
    }
    public boolean checkClosedAuction(AuctionEntity auction){
        List<BidEntity> listBid = bidService.getListBidByAuctionId(auction.getAuction_id());
        if (listBid!=null&&!listBid.isEmpty()) {
            for (BidEntity bid : listBid) {
                if (bid.isWin()) {
                    return true;
                }
            }
            return false;
        } else return true;
    }
    public void receiveMoney(UserEntity user,BidEntity bid){
        int newUserAmount= user.getAmount()+(int)(bid.getBid_amount()*0.95); //receiving 95% of auction price
        user.setAmount(newUserAmount);
        UserEntity savedUser = userService.addUser(user);
        //save to transaction Repository
        TransactionEntity userTransaction = new TransactionEntity();
        userTransaction.setUser(savedUser);
        userTransaction.setTransaction_amount((int)(bid.getBid_amount()*0.95));
        userTransaction.setTransaction_type(true);
        Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
        userTransaction.setTransaction_date(currentTime);
        transactionService.saveTransaction(userTransaction);
        
        UserEntity adminUser = userService.getUserByUserId(6);
        int newAdminAmount=adminUser.getAmount()+(int)(bid.getBid_amount()*0.05); //pay 5% of auction price for web service
        adminUser.setAmount(newAdminAmount);
        UserEntity savedAdminUser = userService.addUser(adminUser);
        //save to transaction Repository
        TransactionEntity adminTransaction = new TransactionEntity();
        adminTransaction.setUser(savedAdminUser);
        adminTransaction.setTransaction_amount((int)(bid.getBid_amount()*0.05));
        adminTransaction.setTransaction_type(true);
        adminTransaction.setTransaction_date(currentTime);
        transactionService.saveTransaction(adminTransaction);
    }
    
}
