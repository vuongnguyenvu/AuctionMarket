/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author designreel2
 */
@Service
public class PasswordEncoderService {
    public String encoderPassword(String password){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword="";
        int i = 0;
		while (i < 10) {
			hashedPassword = passwordEncoder.encode(password);
			i++;
		}
        return hashedPassword;
    }
}
