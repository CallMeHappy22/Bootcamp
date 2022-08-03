<%-- 
    Document   : navbar
    Created on : Oct 7, 2019, 8:27:24 PM
    Author     : ThinkPro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    <c:if test="${sessionScope.account != null}">
        .btn-group:hover>.dropdown-menu {
            display: block;
        }
    </c:if>
    .btn-group{
        margin: auto;
    }
    #login{
        border-top-right-radius: .25rem !important;
        border-bottom-right-radius: .25rem !important;
    }
    .btn-outline-warning{
        color: white;
        border-color: none;
    }
    .btn-outline-warning:hover{
        color: white;
        background-color: #00ACE9;
    }
</style>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style="height: 4rem; opacity: .9; background-color: #404040 !important">
    <a class="navbar-brand" href="http://localhost:8080/HousewareShop/home">HouseWareShop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <div class="navigationDesktop ml-5">
            <nav class="nav">
                <ul>
                    <li><a class="link btn btn-outline-warning" style="background-color:  #404040; border-color: #404040 !important;color: white;margin-top: -2px;" href="http://localhost:8080/HousewareShop/sort-product">Sản phẩm</a>
                        <ul>
                            <c:forEach items="${listCategory}" var="C">
                                <li class="sublink">
                                    <a class="link" href="http://localhost:8080/HousewareShop/filter?id=${C.getId()}">
                                        ${C.getCategory()}
                                        <ul>
                                            <c:forEach items="${C.getListSubCategory()}" var="subC">
                                                <li class="sublink"><a class="link" href="http://localhost:8080/HousewareShop/filter?cid=${subC.getId()}">${subC.getSubCategoryName()}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>

        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="btn btn-outline-warning ml-5" style="border-color: #404040 !important;font-size: 13pt" href="http://localhost:8080/HousewareShop/get-list-sale">Sản phẩm khuyến mại</i></a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-warning ml-5" style="border-color: #404040 !important;font-size: 13pt" target="blank" href="https://www.facebook.com/messages/t/104322675244422">Liên hệ</i></a>
            </li>
        </ul>


        <form target="_self" id="frm" action="http://localhost:8080/HousewareShop/search" method="get" onchange="this.form.submit()">
            <div class="search-box">
                <input class="search-txt" name="inputSearch" type="text" placeholder="Type to search">
                <input type="hidden" value="${page}" name="page">
                <a href="#" class="search-btn">
                    <i class="fas fa-search text-center" style="margin-top:12px;color: white"></i>
                </a>
            </div>
        </form>
        <ul class="navbar-nav ml-auto mr-2">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle mr-5" href="#" id="navbarDropdown" style="color: green; font-size: 2.5rem" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-cart-plus mr-2" style="color: #e9ecef; font-size: 2.5rem"></i><c:if test="${sessionScope.listCart.size() ne 0}"><sup style="color: #fcae00 !important">${sessionScope.listCart.size()}</sup></c:if>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:choose>
                        <c:when test="${sessionScope.listCart eq null||sessionScope.listCart.size()==0}">
                            <span class="mx-3">Giỏ hàng trống</span>
                        </c:when>
                        <c:otherwise>
                            <div class="popup-list-cart">
                                <table>
                                    <c:forEach items="${sessionScope.listCart}" var="cart">
                                        <tr>
                                            <td class="px-2"><img src="images/${cart.productImg}"></td>
                                            <td class="f-small"><a href="detail?id=${cart.productId}">${cart.productName}</a></td>
                                            <td class="px-3 f-small">x ${cart.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="get-list-cart">Xem giỏ hàng</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>

            <!-- Example single danger button -->
            <div class="btn-group">
                <c:if test="${sessionScope.account eq null}">
                    <a id="login" class="nav-link btn btn-outline-primary ml-2 mr-1" style="margin: auto" href="http://localhost:8080/HousewareShop/login">
                        Đăng nhập
                        <i class="fas fa-user-plus ml-2"></i>
                    </a>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a class="nav-link btn btn-outline-primary mt-2 ml-2" href="http://localhost:8080/HousewareShop/home">
                        ${sessionScope.account.displayName}
                        <i class="fas fa-user-plus ml-2"></i>
                    </a>
                </c:if>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="http://localhost:8080/HousewareShop/my-profile">Thông tin cá nhân</a>
                    <a class="dropdown-item" href="http://localhost:8080/HousewareShop/my-profile" onclick="openOrder()">Đơn hàng</a>
                    <a class="dropdown-item" href="#">Lịch sử mua hàng</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="http://localhost:8080/HousewareShop/logout">Đăng xuất</a>
                </div>
            </div>
        </ul>
    </div>
</nav>
