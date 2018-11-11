<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Homepage</h1>
        <c:if test="${login==false}">
            <a href="${pageContext.request.getContextPath()}/register">Register</a>
            <a href="${pageContext.request.getContextPath()}/user/home">Login</a> 
        </c:if>
        <c:if test="${login==true}">
            <form action="<c:url value="/j_spring_security_logout" />" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="submit" value="Logout" />
            </form>
        </c:if>    
        
        
    </body>
</html>
