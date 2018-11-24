
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    </head><!--/head-->
    <body>
        <header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +84935212453</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> nguyenvudhbk@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
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
                                                            <c:if test="${loggedUser=='admin'}">
                                                                <li><a href="${pageContext.request.getContextPath()}/admin/customerManagement"><i class="fa fa-users"></i> Customer Management</a></li>
                                                            </c:if>
                                                            <c:if test="${loggedUser!='nologin'}">
                                                                <li><a href="${pageContext.request.getContextPath()}/user/accountDetail"><i class="fa fa-user"></i> Account</a></li>
                                                            </c:if>
								
								<li><a href="${pageContext.request.getContextPath()}/user/creatAuction"><i class="fa fa-star"></i> Creat Auction</a></li>
                                                                <li><a href="${pageContext.request.getContextPath()}/user/myAuction"><i class="fa fa-beer"></i> My Auction</a></li>
                                                                <c:if test="${loggedUser!='admin'}">
                                                                
								<li><a href="${pageContext.request.getContextPath()}/user/myBid"><i class="fa fa-shopping-cart"></i> My Bid</a></li>
                                                                </c:if>
                                                                
                                                                
                                                                    <li>
                                                                        <c:if test="${loggedUser=='nologin'}">
                                                                            <a href="${pageContext.request.getContextPath()}/login"><i class="fa fa-lock"></i> Login</a>
                                                                        </c:if>
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
	</header><!--/header-->
    
