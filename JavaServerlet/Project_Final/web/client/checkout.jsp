<%-- 
    Document   : checkout
    Created on : Oct 22, 2021, 6:41:32 PM
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
        <div class="container" style="margin-top: 5rem">
            <div class="row">
                <div class="col-md-8" style="border: 1px solid #ced4da;border-radius: 5px !important">
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
                <div class="col-md-4 pl-5" style="border: 1px solid #ced4da;border-radius: 5px !important;">
                    <h3 class="mt-3" style="color: orange">Infomation of Customer</h3>
                    <div class="card mt-3">
                        <div class="card-body">
                            <form action="checkout" method="POST">
                                <div class="form-group">
                                    <label for="name">Họ và tên</label>
                                    <input type="text" name="name" class="form-control" placeholder="Enter name"
                                           required="">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                        anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="sdt">Số điện thoại</label>
                                    <input type="number" name="phone" class="form-control" placeholder="enter phone number"
                                           required="">
                                </div>
                                <div class="form-group">
                                    <label for="address">Đia chỉ</label>
                                    <textarea class="form-control" rows="3" name="address" required=""></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="address">Ghi chú</label>
                                    <textarea class="form-control" rows="3" name="note"></textarea>
                                </div>

                                <button type="submit" class="btn btn-success w-100">Accept</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>

