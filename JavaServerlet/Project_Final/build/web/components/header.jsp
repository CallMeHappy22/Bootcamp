<%-- 
    Document   : header
    Created on : Oct 13, 2021, 7:07:49 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark"
     style="height: 4rem; opacity: .9; background-color: #404040 !important">
    <a class="navbar-brand" href="./home.html">HouseWareShop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="btn btn-outline-warning ml-5 " style="border: none;"
                   href="products">Products</i></a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-warning ml-5" style="border: none;"
                   href="#">Sale Items</i></a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-warning ml-5" style="border: none;"
                   href="#">Contact
                    Us</i></a>
            </li>
        </ul>


        <form target="_self" id="frm">
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
                <a class="nav-link dropdown-toggle mr-5" href="#" id="navbarDropdown"
                   style="color: green; font-size: 2.5rem" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-cart-plus mr-2" style="color: #e9ecef; font-size: 2.5rem"></i>
                    <c:if test="${sessionScope.carts!=null&&sessionScope.carts.size()!=0}">
                        <sup style="color: #fcae00 !important">${sessionScope.carts.size()}</sup>
                    </c:if>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <div class="popup-list-cart">
                        <table>
                            <tbody>
                                <c:forEach items="${sessionScope.carts}" var="cart">
                                    <tr>
                                        <td class="px-2"><img src="static/images/${cart.value.product.imageUrl}"></td>
                                        <td class="f-small"><a href="#">${cart.value.product.name}</a></td>
                                        <td class="px-3 f-small">x ${cart.value.quantity}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="carts">Xem giỏ hàng</a>
                </div>
            </li>

            <!-- Example single danger button -->
            <div class="btn-group">
                <c:choose>
                    <c:when test="${sessionScope.account==null}">
                        <a class="nav-link btn btn-outline-primary mt-2 ml-2"
                           href="login">
                            Đăng nhập
                            <i class="fas fa-user-plus ml-2"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link btn btn-outline-primary mt-2 ml-2"
                           href="#">
                            ${sessionScope.account.displayName}
                            <i class="fas fa-user-plus ml-2"></i>
                        </a>
                    </c:otherwise>
                </c:choose>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">My profile</a>
                    <a class="dropdown-item" href="#"
                       onclick="openOrder()">Orders</a>
                    <a class="dropdown-item" href="#">History</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout">Đăng xuất</a>
                </div>
            </div>
        </ul>
    </div>
</nav>
