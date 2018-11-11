/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.ProductEntity;
import java.io.Serializable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer>{
    @Query("SELECT p FROM ProductEntity p JOIN p.auctions a WHERE a.actionId = : auctionId")
    public ProductEntity findByAuctionId(@Param("auctionId") int auctionId); 
}
