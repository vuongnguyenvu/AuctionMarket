package com.mycompany.auctionmarket.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PasswordUtil {
    public static String hashPassword(String password){
        StringBuffer sb=null;
        try {
            MessageDigest md= MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] mdArr = md.digest();
            sb=new StringBuffer(mdArr.length*2);
            for (byte b : mdArr) {
                int v=b&0xff;
                if (v<16) {
                    sb.append('0');
                }
                sb.append(Integer.toHexString(v));
            }
                    } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb.toString();
    }
    
}
