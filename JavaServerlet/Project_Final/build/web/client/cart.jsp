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
        <div class="container" style="margin-top: 7rem">


            <c:choose>
                <c:when test="${carts==null||carts.size()==0}">
                    <div class="alert alert-danger" role="alert">
                        Giỏ hàng trống
                    </div>
                    <div><a href="products" class="btn btn-outline-success">Mua hàng ngay...</a></div>
                </c:when>
                <c:otherwise>
                    <div class="mt-3">
                        <h4>Shopping Cart</h4>

                        <form id="formQuantity" action="update-cart" method="get">

                            <!--                    <span style="display: none">16.61</span><span style="display: none">25.88</span><span
                                                    style="display: none">34.48</span><span style="display: none">40.41</span><span
                                                    style="display: none">55.769999999999996</span>-->

                            <table class="w-100 table table-striped mt-3">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${carts}" var="cart" varStatus="track">
                                        <tr>
                                            <td>${track.count}</td>
                                            <td>
                                                <img src="static/images/${cart.value.product.imageUrl}" style="width: 100px">
                                            </td>
                                            <td>${cart.value.product.name}</td>
                                            <td>
                                                $${cart.value.product.price}
                                            </td>
                                            <td>
                                                <input onchange="this.form.submit()" type="number" min="1" max="${cart.value.product.quantity}" class="pl-1" name="quantity${cart.value.product.id}" value="${cart.value.quantity}"
                                                       style="width: 60px">
                                            </td>
                                            <td>
                                                $${cart.value.product.price * cart.value.quantity}
                                            </td>
                                            <td>
                                                <a href="cart-delete?productId=${cart.value.product.id}" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>



                            <hr>
                            <div class="text-right">
                                <h4>Tổng tiền:$${totalMoney}</h4>
                            </div>
                            <hr>
                            <div class="text-right">
                                <a href="cart-delete?productId=-1" class="btn btn-danger"><i class="fas fa-trash mr-2"></i>Delete
                                    Cart</a>

                                <!--                                <button type="submit" class="btn btn-info ml-2"><i class="fas fa-sync-alt mr-2"></i>Update Cart</button>-->
                                <a href="checkout" class="btn btn-success ml-2">Continue
                                    <i class="fas fa-arrow-right ml-2"></i>
                                </a>
                            </div>
                        </form>

                    </div>
                </c:otherwise>
            </c:choose>


        </div>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
