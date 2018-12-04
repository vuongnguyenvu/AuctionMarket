package com.mycompany.auctionmarket.scheduling;

import com.mycompany.auctionmarket.config.MyConstants;
import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;


public class MyBean {
@Autowired
public AuctionService auctionService;
@Autowired
public BidService bidService;
@Autowired
public JavaMailSender emailSender;
	@Scheduled(fixedRate=2000)
	public void timerLoop() {
//		System.out.println("I am called by Spring scheduler");
                List<AuctionEntity> listAuction = auctionService.getListAuction();
                Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
                for (AuctionEntity auction : listAuction) {
                    if (auction.getExpiredTime().before(currentTime)) {
                        if (!auctionService.checkClosedAuction(auction)||auction.getCurrentPrice()==auction.getMinimum_price()) {
                        auction.setStatus(false);
                        auctionService.saveAuction(auction);
                        List<BidEntity> listBid = bidService.getListBidByAuctionId(auction.getAuction_id());
                            for (BidEntity bid : listBid) {
                                if (auction.getCurrentPrice()==bid.getBid_amount()) {
                                    bid.setWin(true);
                                    bidService.saveBid(bid);
                                    //check out
                                    bidService.payMoneyforBid(bid);
                                    auctionService.receiveMoney(auction.getUser(), bid);
                                    
//                                    
//                                        // Create a Simple MailMessage.
//                                    SimpleMailMessage message = new SimpleMailMessage();
//
//                                    message.setTo(bid.getUser().getEmail());
//                                    message.setSubject("Auction Winner");
//                                    message.setText("Hello, Congratulation! You've just become the winner of the Auction: "+auction.getProduct().getProduct_name()+"/n"
//                                    +"Please coming to my office for receiving your product.");
//                                    
//                                    // Send Message!
//                                    emailSender.send(message);
//                                        
                                    
                                    
                                } else bidService.deleteBid(bid);  //deleteLosedBid
                            }
                        }
                    }
                }
	}
        
}
