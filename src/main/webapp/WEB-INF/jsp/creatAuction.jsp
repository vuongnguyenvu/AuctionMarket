
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
        <title>Creat Auction | A-uction</title>
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
<!--        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/css/jquery.datetimepicker.min.css"/>
        -->
    <!-- Đồng Hồ -->
    
        <style>
            #dongho{
                margin: 30px;
                font-size: smaller;
                font-weight: bold;
                color: red;
            }
            #wrapper{
            width: 780px;
            margin: auto;
        }
/*        body {
            font-family: "Helvetica Neue", Helvetica, Tahoma, Arial, "Microsoft YaHei UI","Microsoft YaHei", STXihei, SimSun, sans-serif;
        }*/
        .log-wrapper {
            float: right;
        }
        .log {
            max-height: 300px;
            overflow: auto;
        }
        .log .log__entry {
            margin: .1em 0;
            padding: .1em .2em;
            border: 1px solid black;
            white-space: nowrap;
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
                    <h3>Auction Form</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <mvc:form action="${pageContext.request.getContextPath()}/user/creatAuction" method="post" enctype="multipart/form-data"  modelAttribute="auction" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Product name:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="product.product_name" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Description:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="product.description" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label">
                                Category</label>
                            <div class="col-xs-8 col-sm-8">
                                    <mvc:select path="product.category.category_id">
                                    <c:forEach items="${listCategory}" var="c">
                                        
                                            <mvc:option value="${c.category_id}">${c.category_name}</mvc:option>
                                        
                                    </c:forEach>
                                    </mvc:select>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Minimum Price:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="minimum_price" type="text" class="form-control" id="defaultNumber"/>
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Image:</label>
                            <div class="col-xs-8 col-sm-8">
                                <input  name="file" type="file" class="form-control"/>
                            </div>
                        </div>     
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Duration:</label>
                            <div class="col-xs-8 col-sm-8" >
                                <input style="text-align: center;" name="days" type="number" min="0" max="30" value="0"/> Days
                                <input style="text-align: center;" name="hours" type="number" min="0" max="24" value="0"/> Hours
                                <input style="text-align: center;" name="minutes" type="number" min="0" max="60" value="0"/> Minutes
                            </div>
                        </div>
                            
                            <br>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" value="Creat Auction" class="btn btn-success" />
                        </div>    
                    </mvc:form>
                    
                </div>
            </div>  
    </div>
            
        
    
	

  <jsp:include page="Include/footer.jsp"/>
    <script src="${pageContext.request.getContextPath()}/js/jquery.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/price-range.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/main.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/auction/auction.js"></script>
<!--    
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/js/jquery.datetimepicker.min.js"></script>
    -->
</body>
</html>
