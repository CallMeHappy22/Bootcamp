<%-- 
    Document   : signup
    Created on : Oct 28, 2019, 4:45:38 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginbox" style="height: 660px !important; width: 30%; margin:1rem auto">
            <img src="images/avatar.png" class="avatar">
            <h1><i class="fas fa-info-circle" style="color: orange"></i> Đăng ký</h1>
            <form action="sign-up" method="POST"> 
                <p>Tên tài khoản</p>
                <input class="text" required type="text" name="username" placeholder="Nhập tài khoản" value="${username}">
                <p>Mật khẩu</p>
                <input class="text" required type="password" name="password" placeholder="Nhập mật khẩu" value="${password}">
                <p>Nhập lại mật khẩu</p>
                <input class="text" required type="password" name="retypePassword" placeholder="Nhập lại mật khẩu" value="${retypePassword}">
                <p>Địa chỉ email</p>
                <input class="text" required type="email" name="email" placeholder="Nhập email" value="${email}">
                <p>Số điện thoại</p><br>
                <input class="text" required type="number" name="phone" placeholder="Nhập số điện thoại" value="${phone}">
                <input class="text" type="submit" name="" value="Tạo tài khoản">
                <a href="http://localhost:8080/HousewareShop/login">Quay lại trang đăng nhập</a><br>
                <span style="color: #fff707" class="mt-2"><i class="fas fa-exclamation-triangle"></i> ${warning}</span>
            </form>

        </div>
    </body>
</html>
