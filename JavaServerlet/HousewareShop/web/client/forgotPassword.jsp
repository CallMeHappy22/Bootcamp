<%-- 
    Document   : forgotPassword
    Created on : Oct 28, 2019, 11:47:00 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên mật khẩu</title>
         <link href="css/login.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginbox" style="height: 510px !important">
            <img src="images/avatar.png" class="avatar">
            <h1><i class="fas fa-info-circle" style="color: orange"></i> Quên mật khẩu</h1>
            <form action="forgot-password" method="POST"> 
                <p>Tên tài khoản</p>
                <input class="text" required type="text" name="username" placeholder="Nhập tên tài khoản">
                <p>Địa chỉ email</p>
                <input class="text" required type="email" name="email" placeholder="Nhập email">
                <p>Số điện thoại</p><br>
                <input class="text" required type="number" name="phone" placeholder="Nhập số điện thoại">
                <input class="text" type="submit" name="" value="Gửi">
                <a href="http://localhost:8080/HousewareShop/sign-up">Đăng kí</a><br>
                <a href="http://localhost:8080/HousewareShop/login">Quay lại trang đăng nhập</a><br>
                <span style="color: #fff707; font-size: 14px" class="mt-1"><i class="fas fa-exclamation-triangle"></i> ${warning}</span>
            </form>

        </div>
    </body>
</html>
