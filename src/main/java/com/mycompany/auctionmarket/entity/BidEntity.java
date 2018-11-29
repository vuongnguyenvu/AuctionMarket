/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "bid")
public class BidEntity implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "bid_id")    
private int bid_id;     

@Column
private int bid_amount;

@Column
private Timestamp bidTime;

//0:false
//1:true
@Column
private boolean win;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "auction_id")
private AuctionEntity auction;

@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "user_id")
private UserEntity user;

    public BidEntity() {
    }

    public int getBid_id() {
        return bid_id;
    }

    public void setBid_id(int bid_id) {
        this.bid_id = bid_id;
    }

    public int getBid_amount() {
        return bid_amount;
    }

    public void setBid_amount(int bid_amount) {
        this.bid_amount = bid_amount;
    }

    public boolean isWin() {
        return win;
    }

    public void setWin(boolean win) {
        this.win = win;
    }

    public AuctionEntity getAuction() {
        return auction;
    }

    public void setAuction(AuctionEntity auction) {
        this.auction = auction;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Timestamp getBidTime() {
        return bidTime;
    }

    public void setBidTime(Timestamp bidTime) {
        this.bidTime = bidTime;
    }

}
