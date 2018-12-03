/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.TransactionEntity;
import com.mycompany.auctionmarket.repository.TransactionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TransactionService {
    @Autowired
    TransactionRepository transactionRepo;
    
    public TransactionEntity saveTransaction(TransactionEntity transaction){
        return transactionRepo.save(transaction);
    }
    public List<TransactionEntity> getListTransactionByUserId(int id){
        return transactionRepo.findByUserId(id);
    }
}
