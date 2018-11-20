/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.repository.BidRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BidService {
    @Autowired
    private BidRepository bidRepo;
    public BidEntity saveBid(BidEntity bid){
        return bidRepo.save(bid);
    }
    public List<BidEntity> getListBidByAuctionId(int auctionId){
        return bidRepo.findByAuction_id(auctionId);
    }
}
