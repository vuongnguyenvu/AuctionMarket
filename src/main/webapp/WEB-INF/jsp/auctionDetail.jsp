<%-- 
    Document   : product-details
    Created on : Nov 9, 2018, 7:46:02 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Product Details | A-uction</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/price-range.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/animate.css" rel="stylesheet">
	<link href="${pageContext.request.getContextPath()}/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.getContextPath()}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${pageContext.request.getContextPath()}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-57-precomposed.png">
    <script src="${pageContext.request.getContextPath()}/js/jquery.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/price-range.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/main.js"></script>
    <style>
            .vnd:after { content:' VND'; }
            #dongho{
                margin: 30px;
                font-size: smaller;
                font-weight: bold;
                color: red;
            }
        </style>
</head><!--/head-->

<body>
	<header id="header">
            <jsp:include page="Include/header.jsp" />
        </header>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<c:forEach items="${listCategory}" var="c">
                                                        <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="${pageContext.request.getContextPath()}/searchByCategory?categoryId=${c.category_id}">${c.category_name}</a></h4>
								</div>
							</div>        
                                                        </c:forEach> 
						</div><!--/category-products-->
					
						
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
                                                            <c:forEach items="${auction.product.listImage}" var="i">
                                                                <img width="250px" height="300px" src="${pageContext.request.getContextPath()}/${i.path}" alt="${auction.product.product_name}" />
                                                            </c:forEach>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<h2>${auction.product.product_name}</h2>
                                                                <p>${auction.product.description}</p>
								<p>Web ID: ${auction.auction_id}</p>
                                                                <p><b>Submit by:</b> ${auction.user.username}</p>
                                                                <p style="display:none;" id="hiden-${auction.auction_id}">${auction.expiredTime}</p>
                                                                <div id="countdown">
                                                                    <span style="color: #000066; text-align: center;
                                                                          margin-bottom: 1px;font-family: 'Roboto', sans-serif;
                                                                          font-size: 25px;font-weight:700"
                                                                                          id="display-countdown"></span></div>        
                                                                
								<span>
                                                                    <span>Current Price:</span> <span class="vnd" id="defaultNumber">${auction.currentPrice}</span>
                                                                        
                                                                        
                                                                        <form action="bid" method="get">
                                                                            <input type="hidden" name="auctionId" value="${auction.auction_id}"/>
                                                                            <input type="hidden" name="biderName" value="${loggedUser}"/>
                                                                            <input  style="width: 150px" type="number" name="bidAmount"  step="${bidStep}" value="${minimumBid}" min="${minimumBid}"/>
                                                                            <c:if test="${loggedUser==auction.user.username||loggedUser=='admin'||auction.status==false}">
                                                                                <button type="submit"  class="btn btn-fefault cart" disabled>
										<i class="fa fa-shopping-cart"></i>
										Bid
                                                                                </button>  
                                                                            </c:if>
                                                                            <c:if test="${loggedUser!=auction.user.username&&loggedUser!='admin'&&auction.status==true}">
                                                                                <button type="submit"  class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Bid
                                                                                </button>
                                                                            </c:if>
                                                                            
                                                                        </form>
                                                                            
								</span>
                                                                
                                                                            <c:if test="${auction.status==true}">
                                                                                <p><b>Auction Status:</b> <span style="color: blue;">Available</span></p>
                                                                            </c:if>
                                                                            <c:if test="${auction.status==false}">
                                                                                <p><b>Auction Status:</b> <span style="color: red;">Expired</span></p>
                                                                            </c:if>    
								
							</div><!--/product-information-->
						</div>
                                                                
                                                <br>
                                                <p style="color: red;text-align: center">${message}</p>
                                                <div>
                                                    <!--<h3 >List Bider</h3>-->
                                                    
                                                    <div class="table-responsive">
                                                    <table class="table table-bordered table-hover">
                                                        <c:if test="${empty auction.listBid}">
                                                            <tr>
                                                                <td colspan="3" style="color: red;text-align: center">Have not any bid!</td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${not empty auction.listBid}">
                                                            <c:forEach var="b" items="${auction.listBid}">
                                                            <tr>
                                                                <td style="text-align: center">${b.user.username}</td>
                                                                <td style="text-align: center">${b.bidTime}</td>
                                                                <td style="text-align: center"  ><span class="vnd" id="bidNumber-${b.bid_id}">${b.bid_amount}</span> </td>
                                                                <script>
                                                                    $(document).ready(function(){
                                                                    var currentPrice = $("#bidNumber-${b.bid_id}").text();
                                                                    $("#bidNumber-${b.bid_id}").text(parseInt(currentPrice).toLocaleString());
                                                                    });
                                                                </script>
                                                            </tr>  
                                                            </c:forEach>
                                                        </c:if>
                                                        <tr>
                                                            <th style="text-align: center">Username</th>
                                                            <th style="text-align: center">Bid time</th>
                                                            <th style="text-align: center">Bid amount</th>
                                                        </tr>
                                                    </table>  
                                                    </div>
                                                    
                                                </div>  
                                                    
					</div><!--/product-details-->
                                        
                                        
					
					
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
	<jsp:include page="Include/footer.jsp"/>
	</footer><!--/Footer-->
	

  
    
    <script src="${pageContext.request.getContextPath()}/js/auction/auction.js"></script>
    <!--<script src="${pageContext.request.getContextPath()}/js/auction/auctiondetail.js"></script>-->
    <script>
        
        $(document).ready(function(){
    var expriedTime = $("#hiden-${auction.auction_id}").text();
//alert(expriedTime);
var countDownDate = new Date(expriedTime).getTime();
//alert(countDownDate);
// Update the count down every 1 second
var x = setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("display-countdown").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text 
  
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("display-countdown").innerHTML = "EXPIRED";
  }
}, 1000);
});
        
        
        </script>
</body>
</html>
