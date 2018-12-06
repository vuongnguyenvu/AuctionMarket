
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
                        <div class="container">
                                <div class="col-sm-12">
						<div class="logo center-block">
                                                    <a href="${pageContext.request.getContextPath()}/home"><img style="width: 100%;" src="${pageContext.request.getContextPath()}/images/home/MP-market-auction.png" alt="" /></a>
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
                                                    <a href="${pageContext.request.getContextPath()}/home"><img style="margin-left: 30%" src="${pageContext.request.getContextPath()}/images/home/logo1.jpg" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
                                                            <c:if test="${loggedUser=='admin'}">
                                                                <li><a href="${pageContext.request.getContextPath()}/admin/customerManagement"><i class="fa fa-users"></i> Customer Management</a></li>
                                                                <li><a href="${pageContext.request.getContextPath()}/admin/auctionManagement"><i class="fa fa-beer"></i> Auction Management</a></li>
                                                            </c:if>
                                                            <c:if test="${loggedUser!='nologin'}">
                                                                <li><a href="${pageContext.request.getContextPath()}/user/accountDetail"><i class="fa fa-user"></i> Account</a></li>
                                                            </c:if>
                                                                <c:if test="${loggedUser!='admin'}">
                                                                <li><a href="${pageContext.request.getContextPath()}/user/creatAuction"><i class="fa fa-star"></i> Creat Auction</a></li>    
                                                                <li><a href="${pageContext.request.getContextPath()}/user/myAuction"><i class="fa fa-beer"></i> My Auction</a></li>
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
										<li><a href="${pageContext.request.getContextPath()}/user/myAuction">My Auction</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">Blog List</a></li>
										<li><a href="#">Blog Single</a></li>
                                    </ul>
                                </li> 
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
<!--					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>-->
				</div>
			</div>
		</div><!--/header-bottom-->
    </header><!--/header-->
	</header><!--/header-->
    
