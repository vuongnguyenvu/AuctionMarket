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
        <title>Account Detail | A-uction</title>
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
        <script src="${pageContext.request.getContextPath()}/js/home.js"></script>
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
                    <h3>Account Information</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th style="text-align: center">Username</th>
                                <th style="text-align: center">Email</th>
                                <th style="text-align: center">Address</th>
                                <th style="text-align: center">Phone number</th>
                                <th style="text-align: center">Amount</th>
                            </tr>
                            <tr>
                                        <td style="text-align: center">${user.username}</td>
                                        <td style="text-align: center">${user.email}</td>
                                        <td style="text-align: center">${user.address}</td>
                                        <td style="text-align: center">${user.phone} </td>
                                        <td style="text-align: center" class="vnd" ><span id="defaultNumber">${user.amount}</span></td>
                                        <script>
                                            $(document).ready(function(){
                                            var currentPrice = $("#defaultNumber").text();
                                            $("#defaultNumber").text(parseInt(currentPrice).toLocaleString());
                                            });
                                        </script>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12" style="text-align: center">
                    <h3>Transaction History</h3>
                </div>                                
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th style="text-align: center">Time</th>
                                <th style="text-align: center">Amount</th>
                            </tr>
                            <c:if test="${not empty user.listTransaction}">
                                <c:forEach items="${user.listTransaction}" var="t">
                                <tr>
                                        <td style="text-align: center">${t.transaction_date}</td>
                                        <td style="text-align: center">
                                            <c:if test="${t.transaction_type==false}">
                                                <span style="color: red">-</span>
                                                <span class="vnd" style="color: red" id="defaultNumber-${t.transaction_id}">${t.transaction_amount}</span></td>
                                            </c:if>
                                            <c:if test="${t.transaction_type==true}">
                                                <span style="color: blue">+</span>
                                                <span class="vnd" style="color: blue" id="defaultNumber-${t.transaction_id}">${t.transaction_amount}</span></td>
                                            </c:if>    
                                                
                                        <script>
                                            $(document).ready(function(){
                                            var currentPrice = $("#defaultNumber-${t.transaction_id}").text();
                                            $("#defaultNumber-${t.transaction_id}").text(parseInt(currentPrice).toLocaleString());
                                            });
                                        </script>
                                </tr>
                                </c:forEach>
                            </c:if>
                                <c:if test="${empty user.listTransaction}">
                                    <tr>
                                        <td colspan="2" style="color: red; text-align: center">Have no transaction</td>
                                    </tr>
                                </c:if>    
                            
                            
                        </table>
                    </div>
                </div>
            </div>                                
    </div>
	

  <footer id="footer"><!--Footer-->
	<jsp:include page="Include/footer.jsp"/>
</footer><!--/Footer-->
    
</body>
</html>


