
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
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
                    <h3>Register Form</h3>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <mvc:form action="register" method="post"  modelAttribute="user" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Username:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="username" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Password:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="password" type="password" class="form-control"/>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Email:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="email" type="text" class="form-control"/>
                            </div>
                        </div>     
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Address:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="address" type="text" class="form-control"/>
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-2 control-label" >Phone Number:</label>
                            <div class="col-xs-8 col-sm-8">
                                <mvc:input  path="phone" type="text" class="form-control"/>
                            </div>
                        </div>
                                <mvc:input  path="role.role_id" type="hidden" value="${user.role.role_id}"/>
                                <mvc:input  path="amount" type="hidden" value="${user.amount}"/>
                            <br>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" value="Register" class="btn btn-primary" />
                        </div>    
                    </mvc:form>
                    
                </div>
            </div>
        </div>
    </body>
</html>
