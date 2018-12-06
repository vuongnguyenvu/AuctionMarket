/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.repository.BidRepository;
import com.mycompany.auctionmarket.repository.RoleRepository;
import com.mycompany.auctionmarket.repository.UserRepository;
import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserService implements Serializable{
//    @Autowired
//    @Qualifier("bcryptEncoder")        
//    PasswordEncoder bcryptEncoder;
    
    @Autowired
    public UserRepository userRepo;
    @Autowired
    public RoleRepository roleRepo;
    @Autowired
    public BidRepository bidRepo;
    @Autowired
    public TransactionService transactionService;
    public UserEntity addUser(UserEntity user){
//        String hashPassword = bcryptEncoder.encode(user.getPassword());
//        user.setPassword(hashPassword);
        return userRepo.save(user);
    }
    public RoleEntity getRoleById(int id){
        return roleRepo.findOne(id);
    }
    public List<UserEntity> getListUser(){
        return (List<UserEntity>) userRepo.findAll();
    }
    public void deleteUserByID(int id){
        userRepo.delete(id);
    }
    public UserEntity topUpAmount(int id,int amount){
        UserEntity user = userRepo.findOne(id);
        int newAmount=amount+user.getAmount();
        user.setAmount(newAmount);
        TransactionEntity transaction = new TransactionEntity();
        transaction.setUser(user);
        transaction.setTransaction_amount(amount);
        transaction.setTransaction_type(true);
        Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
        transaction.setTransaction_date(currentTime);
        transactionService.saveTransaction(transaction);
        
        return userRepo.save(user);
    }
    public UserEntity getUserByUsername(String username){
        List<UserEntity> users = userRepo.findByUsername(username);
        if(users != null) {
            return users.get(0);
        }
        return null;
    }
    public UserEntity getUserByUserId(int userId){
        return userRepo.findOne(userId);
    }
    public List<BidEntity> getListBidByUserId(int userId){
        return bidRepo.findByUser_id(userId);
    }
    public int sumBidAmountOfUser(int userId){
        List<BidEntity> listBid = getListBidByUserId(userId);
        int sum=0;
        for (BidEntity b : listBid) {
            sum=sum+b.getBid_amount();
        }
        return sum;
    }
}
