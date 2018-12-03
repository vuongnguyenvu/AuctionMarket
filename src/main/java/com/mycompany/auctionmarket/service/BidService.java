/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.repository.BidRepository;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BidService {
    @Autowired
    private BidRepository bidRepo;
    @Autowired
    private UserService userService;
    @Autowired
    private TransactionService transactionService;
    public BidEntity saveBid(BidEntity bid){
        return bidRepo.save(bid);
    }
    public void deleteBid(BidEntity bid){
        bidRepo.delete(bid.getBid_id());
    }
    public List<BidEntity> getListBidByAuctionId(int auctionId){
        return bidRepo.findByAuction_id(auctionId);
    }
    public boolean checkValidBid(BidEntity bid, int userId){
        UserEntity user = userService.getUserByUserId(userId);
        int sumOfBidAmount = userService.sumBidAmountOfUser(userId);
        if ((bid.getBid_amount()+sumOfBidAmount)<user.getAmount() ) {
            return true;
        } else
        return false;
    }
    public void payMoneyforBid(BidEntity bid){
        UserEntity user = bid.getUser();
        int newAmount = user.getAmount()+bid.getBid_amount();
        user.setAmount(newAmount);
        UserEntity savedUser = userService.addUser(user);
        TransactionEntity transaction = new TransactionEntity();
        transaction.setUser(savedUser);
        transaction.setTransaction_amount(bid.getBid_amount());
        transaction.setTransaction_type(false);
        Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
        transaction.setTransaction_date(currentTime);
        transactionService.saveTransaction(transaction);
    }
}
