<%-- 
    Document   : detail
    Created on : Oct 10, 2019, 9:26:56 PM
    Author     : ThinkPro
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Product Detail</title>

                <script>
                    window.fbAsyncInit = function () {
                        FB.init({
                            appId: '695593920924269',
                            cookie: true,
                            xfbml: true,
                            version: 'v8.0'
                        });
        
                        FB.AppEvents.logPageView();
        
                    };
        
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) {
                            return;
                        }
                        js = d.createElement(s);
                        js.id = id;
                        js.src = "https://connect.facebook.net/en_US/sdk.js";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                </script>

       
    </head>
    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=695593920924269&autoLogAppEvents=1" nonce="r62ZfCGK"></script>
        <%@include file="../component/navbar.jsp" %>
        <div class="container" style="margin-top: 5rem">
            <div class="row mt-5">
                <div class="col-md-5 mt-5">
                    <c:forEach items="${requestScope.listImage}" var="image" varStatus="track">
                        <div class="mySlides">
                            <div class="numbertext">${track.count} / ${listImage.size()}</div>
                            <img src="images/${image.imageName}" class="w-100">
                        </div>
                    </c:forEach>

                    <!-- Next and previous buttons -->
                    <a class="prevs" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="nexts" onclick="plusSlides(1)">&#10095;</a>


                    <!-- Thumbnail images -->
                    <div class="row-image">
                        <c:forEach items="${requestScope.listImage}" var="image" varStatus="track">
                            <div class="column" >
                                <img class="demo cursor w-100" src="images/${image.imageName}" onclick="currentSlide(${track.count})">
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-md-6 pl-5">
                    <h3 class="mt-5">${requestScope.product.name}
                        <c:if test="${product.status ne 1}">
                            <sup>
                                <span class="badge badge-success">
                                    <%--<c:if test="${product.status eq 1}">Selling</c:if>--%>
                                    <c:if test="${product.status eq 2}">Sale</c:if>
                                    <c:if test="${product.status eq 3}">freeShip</c:if>
                                    <c:if test="${product.status eq 4}">Out of Stock</c:if>
                                    <c:if test="${product.status eq 5}">Stop bussiness</c:if>
                                    </span>
                                </sup>
                        </c:if>
                    </h3>
                    <p class="my-0"><b style="font-size: 25px;color: #f60"><fmt:formatNumber type="currency" value="${product.price}"/></b><c:if test="${product.status eq 2}"><span class="ml-3" style="font-size: 20px; color: rgb(153, 153, 153)"><strike><fmt:formatNumber type="currency" value="${Math.round(product.price*(1+product.sale)*100)/100}"/> </strike></span></c:if></p>
                        <hr/>
                        <h6 class="mt-5"><b>Mã sản phẩm:  ${requestScope.product.code}</b></h6>
                    <hr/>
                    <p class="mt-4"><b>Mô tả sản phẩm:</b></br></br>${requestScope.product.description}</p>
                    <hr/>
                    <a href="add-to-cart?id=${requestScope.product.id}" class="btn btn-outline-danger w-50 mt-4"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                    <a href="checkout" class="btn btn-outline-success w-25 mt-4 ml-2">Mua hàng<i class="fas fa-money-check-alt ml-2" style="color: green"></i></a>
                </div>
            </div>
        </div>
        <div class="fb-comments" data-href="https://localhost:8080/HousewareShop/detail?id=param.${product.id}" data-numposts="10" data-width="500px"></div>
        <%@include file="../component/footer.jsp" %>
        <script src="js/gallery.js" type="text/javascript"></script>
    </body>
</html>
