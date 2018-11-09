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
        
        <a href="${pageContext.request.getContextPath()}/logout">Logout</a>
    </body>
</html>
