<%-- 
    Document   : result
    Created on : Dec 1, 2018, 9:24:32 AM
    Author     : designreel2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script src="${pageContext.request.getContextPath()}/js/jquery.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/price-range.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/main.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/home.js"></script>
    </head>
    <body>
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
                                                                                            <h2 style="color: blue;" id="expiredTime-${a.auction_id}"></h2>
                                                                                            
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
    </body>
</html>
