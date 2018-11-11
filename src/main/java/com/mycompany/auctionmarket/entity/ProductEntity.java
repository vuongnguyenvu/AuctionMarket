/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.entity;

import java.io.Serializable;
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
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "product_id")    
private int product_id;     

@Column
private String product_name;

@Column
private String description;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "category_id")
private CategoryEntity category;

@OneToMany(cascade = CascadeType.ALL,mappedBy = "product")
private List<ImageEntity> listImage;

@OneToMany(cascade = CascadeType.ALL,mappedBy = "product")
private List<AuctionEntity> auctions;


    public ProductEntity() {
    }

    public List<AuctionEntity> getAuctions() {
        return auctions;
    }

    public void setAuctions(List<AuctionEntity> auctions) {
        this.auctions = auctions;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public List<ImageEntity> getListImage() {
        return listImage;
    }

    public void setListImage(List<ImageEntity> listImage) {
        this.listImage = listImage;
    }



}
