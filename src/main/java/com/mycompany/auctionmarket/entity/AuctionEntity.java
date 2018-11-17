/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.entity;

import java.io.File;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "auction")
public class AuctionEntity implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "auction_id")    
private int auction_id;  

@Column
private int minimum_price;

@Column
private Timestamp begin_time;

@Column
private int duration;

//0:unactive
//1:active
@Column
private boolean status;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "user_id")
private UserEntity user;

@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "product_id")
private ProductEntity product;

@OneToMany(mappedBy = "auction")    
private List<BidEntity> listBid;

    public AuctionEntity() {
    }


    public int getAuction_id() {
        return auction_id;
    }

    public void setAuction_id(int auction_id) {
        this.auction_id = auction_id;
    }

    public int getMinimum_price() {
        return minimum_price;
    }

    public void setMinimum_price(int minimum_price) {
        this.minimum_price = minimum_price;
    }

    public Timestamp getBegin_time() {
        return begin_time;
    }

    public void setBegin_time(Timestamp begin_time) {
        this.begin_time = begin_time;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public List<BidEntity> getListBid() {
        return listBid;
    }

    public void setListBid(List<BidEntity> listBid) {
        this.listBid = listBid;
    }


}
