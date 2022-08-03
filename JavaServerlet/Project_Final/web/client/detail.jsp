<%-- 
    Document   : detail
    Created on : Oct 13, 2021, 7:45:10 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container" style="margin-top: 5rem">
            <div class="row mt-5">
                <div class="col-md-5 mt-5">
                    <c:forEach items="${product.getListImages()}" var="image" varStatus="track">
                        <div class="mySlides" style="display: block;">
                            <div class="numbertext">${track.count} / ${product.getListImages().size()}</div>
                            <img src="static/images/${image.imageUrl}" class="w-100">
                        </div>
                    </c:forEach>

                    <!-- Next and previous buttons -->
                    <a class="prevs" onclick="plusSlides(-1)">❮</a>
                    <a class="nexts" onclick="plusSlides(1)">❯</a>


                    <!-- Thumbnail images -->
                    <div class="row-image">
                        <c:forEach items="${product.getListImages()}" var="image" varStatus="track">
                            <div class="column">
                                <img class="demo cursor w-100 active" src="static/images/${image.imageUrl}" onclick="currentSlide(${track.count})">
                            </div>
                        </c:forEach>

                    </div>
                </div>

                <div class="col-md-6 pl-5">
                    <h3 class="mt-5">${product.name}

                        <sup>
                            <span class="badge badge-success">


                                freeShip


                            </span>
                        </sup>

                    </h3>
                    <p class="my-0"><b style="font-size: 25px;color: #f60">$ ${product.price}</b></p>
                    <hr>
                    <h6 class="mt-5"><b>Mã sản phẩm: ${product.code}</b></h6>
                    <hr>
                    <p class="mt-4"><b>Thông tin sản phẩm:</b><br><br>${product.description}</p>
                    <hr>
                    <a href="add-to-cart?productId=${product.id}" class="btn btn-outline-danger w-50 mt-4"><i class="fas fa-cart-plus mr-2"></i>Add to
                        Cart</a>
                    <a href="./checkout.html" class="btn btn-outline-success w-25 mt-4 ml-2">Buy Now<i
                            class="fas fa-money-check-alt ml-2" style="color: green"></i></a>
                </div>
            </div>
        </div>
        <script src="static/js/gallery.js" type="text/javascript"></script>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
