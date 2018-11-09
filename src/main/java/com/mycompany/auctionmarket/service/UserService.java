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
}
