package com.mycompany.auctionmarket.scheduling;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;


public class MyBean {
@Autowired
private AuctionService auctionService;
@Autowired
private BidService bidService;
	@Scheduled(fixedRate=5000)
	public void printMessage() {
		System.out.println("I am called by Spring scheduler");
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
                                } else bidService.deleteBid(bid);  //deleteLosedBid
                            }
                        }
                    }
                    
                    
                    
                    
                }
                
	}
}
