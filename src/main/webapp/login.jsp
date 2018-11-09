
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12" style="text-align: center">
                    <h3>Login Form</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                <form action="j_spring_security_check" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-2 control-label" >Username:</label>
                        <div class="col-xs-8 col-sm-8">
                        <input type="text" name="username" class="form-control">
                        </div>  
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-2 control-label" >Password:</label>
                        <div class="col-xs-8 col-sm-8">
                        <input type="password" name="password" class="form-control">
                        </div>  
                    </div>
                    <div class="form-group" style="text-align: center">
                        <input type="submit" value="Login" class="btn btn-primary">
                            
                    </div> 
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                <p style="color: red;">Login Fail. Detail:
                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                </p>
            </c:if>    
                </div>
            </div>    
        </div>    
        
    </body>
</html>

