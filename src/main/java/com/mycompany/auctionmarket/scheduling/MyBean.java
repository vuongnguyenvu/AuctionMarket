package com.mycompany.auctionmarket.scheduling;

import com.mycompany.auctionmarket.entity.AuctionEntity;
import com.mycompany.auctionmarket.entity.BidEntity;
import com.mycompany.auctionmarket.service.AuctionService;
import com.mycompany.auctionmarket.service.BidService;
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
                List<AuctionEntity> listAuction = auctionService.getAllExpiredAuction();
                for (AuctionEntity auction : listAuction) {
                    if (!auctionService.checkClosedAuction(auction)) {
                        List<BidEntity> listBid = bidService.getListBidByAuctionId(auction.getAuction_id());
                        for (BidEntity bid : listBid) {
                            if (auction.getCurrentPrice()==bid.getBid_amount()) {
                                bid.setWin(true);
                                bidService.saveBid(bid);
                            }
                        }
                        //deleteLosedBid
                    }
            }
                
	}
}
