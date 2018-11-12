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
	
                
                <div style="margin-right: 150px; margin-top: 30px;">
                    <c:if test="${loggedUser!='nologin'}">
                    <div style="text-align: right; color: #660000; font-size: larger; font-style: italic;">Wellcome ${loggedUser}!</div>
                    </c:if>
                </div>
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="${pageContext.request.getContextPath()}/home"><img src="${pageContext.request.getContextPath()}/images/home/logo.jpg" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									USA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canada</a></li>
									<li><a href="#">UK</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									<li><a href="#">Pound</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
                                                            
								
								<li><a href="${pageContext.request.getContextPath()}/user/creatAuction"><i class="fa fa-star"></i> Creat Auction</a></li>
								<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                                                
                                                                    <li>
                                                                        
                                                                            <c:if test="${loggedUser!='nologin'}">
                                                                            <div style="margin-top: 10px;">
                                                                            <form id="formid" action="<c:url value="/j_spring_security_logout" />" method="post">
                                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                                <a  href="#" onclick="document.getElementById('formid').submit()"><i class="fa fa-sign-out"></i>Logout</a>
                                                                            </form>
                                                                        </div>
                                                                        </c:if>
                                                                        
                                                                        
                                                                
                                                                    </li>
                                                                  
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="${pageContext.request.getContextPath()}/home" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.jsp">Products</a></li>
										<li><a href="product-details.jsp">Product Details</a></li> 
										<li><a href="checkout.jsp">Checkout</a></li> 
										<li><a href="cart.jsp">Cart</a></li> 
										<li><a href="login.jsp">Login</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.jsp">Blog List</a></li>
										<li><a href="blog-single.jsp">Blog Single</a></li>
                                    </ul>
                                </li> 
								<li><a href="404.jsp">404</a></li>
								<li><a href="contact-us.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
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
                                <th style="text-align: center">Amount</th>
                                <th style="text-align: center">Top up</th>
                                <th style="text-align: center">Delete</th>
                            </tr>
                            <c:forEach var="user" items="${listUser}">
                            <tr>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>${user.address}</td>
                                        <td>${user.phone}</td>
                                        <td>${user.amount}VND</td>
                                        <td>
                                            <c:if test="${user.username!='admin'}">
                                                <form action="${pageContext.request.getContextPath()}/admin/topup" class="form-horizontal">
                                                <input type="hidden" name="userId" value="${user.user_id}"/>
                                                <div> <input type="number" name="top_up_amount" /></div>
                                                <div style="text-align: center "><input  type="submit" value="Top up amount" class="btn btn-success"></div>
                                                    
                                            </form>
                                            </c:if>
                                            
                                        </td> 
                                        <td>
                                            <c:if test="${user.username!='admin'}">
                                                <button class="btn btn-warning"
                                                    onclick="location.href = '${pageContext.request.getContextPath()}/admin/delete?userId=${user.user_id}'" >Delete account</button>
                                            </c:if>
                                            
                                        </td>
                                        
                            </tr>
                            </c:forEach>
                            
                            
                        </table>
                    </div>
                </div>
            </div>    
        
    </body>
	

  <jsp:include page="Include/footer.jsp"/>
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>


