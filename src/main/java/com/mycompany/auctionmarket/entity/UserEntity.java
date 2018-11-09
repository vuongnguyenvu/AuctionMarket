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
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "user_id")
private int user_id;
@Column
private String username;
@Column
private String password;
@Column
private String email;
@Column
private String address;
@Column
private String phone;
@Column
private int amount;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "role_id")
private RoleEntity role;

@OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
private List<TransactionEntity> listTransaction;

@OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
private List<AuctionEntity> listAuction;

@OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
private List<BidEntity> listBid;
    public UserEntity() {
    }

    public List<BidEntity> getListBid() {
        return listBid;
    }

    public void setListBid(List<BidEntity> listBid) {
        this.listBid = listBid;
    }

    public List<AuctionEntity> getListAuction() {
        return listAuction;
    }

    public void setListAuction(List<AuctionEntity> listAuction) {
        this.listAuction = listAuction;
    }

    public List<TransactionEntity> getListTransaction() {
        return listTransaction;
    }

    public void setListTransaction(List<TransactionEntity> listTransaction) {
        this.listTransaction = listTransaction;
    }

    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public RoleEntity getRole() {
        return role;
    }

    public void setRole(RoleEntity role) {
        this.role = role;
    }


}
