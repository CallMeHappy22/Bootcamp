<%-- 
    Document   : checkout
    Created on : Oct 23, 2019, 8:53:58 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_US"/>
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
        <title>Check out</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container" style="margin-top: 5rem">
            <div class="row">
                <div class="col-md-7" style="border: 1px solid #ced4da;border-radius: 5px !important">
                    <form id="frmPaymentOnline" class="mt-5 mb-5" action="payment-online" method="post">
                        <input id="c-name" type="hidden" name="name" value="${name}">
                        <input id="c-mobile" type="hidden" name="mobile" value="${mobile}">
                        <input id="c-address" type="hidden" name="address" value="${address}">
                        <input id="c-note" type="hidden" name="note" value="${note}">
                        <h3 class="text-center">Nhập thông tin thanh toán</h3>
                        <div class="form-group">
                            <label for="numberCard">Số thẻ</label>
                            <input id="numberCard" type="number" name="numberCard" class="form-control" placeholder="Enter number card" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your number card with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="sdt">Tên in trên thẻ</label>
                            <input id="nameCard" type="text" name="nameCard" class="form-control" placeholder="Enter name" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your name with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="sdt">Ngày hết hạn</label>
                            <input id="dateExpire" type="date" name="dateExpire" class="form-control" placeholder="Enter date Expired" required>
                        </div>

                        <a onclick="submit()" class="btn btn-success w-100 text-white">Accept</a>
                    </form>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4 d-flex justify-content-center align-items-center" style="border: 1px solid #ced4da;border-radius: 5px !important; height: 5rem">
                    <h3>Total Money: <span class="text-success">$${totalPrice}</span></h3>
                </div>

            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
        <script>
            function submit() {
                let dateExpire = new Date(document.getElementById('dateExpire').value);
                let numberCard = document.getElementById('numberCard').value + '';
                let nameCard = document.getElementById('nameCard').value;
                if (dateExpire == 'Invalid Date' || !numberCard || !nameCard) {
                    alert('Các trường không được để trống');
                    return;
                }
                if (!numberCard.startsWith('9704') || numberCard.length != 19) {
                    alert('Số thẻ không hợp lệ');
                    return;
                }
                let now = new Date();

                if (dateExpire.getTime() - now.getTime() < 0) {
                    alert('Ngày bạn nhập phải lớn hơn ngày hiện tại');
                    return;
                }
//                else{
                document.getElementById('frmPaymentOnline').submit();
//                }

            }
        </script>
    </body>
</html>
