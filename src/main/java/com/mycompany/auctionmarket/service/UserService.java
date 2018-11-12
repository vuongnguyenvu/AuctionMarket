/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.repository.RoleRepository;
import com.mycompany.auctionmarket.repository.UserRepository;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements Serializable{
    @Autowired
    public UserRepository userRepo;
    @Autowired
    public RoleRepository roleRepo;
    public UserEntity addUser(UserEntity user){
        return userRepo.save(user);
    }
    public RoleEntity getRoleById(int id){
        return roleRepo.findOne(id);
    }
    public UserEntity findUserByUsername(String username){
        return userRepo.findByUsername(username);
    }
    public List<UserEntity> getListUser(){
        return (List<UserEntity>) userRepo.findAll();
    }
    public void deleteUserByID(int id){
        userRepo.delete(id);
    }
    public UserEntity topUpAmount(int id,int amount){
        UserEntity user = userRepo.findOne(id);
        amount=amount+user.getAmount();
        user.setAmount(amount);
        return userRepo.save(user);
    }
}
