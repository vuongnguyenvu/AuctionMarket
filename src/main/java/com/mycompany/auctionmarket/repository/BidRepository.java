/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.BidEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface BidRepository extends CrudRepository<BidEntity, Integer>{
    @Query(value = "SELECT * FROM bid ORDER BY bid_id DESC WHERE auction_id=?1",nativeQuery = true)
    List<BidEntity> findByAuction_id(int auction_id);
}