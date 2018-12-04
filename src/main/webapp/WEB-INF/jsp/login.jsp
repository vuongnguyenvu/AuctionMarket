
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
        <title>Login | A-uction</title>
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

        
	<section id="form"><!--form-->
            <div class="container">
                <div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<form action="j_spring_security_check" method="post">
							<input type="text" placeholder="Username" name="username"/>
							<input type="password" placeholder="Password" name="password"/>
							<button type="submit" class="btn btn-default">Login</button>
                                                        <input type="hidden" name="login" value="${SPRING_SECURITY_LAST_EXCEPTION}"/>
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					</div><!--/login form-->
                                        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                                            <p style="color: red;">Login Fail. Detail:
                                            <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                                            </p>
                                        </c:if> 
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
                                                <mvc:form action="register" method="post"  modelAttribute="user" class="form-horizontal">
                                                    <mvc:input  path="username" type="text" placeholder="Username"/>
                                                    <mvc:input  path="password" type="password" placeholder="Password"/>
                                                    <mvc:input  path="email" type="text" placeholder="Email"/>
                                                    <mvc:input  path="address" type="text" placeholder="Address"/>
                                                    <mvc:input  path="phone" type="text" placeholder="Phone number"/>
                                                    <button type="submit" class="btn btn-default">Signup</button>
                                                </mvc:form>

                                        </div>
                                </div>
		</div>
            </div>
			
	</section><!--/form-->
	

  <jsp:include page="Include/footer.jsp"/>
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="js/auction/auction.js"></script>
</body>
</html>
