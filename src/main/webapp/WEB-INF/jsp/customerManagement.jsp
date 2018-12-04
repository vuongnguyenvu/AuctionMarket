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
        <title>Customer Management | A-uction</title>
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
                    <h3>Customer Management</h3>
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
                                <th style="text-align: center" >Amount</th>
                                <th style="text-align: center">Top up</th>
                                <th style="text-align: center">Transaction history</th>
                                <!--<th style="text-align: center">Active/DeActive</th>-->
                            </tr>
                            <c:forEach var="user" items="${listUser}">
                            <tr>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>${user.address}</td>
                                        <td style="text-align: center">${user.phone}</td>
                                        <td style="text-align: right" class="vnd" ><span id="defaultNumber-${user.user_id}">${user.amount}</span> </td>
                                        <script>
                                            $(document).ready(function(){
                                            var currentPrice = $("#defaultNumber-${user.user_id}").text();
                                            $("#defaultNumber-${user.user_id}").text(parseInt(currentPrice).toLocaleString());
                                            });
                                        </script>
                                        <td>
                                            <c:if test="${user.username!='admin'}">
                                                <form action="${pageContext.request.getContextPath()}/admin/topup" class="form-horizontal">
                                                <input type="hidden" name="userId" value="${user.user_id}"/>
                                                <div style="text-align: center"> 
                                                    <input style="text-align: center" type="number" name="top_up_amount" value="0" min="0"/>    
                                                    <input  type="submit" value="Top up" class="btn btn-default">
                                                </div>
                                                </form>
                                            </c:if>
                                            
                                        </td>
                                        <td style="text-align: center"><a href="${pageContext.request.getContextPath()}/admin/viewAccountDetail?userId=${user.user_id}">View</a></td>
                            </tr>
                            </c:forEach>
                            
                            
                        </table>
                    </div>
                </div>
            </div>    
        
    </body>
	

  <jsp:include page="Include/footer.jsp"/>
    
</body>
</html>


