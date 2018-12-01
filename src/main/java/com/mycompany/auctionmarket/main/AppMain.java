package com.mycompany.auctionmarket.main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.mycompany.auctionmarket.config.AppConfig;
import org.springframework.beans.factory.annotation.Autowired;


public class AppMain {
	
	@SuppressWarnings({ "unused", "resource" })
	public static void main(String args[]){
		AbstractApplicationContext  context = new AnnotationConfigApplicationContext(AppConfig.class);
	}

}
