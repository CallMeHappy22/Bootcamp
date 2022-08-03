<%-- 
    Document   : index
    Created on : Oct 2, 2019, 8:47:38 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session"></fmt:setLocale>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <title>HouseWareShop</title>
<!--        <style>
            .card-body p{
                max-height: 43px;
                overflow: hidden;
                color: rgb(51, 51, 51);
                font-size: 13px;
            }
            .card-title:hover{
                color: blue !important;
            }
            .card-text:hover{
                color: gray !important;
            }
        </style>-->
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>


        <!--store coupon-->
        <div class="container">
            <div class="row">
                <a href="#">
                    <img class="img-fluid" style="margin-top: 4.5rem;;" src="images/store_coupon.png" alt="images/store_coupon.png">
                </a>
            </div>
        </div>




        <!--slider-->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/slide1_1.jpg" class="d-block w-100" alt="../images/slide1_1.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide1_2.jpg" class="d-block w-100" alt="../images/slide1_2.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide1_3.jpg" class="d-block w-100" alt="../images/slide1_3.jpg">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel" data-interval="3010">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators2" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/slide2_1.jpg" class="d-block w-100" alt="images/slide2_1.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide2_2.jpg" class="d-block w-100" alt="images/slide2_2.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide2_3.jpg" class="d-block w-100" alt="images/slide2_3.jpg">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container">
            <!--PICK FOR YOU -->
            <div class="row">
                <h1 class="mx-auto" style="margin-top: 1.5rem;">Dành Cho Bạn</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row mb-3">
                        <c:forEach items="${listProduct}" var="product">
                            <div class="col-md-3 mt-4">
                                <div class="card">
                                    <a href="detail?id=${product.id}"><img src="images/${product.image}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <a href="detail?id=${product.id}"><h5 class="card-title">${product.name}</h5></a>
                                        <a href="detail?id=${product.id}"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${product.price}"/></b></a>
                                        <a href="add-to-cart?id=${product.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <!--Measurement & Analysis Instruments-->
            <div class="row">
                <h1 class="mx-auto" style="margin-top: 1.5rem">Công Cụ Đo Lường</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row mb-3">
                        <c:forEach items="${listMeasurement}" var="measurement">
                            <div class="col-md-3 mt-4">
                                <div class="card">
                                    <a href="detail?id=${measurement.id}"><img src="images/${measurement.image}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <a href="detail?id=${measurement.id}"><h5 class="card-title">${measurement.name}</h5></a>
                                        <a href="detail?id=${measurement.id}"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${measurement.price}"/></b></a>
                                        <a href="add-to-cart?id=${measurement.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">

            <!--New Arrivals-->
            <div class="row" style="background-image: url('images/new_arrival.jpg')">
                <h1 class="mx-auto mt-1" style="color: white;">Sản Phẩm Mới Nhất</h1>

                <div class="col-md-12">
                    <div class="row mb-2">
                        <div class="col-md-2">

                        </div>
                        <c:forEach items="${newArrival}" var="arrival">
                            <div class="col-md-2 mt-4">
                                <div class="card">
                                    <c:if test="${arrival.status==2}">
                                        <div id="DIV_1">
                                            <span id="SPAN_2">26</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${arrival.status==3}">
                                        <div id="DIV_1">
                                            <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                                        </div>
                                    </c:if>
                                    <a href="detail?id=${arrival.id}"><img src="images/${arrival.image}" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <a href="detail?id=${arrival.id}"><h5 class="card-title">${arrival.name}</h5></a>
                                        <a href="detail?id=${arrival.id}"><h6 class="card-title"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${arrival.price}"/></b></h6></a>
                                        <a href="add-to-cart?id=${arrival.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slide-->

        <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel" data-interval="3000">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators3" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators3" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators3" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/slide3_1.jpg" class="d-block w-100" alt="images/slide3_1.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide3_2.jpg" class="d-block w-100" alt="images/slide3_2.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide3_3.jpg" class="d-block w-100" alt="images/slide3_3.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide3_4.jpg" class="d-block w-100" alt="images/slide3_4.jpg">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <div class="container">

            <!--Tools -->
            <div class="row">
                <h1 class="mx-auto" style="margin-top: 1.5rem">Dụng Cụ</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row mb-3">
                        <c:forEach items="${listTool}" var="tool">
                            <div class="col-md-3 mt-4">
                                <div class="card">
                                    <a href="detail?id=${tool.id}"><img src="images/${tool.image}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <a href="detail?id=${tool.id}"><h5 class="card-title">${tool.name}</h5></a>
                                        <a href="detail?id=${tool.id}"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${tool.price}"/></b></a>
                                        <a href="add-to-cart?id=${tool.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>


        <div id="carouselExampleIndicators4" class="carousel slide" data-ride="carousel" data-interval="2500">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators4" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators4" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/slide4_1.jpg" class="d-block w-100" alt="images/slide3_1.jpg">
                </div>
                <div class="carousel-item">
                    <img src="images/slide4_2.jpg" class="d-block w-100" alt="images/slide3_2.jpg">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators4" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators4" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <div class="container">

            <!--Tools -->
            <div class="row">
                <h1 class="mx-auto" style="margin-top: 1.5rem">Dụng Cụ Nhà Vườn</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row mb-3">
                        <c:forEach items="${listHomeAndGarden}" var="home">
                            <div class="col-md-3 mt-4">
                                <div class="card">
                                    <a href="detail?id=${home.id}"><img src="images/${home.image}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <a href="detail?id=${home.id}"><h5 class="card-title">${home.name}</h5></a>
                                        <a href="detail?id=${home.id}"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${home.price}"/></b></a>
                                        <a href="add-to-cart?id=${home.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">

            <!--Tools -->
            <div class="row">
                <h1 class="mx-auto" style="margin-top: 1.5rem">Dụng Cụ</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row mb-3">
                        <c:forEach items="${listTool}" var="tool">
                            <div class="col-md-3 mt-4">
                                <div class="card">
                                    <a href="detail?id=${tool.id}"><img src="images/${tool.image}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <a href="detail?id=${tool.id}"><h5 class="card-title">${tool.name}</h5></a>
                                        <a href="detail?id=${tool.id}"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${tool.price}"/></b></a>
                                        <a href="add-to-cart?id=${tool.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div id="carouselExampleIndicators4" class="carousel slide" data-ride="carousel" data-interval="2500">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators4" data-slide-to="0" class=""></li>
                <li data-target="#carouselExampleIndicators4" data-slide-to="1" class="active"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item">
                    <img src="images/slide4_1.jpg" class="d-block w-100" alt="images/slide3_1.jpg">
                </div>
                <div class="carousel-item active">
                    <img src="images/slide4_2.jpg" class="d-block w-100" alt="images/slide3_2.jpg">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators4" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators4" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>





        <%@include file="../component/footer.jsp" %>

    </body>
</html>
