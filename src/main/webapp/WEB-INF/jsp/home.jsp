<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | A-uction</title>
        <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/prettyPhoto.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/price-range.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/animate.css" rel="stylesheet">
            <link href="${pageContext.request.getContextPath()}/css/main.css" rel="stylesheet">
            <link href="${pageContext.request.getContextPath()}/css/responsive.css" rel="stylesheet">
            
        <link rel="shortcut icon" href="${pageContext.request.getContextPath()}/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.getContextPath()}/images/ico/apple-touch-icon-57-precomposed.png">

    <!-- Đồng Hồ -->
    
        <style>
            .vnd:after { content:' VND'; }
            #dongho{
                margin: 30px;
                font-size: smaller;
                font-weight: bold;
                color: red;
            }
        </style>

        <script src="${pageContext.request.getContextPath()}/js/jquery.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/price-range.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/main.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/home.js"></script>
    
<!--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script language="JavaScript">
            var time = 5; //time in seconds
            var interval = time * 1000;
            var timer = setInterval("send()", interval);
            function send(){
                window.location.reload(true);
//                $('#stage').load('./result.jsp');
            }
    </script>-->
    </head><!--/head-->
    <body>
        <header id="header">
            <jsp:include page="Include/header.jsp" />
        </header>
        
	
    
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
                                            <!-- thanh cuộn chạy auto  -->
						<div class="carousel-inner">
                                                    
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>A</span>uction</h1>
                                                                        <h2 style="color: #FE980F">WITH LATEST CREATION</h2>
									<h3>${latestAuction.product.product_name} </h3>
                                                                        <a class="btn btn-default get" href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${latestAuction.auction_id}&message">
                                                                            Bid it now</a>
								</div>
								<div class="col-sm-6">
                                                                    <c:forEach items="${latestAuction.product.listImage}" var="i">
                                                                                        <img class="girl img-responsive" src="${pageContext.request.getContextPath()}/${i.path}" alt="${a.product.product_name}" />
                                                                                        </c:forEach>
								</div>
							</div>
                                                        
                                                        <c:forEach items="${highestAuction}" var="h">
                                                               <div class="item">
								<div class="col-sm-6">
									<h1><span>A</span>uction</h1>
                                                                        <h2 style="color: #FE980F">WITH HIGH CURRENT PRICE</h2>
									<h3>${h.product.product_name} </h3>
                                                                        <a class="btn btn-default get" href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${h.auction_id}&message">
                                                                            Bid it now</a>
								</div>
								<div class="col-sm-6">
                                                                    <c:forEach items="${h.product.listImage}" var="i">
                                                                                        <img class="girl img-responsive" src="${pageContext.request.getContextPath()}/${i.path}" alt="${h.product.product_name}" />
                                                                                        </c:forEach>
								</div>
                                                                </div>             
                                                        </c:forEach>                    
							
<!--							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>A</span>uction</h1>
									<h2>ALL PRODUCTS ARE STARTING FROM 1,000 ₫ RATES WITHOUT PRE-ORDER!</h2>
									<p>ALL PRODUCTS ARE STARTING FROM 1,000 ₫ RATES WITHOUT PRE-ORDER! </p>
									<button type="button" class="btn btn-default get">Bid it now</button>
								</div>
								<div class="col-sm-6">
									<img src="${pageContext.request.getContextPath()}/images/home/girl3.jpg" class="girl img-responsive" alt="" />
									<img src="${pageContext.request.getContextPath()}/images/home/pricing.png" class="pricing" alt="" />
								</div>
							</div>
							-->
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
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
							<img src="${pageContext.request.getContextPath()}/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items">
                                            <c:if test="${not empty listAuctionByCategory}">
						<h2 class="title text-center">Search by category: ${category.category_name}</h2>
                                                <c:forEach items="${listAuctionByCategory}" var="a">
                                                <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
                                                                                    <div>
                                                                                        <c:forEach items="${a.product.listImage}" var="i">
                                                                                        <img width="150px" height="200px" src="${pageContext.request.getContextPath()}/${i.path}" alt="${a.product.product_name}" />
                                                                                        </c:forEach>
                                                                                    </div>
											<p>${a.product.product_name}</p>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
                                                                                            <p style="display: none;" id="hiden-${a.auction_id}">${a.expiredTime}</p>
                                                                                            <h2 style="color: #cc0033;" id="expiredTime-${a.auction_id}"></h2>
                                                                                            
                                                                                            <script>
                                                                                                $(document).ready(function(){
                                                                                                    countDown("hiden-${a.auction_id}", "expiredTime-${a.auction_id}");
                                                                                                });
                                                                                            </script>
                                                                                            <h2 >Current Price:</h2>
                                                                                            <h2 class="vnd" id="defaultNumber-${a.auction_id}">${a.currentPrice}</h2>
                                                                                            <script>
                                                                                                $(document).ready(function(){
                                                                                                    var currentPrice = $("#defaultNumber-${a.auction_id}").text();
                                                                                                    $("#defaultNumber-${a.auction_id}").text(parseInt(currentPrice).toLocaleString());
                                                                                                });
                                                                                            </script>
												<p>${a.product.product_name}</p>
                                                                                                <c:if test="${a.status==true}">
                                                                                                   <a class="btn btn-default add-to-cart" href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${a.auction_id}&message"><i class="fa fa-shopping-cart"></i>Bid</a>
                                                                                                </c:if>
                                                                                                <c:if test="${a.status==false}">
                                                                                                    <button type="button" disabled class="btn btn-default add-to-cart" ><i class="fa fa-shopping-cart"></i>Bid</button>
                                                                                                </c:if>    
											</div>
										</div>
								</div>
							</div>
						</div>    
                                                </c:forEach>
                                            </c:if>     
                                            
                                            
                                            
                                            <c:if test="${empty listAuctionByCategory}">
						<h2 class="title text-center">Features Items</h2>
                                                <c:forEach items="${listAuction}" var="a">
                                                <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
                                                                                    <div>
                                                                                        <c:forEach items="${a.product.listImage}" var="i">
                                                                                        <img width="150px" height="200px" src="${pageContext.request.getContextPath()}/${i.path}" alt="${a.product.product_name}" />
                                                                                        </c:forEach>
                                                                                    </div>
											<p>${a.product.product_name}</p>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
                                                                                            <p style="display: none;" id="hiden-${a.auction_id}">${a.expiredTime}</p>
                                                                                            <h2 style="color: #660000;" id="expiredTime-${a.auction_id}"></h2>
                                                                                            
                                                                                            <script>
                                                                                                $(document).ready(function(){
                                                                                                    countDown("hiden-${a.auction_id}", "expiredTime-${a.auction_id}");
                                                                                                });
                                                                                            </script>
                                                                                            
                                                                                            
                                                                                            <h2 >Current Price:</h2>
                                                                                            <h2 class="vnd" id="defaultNumber-${a.auction_id}">${a.currentPrice}</h2>
                                                                                            <script>
                                                                                                $(document).ready(function(){
                                                                                                    var currentPrice = $("#defaultNumber-${a.auction_id}").text();
                                                                                                    $("#defaultNumber-${a.auction_id}").text(parseInt(currentPrice).toLocaleString());
                                                                                                });
                                                                                            </script>
												<p>${a.product.product_name}</p>
                                                                                                <c:if test="${a.status==true}">
                                                                                                    <a class="btn btn-default add-to-cart" href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${a.auction_id}&message"><i class="fa fa-shopping-cart"></i>Bid</a>
                                                                                                </c:if>
                                                                                                <c:if test="${a.status==false}">
                                                                                                    <button type="button" disabled class="btn btn-default add-to-cart" ><i class="fa fa-shopping-cart"></i>Bid</button>
                                                                                                </c:if>   
											</div>
										</div>
								</div>
							</div>
						</div>    
                                                </c:forEach>
                                            </c:if>     
					</div>
                                        
                                        
                                         
                                         
                                    <c:if test="${not empty listAvailableAuction}">
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
                                                                    <c:forEach items="${listAvailableAuction}" var="a">
                                                                        <div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
                                                                                                    <c:forEach items="${a.product.listImage}" var="i">
                                                                                                    <img width="150px" height="200px" src="${pageContext.request.getContextPath()}/${i.path}" alt="${a.product.product_name}" />
                                                                                                    </c:forEach>
													<!--<img src="${pageContext.request.getContextPath()}/images/home/recommend1.jpg" alt="" />-->
													<h2>${a.currentPrice}</h2>
													<p>${a.product.product_name}</p>
													<a href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${a.auction_id}&message" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
                                                                    </c:forEach>
<!--									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${pageContext.request.getContextPath()}/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${pageContext.request.getContextPath()}/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>-->
<!--								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${pageContext.request.getContextPath()}/images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${pageContext.request.getContextPath()}/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${pageContext.request.getContextPath()}/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Bid</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>-->
							</div>
<!--							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			-->
						</div>
					</div><!--/recommended_items-->
				</c:if>
				</div>
			</div>
		</div>
	</section>
<footer id="footer"><!--Footer-->
	<jsp:include page="Include/footer.jsp"/>
</footer><!--/Footer-->
    
    </body>
</html>
