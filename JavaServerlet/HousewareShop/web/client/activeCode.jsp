<%-- 
    Document   : login
    Created on : Oct 24, 2019, 2:42:53 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="loginbox">
            <img src="images/avatar.png" class="avatar">
            <h1>Check your email</h1>
            <form action="active-code" method="POST"> 
                <p>Active Code</p>
                <input type="hidden" name="username" value="${account.userName}">
                <input class="text" required type="text" name="activeCode" placeholder="Enter Active code">
                ${error}
                <input class="text" type="submit" name="" value="Continue" style="margin-top: 1rem">
                <a href="http://localhost:8080/HousewareShop/forgot-password">Lost your password?</a><br>
                <a href="http://localhost:8080/HousewareShop/sign-up">Don't have an account?</a>
            </form>

        </div>
        
    </body>
</html>
