
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

    <!-- Đồng Hồ -->
    
        <style>
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
                            <label class="col-xs-4 col-sm-2 control-label" >Category:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="product.category.category_name" type="text" class="form-control"/>
                            </div>
                        </div>     
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Minimum Price:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="minimum_price" type="text" class="form-control"/>
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Duration:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="duration" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Image:</label>
                            <div class="col-xs-8 col-sm-8">
                                <input  name="file" type="file" class="form-control"/>
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
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
