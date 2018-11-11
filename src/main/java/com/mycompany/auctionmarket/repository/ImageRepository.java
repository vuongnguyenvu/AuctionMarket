/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.ImageEntity;
import java.io.Serializable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer>{
    @Query("SELECT p FROM ImageEntity p JOIN p.product a WHERE a.productId = : productId")
    public ImageEntity findByProductId(@Param("productId") int producId)
}
