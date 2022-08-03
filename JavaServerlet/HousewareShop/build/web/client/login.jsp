<%-- 
    Document   : login
    Created on : Oct 24, 2019, 2:42:53 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="loginbox" style="height: 450px">
            <img src="images/avatar.png" class="avatar">
            <h1>Đăng nhập</h1>
            <form action="login" method="POST"> 
                <p>Tài khoản</p>
                <input class="text" required type="text" name="username" value="admin" placeholder="Nhập tài khoản">
                <p>Mật khẩu</p>
                <input class="text" required type="password" name="password" value="admin" placeholder="Nhập mật khẩu">
                <input type="checkbox" name="remember"/>Nhớ mật khẩu
                <input class="text" type="submit" name="" value="Đăng nhập" style="margin-top: 1rem">
                <a href="http://localhost:8080/HousewareShop/forgot-password">Quên mật khẩu?</a><br>
                <a href="http://localhost:8080/HousewareShop/sign-up">Đăng kí</a><br>
                <span style="color: #fff707; font-size: 14px" class="mt-1"><i class="fas fa-exclamation-triangle"></i> ${warning}</span>
            </form>

        </div>
        
    </body>
</html>
