<%-- 
    Document   : accountDetail
    Created on : Nov 11, 2018, 2:52:05 PM
    Author     : VUKE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone number</th>
                                <th>Amount</th>
                                
                            </tr>
                                    <tr>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>${user.address}</td>
                                        <td>${user.phone}</td>
                                        <td>${user.amount}</td>
                                        
                                    </tr>
                               
                            
                        </table>
    </body>
</html>
