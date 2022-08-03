<%-- 
    Document   : cart
    Created on : Oct 21, 2019, 8:32:48 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <title>Giỏ hàng</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container" style="margin-top: 7rem">
            <c:choose>
                <c:when test="${sessionScope.listCart eq null || sessionScope.listCart.size()==0}">
                    <div class="text-center">
                        <h4>Giỏ hàng trống</h4>
                        <a href="sort-product" class="btn btn-success mt-2">Mua sắm ngay</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="mt-3">
                        <h4>Giỏ hàng</h4>
                        <form id="formQuantity" action="sync-cart" method="get" onload="this.form.submit()">
                            <c:set var="totalPrice" value="0" scope="page"></c:set>
                                <table class="w-100 table table-striped mt-3">
                                    <thead>
                                        <tr><th>#</th>
                                            <th>Ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.listCart}" var="cart" varStatus="track">
                                        <tr>
                                            <td>${track.count}</td>
                                            <td>
                                                <img src="images/${cart.productImg}" style="width: 100px">
                                            </td>
                                            <td>${cart.productName}</td>
                                            <td>
                                                <fmt:formatNumber type="currency" value="${cart.productPrice}"/>
                                            </td>
                                            <td>
                                                <input type="number" min="1" max="${cart.productQuantity}" onchange="this.form.submit()" class="pl-1" name="quantity${track.count}" value="${cart.quantity}" style="width: 60px"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber type="currency" value="${cart.productPrice * cart.quantity}"/>
                                            </td>
                                            <td>
                                                <a href="remove-product?flag=1&id=${cart.productId}" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    <span style="display: none">${totalPrice=totalPrice+(cart.productPrice * cart.quantity)}</span>
                                </c:forEach>

                                </tbody>
                            </table>
                            <hr/>
                            <div class="text-right">
                                <h4>Tổng tiền : <fmt:formatNumber type="currency" value="${totalPrice}"/></h4>
                            </div>
                            <hr/>
                            <div class="text-right">
                                <a href="remove-product?flag=0" class="btn btn-danger"><i class="fas fa-trash mr-2"></i>Xóa giỏ hàng</a>
                                <a href="checkout" class="btn btn-success ml-2">Tiếp tục
                                    <i class="fas fa-arrow-right ml-2"></i>
                                </a>
                            </div>
                        </form>
                    </div>
                </c:otherwise>   
            </c:choose>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>
