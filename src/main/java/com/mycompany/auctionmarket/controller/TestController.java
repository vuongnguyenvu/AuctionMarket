/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author VUKE
 */
@Controller
public class TestController {
    @RequestMapping(value = "user/test")
    public String test(){
        return "test";
    }
    @RequestMapping(value = "test")
    public String test1(){
        return "test_1";
    }
}
