<%-- 
    Document   : prepareShipping
    Created on : Oct 22, 2021, 7:07:40 PM
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
        <div class="container">
            <div class="row">
                <div class="col-md-12 mt-5">
                    <div class="card">
                        <div class="card-body mt-5" style="border: 1px solid #ced4da;border-radius: 5px">
                            <h4 class="mt-3">List of Product</h4>
                            <table class="w-100 table table-striped mt-3">
                                <tbody>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                    </tr>
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
                                                ${cart.value.product.quantity}
                                            </td>
                                            <td>
                                                $${cart.value.product.price * cart.value.quantity}
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <hr>
                            <div class="text-right">
                                <h4>Tổng tiền:$${totalMoney}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mt-5"><a onclick="document.getElementById('inf').submit()" class="btn btn-outline-success ml-auto w-100">Shipping
                                    to this address</a></div>
                            <div class="mt-3"><a onclick="document.getElementById('address').style.display = 'block'"
                                                 class="btn btn-outline-info ml-auto w-100">Shipping to another address</a></div>
                        </div>

                        <div class="col-md-9 mt-3">
                            <form id="inf" action="prepare-shipping" method="post"
                                  style="border: 1px solid #ced4da !important; border-radius: 5px !important">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 style="color: orange">Địa chỉ giao hàng</h4>
                                        <h6 style="overflow: visible !important">Sản phẩm sẽ được giao tới địa chỉ dưới đây</h6><br>
                                        <div>Họ và tên:<span class="ml-4"> <b>${name}</b><span></span></span></div>
                                        <input type="hidden" name="name" value="${name}">
                                        <input type="hidden" name="phone" value="${phone}">
                                        <input type="hidden" name="address" value="${address}">
                                        <input type="hidden" name="note" value="${note}">
                                        <div>Số điện thoại: <span class="ml-4">${phone}<span></span></span></div>
                                        <div>Địa chỉ: <span class="ml-4">${address}</span></div>
                                        <div>Ghi chú:  <span class="ml-4">${note}</span></div>
                                    </div>
                                </div>
                            </form>
                        </div>


                    </div>
                    <div class="row">

                        <div class="col-md-3">

                        </div>
                        <div id="address" class="col-md-9 mt-5" style="display: none;">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid #ced4da;border-radius: 5px !important">
                                    <h4 class="mt-3" style="color: orange">Infomation of Customer</h4>
                                    <div class="card mt-3">
                                        <div class="card-body">
                                            <form action="./thanks.html">
                                                <div class="form-group">
                                                    <label for="name">Full Name</label>
                                                    <input type="text" name="name" class="form-control"
                                                           placeholder="Enter name">
                                                    <small id="emailHelp" class="form-text text-muted">We'll never share
                                                        your email with anyone else.</small>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sdt">Phone number</label>
                                                    <input type="number" name="mobile" class="form-control"
                                                           placeholder="enter phone number">
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Address</label>
                                                    <textarea class="form-control" rows="3" name="address"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Note</label>
                                                    <textarea class="form-control" rows="3" name="note"></textarea>
                                                </div>

                                                <button type="submit" class="btn btn-success w-100">Accept</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
