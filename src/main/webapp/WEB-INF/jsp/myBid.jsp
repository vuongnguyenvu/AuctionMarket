<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>My Bid | A-uction</title>
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
        <script src="${pageContext.request.getContextPath()}/js/jquery.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/price-range.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.getContextPath()}/js/main.js"></script>
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

    </head><!--/head-->
<body>
            <header id="header"><!--header-->
                    <jsp:include page="Include/header.jsp" />
            </header><!--/header-->    

    <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12" style="text-align: center">
                    <h3>My Bid</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <c:if test="${empty listBid}">
                                <tr>
                                    <td colspan="5" style="text-align: center;color: red">Have no bid</td>
                                </tr>
                            </c:if>
                                
                            <c:if test="${not empty listBid}">
                                <c:forEach var="b" items="${listBid}">
                                    <tr>
                                        <td style="text-align: center"><a href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${b.auction.auction_id}&message">${b.auction.auction_id}</a></td>
                                        <td style="text-align: center"><a href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${b.auction.auction_id}&message">${b.auction.product.product_name}</a></td>
                                        <td style="text-align: center">${b.bidTime}</td>
                                        <td style="text-align: center" id="defaultNumber-${b.bid_id}">${b.bid_amount}</td>
                                        <script>
                                                    $(document).ready(function(){
                                                    var currentPrice = $("#defaultNumber-${b.bid_id}").text();
                                                    $("#defaultNumber-${b.bid_id}").text(parseInt(currentPrice).toLocaleString());
                                                    });
                                        </script>
                                        <c:if test="${b.win==true}">
                                        <td style="text-align: center; color: blue">Won</td>        
                                        </c:if>
                                        <c:if test="${b.win==false}">
                                            <td style="text-align: center; color: tomato">Waiting...</td>        
                                        </c:if> 
                                    </tr>
                                </c:forEach>
                            </c:if>  
                                    
                            <tr>
                                <th style="text-align: center">Auction ID</th>
                                <th style="text-align: center">Product</th>
                                <th style="text-align: center">Bid time</th>
                                <th style="text-align: center">Bid amount</th>
                                <th style="text-align: center">Status</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>    
    </div>
	

  <jsp:include page="Include/footer.jsp"/>
    
</body>
</html>


