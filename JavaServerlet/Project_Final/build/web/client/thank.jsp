<%-- 
    Document   : thank
    Created on : Oct 23, 2021, 2:47:21 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <link rel="stylesheet" href="static/css/main.css">
        <title>Houseware Shop</title>
    </head>

    <body>
        <%@include file="../components/header.jsp" %>
        <div class="container" style="margin-top: 7rem">
            <div class="alert alert-success" role="alert">
                Quý khách đã đặt hàng thành công.Cảm ơn quý khách đã mua hàng.
            </div>
            <div><a href="products" class="btn btn-outline-success">Tiếp tục mua hàng...</a></div>
        </div>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
