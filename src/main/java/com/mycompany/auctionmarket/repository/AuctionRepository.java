/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author VUKE
 */
@Repository
public interface AuctionRepository extends CrudRepository<AuctionEntity, Integer>{
    @Query(value = "SELECT * FROM auction INNER JOIN product ON auction.product_id=product.product_id WHERE category_id=?1",nativeQuery = true)
    List<AuctionEntity> findByCategoryId(int category_id);
    
    @Query(value = "SELECT * FROM bid INNER JOIN auction ON bid.auction_id=auction.auction_id WHERE bid_id=?1",nativeQuery = true)
    AuctionEntity findByBidId(int bidId);
    
    @Query(value = "SELECT * FROM auction INNER JOIN user ON auction.user_id=user.user_id WHERE user.user_id=?1",nativeQuery = true)
    List<AuctionEntity> findByUserId(int userId);
}
