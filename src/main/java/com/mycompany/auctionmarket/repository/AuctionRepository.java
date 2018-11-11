/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author VUKE
 */
@Repository
public interface AuctionRepository extends CrudRepository<AuctionEntity, Integer>{
    
}
