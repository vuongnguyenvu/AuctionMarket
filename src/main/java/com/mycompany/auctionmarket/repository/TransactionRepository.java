/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.repository;

import com.mycompany.auctionmarket.entity.TransactionEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TransactionRepository extends CrudRepository<TransactionEntity, Integer>{
    @Query(value = "SELECT * FROM transaction WHERE transaction.user_id=?1 ORDER BY transaction.transaction_date DESC",nativeQuery = true)
    List<TransactionEntity> findByUserId(int id);
}
