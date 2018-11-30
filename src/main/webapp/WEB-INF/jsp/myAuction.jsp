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
        <title>My Auction | A-uction</title>
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

	<body>
            <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12" style="text-align: center">
                    <h3>My Auction</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th style="text-align: center">Auction ID</th>
                                <th style="text-align: center">Product</th>
                                <th style="text-align: center">Minimum Price</th>
                                <th style="text-align: center">Current Price</th>
                                <th style="text-align: center">Status</th>
                            </tr>
                            <c:if test="${empty listAuction}">
                            <tr>
                                <td colspan="5" style="text-align: center;color: red">Have no auction</td>    
                            </tr>
                            </c:if>
                            <c:if test="${not empty listAuction}">
                            <c:forEach var="a" items="${listAuction}">
                            <tr>
                                <td style="text-align: center"><a href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${a.auction_id}&message">${a.auction_id}</a></td>
                                <td style="text-align: center"><a href="${pageContext.request.getContextPath()}/user/auctionDetail?auctionId=${a.auction_id}&message">${a.product.product_name}</a></td>
                                <td style="text-align: right" class="vnd" id="defaultNumber-${a.auction_id}">${a.minimum_price}</td>
                                        <script>
                                                    $(document).ready(function(){
                                                    var currentPrice = $("#defaultNumber-${a.auction_id}").text();
                                                    $("#defaultNumber-${a.auction_id}").text(parseInt(currentPrice).toLocaleString());
                                                    });
                                        </script>
                                <td style="text-align: right" class="vnd" id="defaultNumber-${a.product.product_id}">${a.currentPrice}</td>
                                        <script>
                                                    $(document).ready(function(){
                                                    var currentPrice = $("#defaultNumber-${a.product.product_id}").text();
                                                    $("#defaultNumber-${a.product.product_id}").text(parseInt(currentPrice).toLocaleString());
                                                    });
                                        </script>
                                <c:if test="${a.status==true}">
                                    <td style="text-align: center; color: blue">Available</td>        
                                </c:if>
                                <c:if test="${a.status==false}">
                                    <td style="text-align: center; color: red">Expired</td>        
                                </c:if>     
                                
                            </tr>
                            </c:forEach>
                            </c:if>
                            
                        </table>
                    </div>
                </div>
            </div>    
        
    </body>
	

  <jsp:include page="Include/footer.jsp"/>
    
</body>
</html>


