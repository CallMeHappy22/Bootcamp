<%-- 
    Document   : prepareShipping
    Created on : Nov 7, 2019, 9:44:49 AM
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <title>Prepare shipping</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12 mt-5">
                    <div class="card" >
                        <div class="card-body mt-5" style="border: 1px solid #ced4da;border-radius: 5px">
                            <h4 style="color: orange">Danh sách sản phẩm</h4>
                            <table class="w-100 table mt-3">   
                                <tr>
                                    <th>#</th>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                </tr>
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
                                            ${cart.quantity}
                                        </td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${cart.productPrice * cart.quantity}"/>
                                        </td>
                                    </tr>
                                    <span style="display: none">${totalPrice=totalPrice+(cart.productPrice * cart.quantity)}</span>
                                </c:forEach>
                            </table>
                            <hr/>
                            <div class="text-right">
                                <h4>Tổng tiền:<fmt:formatNumber type="currency" value="${totalPrice}"/></h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mt-5"><a onclick="document.getElementById('inf').submit()" class="btn btn-outline-success ml-auto w-100">Thanh toán khi nhận hàng</a></div>
                            <div class="mt-3"><a  onclick="document.getElementById('address').style.display = 'block'" class="btn btn-outline-info ml-auto w-100">Thanh toán online</a></div>
                        </div>

                        <div class="col-md-9 mt-3">
                            <form id="inf" action="prepare-shipping" method="post" style="border: 1px solid #ced4da !important; border-radius: 5px !important"> 
                                <div class="card" >
                                    <div class="card-body">
                                        <h4 style="color: orange">Thông tin giao hàng</h4>
                                        <h6 style="overflow: visible !important">Sản phẩm sẽ được giao tới địa chỉ dưới đây</h6><br>
                                        <div>Họ và tên :<span class="ml-4"> <b>${shipping.name}</b><span></div>
                                                    <input id="c-name" type="hidden" name="name" value="${shipping.name}">
                                                    <input id="c-mobile" type="hidden" name="mobile" value="${shipping.phone}">
                                                    <input id="c-address" type="hidden" name="address" value="${shipping.address}">
                                                    <input id="c-note" type="hidden" name="note" value="${note}">
                                                    <div>Số điện thoại: <span class="ml-4">${shipping.phone}<span></div>
                                                                <div>Địa chỉ :  <span class="ml-4">${shipping.address}</span></div>
                                                                <div>Ghi chú:  <span class="ml-4">${note}</span></div>
                                                                </div>
                                                                </div>
                                                                </form>
                                                                </div>


                                                                </div>
                                                                <div class="row">

                                                                    <div class="col-md-3">

                                                                    </div>
                                                                    <div id="address" class="col-md-9 mt-5">
                                                                        <div class="card">
                                                                            <div class="card-body" style="border: 1px solid #ced4da;border-radius: 5px !important">
                                                                                <h4 class="mt-3" style="color: orange">Thanh toán online</h4>
                                                                                <div class="card mt-3">
                                                                                    <div class="card-body">
                                                                                        <form id="frmPaymentOnline" action="payment-online" method="get">
                                                                                            <input id="bank" type="hidden" value="" name="bank"/>
                                                                                            <div class="row">
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="VTB" onclick="handleClickATM('VTB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/VTB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="VCB" onclick="handleClickATM('VCB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/VCB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="SCB" onclick="handleClickATM('SCB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/ts/upload/b3/67/8d/2feb0c1f3f3ec9f38dd4d462883459be.png"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="EIB" onclick="handleClickATM('EIB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/EIB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="BIDV" onclick="handleClickATM('BIDV')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/BIDV.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="MB" onclick="handleClickATM('MB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/MB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="TCB" onclick="handleClickATM('TCB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/TCB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-2">
                                                                                                    <div class="card mt-3 mb-3" style="padding: 0 !important">
                                                                                                        <div class="card-body text-center" id="VPB" onclick="handleClickATM('VPB')" style="padding: 1px">
                                                                                                            <img width="100%" src="https://salt.tikicdn.com/assets/img/zalopaygw/VPB.jpg"/>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>

                                                                                            </div>

                                                                                            <a onclick="submitPaymentOnline()" class="btn btn-success w-100 text-white">Xác nhận</a>
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
                                                                <script>
                                                                    document.getElementById('address').style.display = 'none'
                                                                    let atm;
                                                                    function handleClickATM(id) {
                                                                        let listATM = ["VTB", "VCB", "SCB", "EIB", "BIDV", "MB", "TCB", "VPB"]
                                                                        atm = id;
                                                                        for (let element of listATM) {
                                                                            document.getElementById(element).style.border = 'none';
                                                                        }
                                                                        document.getElementById(id).style.border = '1px solid red';
                                                                    }
                                                                    function submitPaymentOnline() {
                                                                        if (!atm) {
                                                                            alert('please choose one ATM');
                                                                            return;
                                                                        }
                                                                        document.getElementById('bank').value = atm;
                                                                        let hiddenInputs = ["name", "mobile", "address", "note"];
                                                                        let form = document.getElementById('frmPaymentOnline');
                                                                        for (let e of hiddenInputs) {
                                                                            let hiddenInput = document.createElement("input");
                                                                            hiddenInput.type = "hidden";
                                                                            hiddenInput.name=e;
                                                                            hiddenInput.value = document.getElementById('c-'+e).value;
                                                                            form.appendChild(hiddenInput);
                                                                        }
                                                                        document.getElementById('frmPaymentOnline').submit();

                                                                    }
                                                                </script>
                                                                <%@include file="../component/footer.jsp" %>
                                                                </body>
                                                                </html>
