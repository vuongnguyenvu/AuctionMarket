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
    @Query(value = "SELECT * FROM product INNER JOIN auction ON product.product_id=auction.product_id WHERE auction_id=?1",nativeQuery = true)
    public ProductEntity findByAuctionId( int auctionId);
}
