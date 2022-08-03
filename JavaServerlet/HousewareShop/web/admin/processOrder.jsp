<%-- 
    Document   : processOrder
    Created on : Nov 9, 2019, 1:41:20 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Tables</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">

        <style>
            /*Full-width input fields*/ 
            .text{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

        </style>

    </head>

    <body id="page-top">

        <%@include file="../component/navbarAdmin.jsp" %>

        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="../component/menuAdmin.jsp" %>

            <div id="content-wrapper">

                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item">Quản Lý Đơn Hàng</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            ${nametable}</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th>Trạng thái</th>
                                                <c:if test="${status lt 4}">
                                                <th>Xác nhận đơn hàng</th>
                                                <th>Xóa đơn hàng</th>
                                                </c:if>
                                            <th>Tổng tiền</th>
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listOrderWatting}" var="order">
                                            <tr>
                                                <td>${order.id}</td>
                                                <td>${order.createDate}</td>
                                                <td>${order.getShipping().name}</td>
                                                <td>${order.getShipping().phone}</td>
                                                <td>${order.getShipping().address}</td>
                                                <td <c:if test="${order.status ne 1}">style="color: orange"</c:if>>${order.getStatusOrder().status}</td>
                                                <c:if test="${status lt 4}">
                                                    <td><a href="accept-order?id=${order.id}&status=${status}" class="btn btn-outline-info">Xác nhận</a></td>
                                                    <td><a  href="delete-order?id=${order.id}&status=${status}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Xóa</a></td>
                                                </c:if>
                                                <td class="money"><fmt:formatNumber type="currency" value="${order.totalPrice}"/></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <c:if test="${status == 4 || status == 5}">
                                        <tfoot>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td id="doanhThu">Doanh thu: 1000000</td>
                                            </tr>
                                        </tfoot>
                                    </c:if>
                                </table>

                            </div>
                        </div>
                        <div class="card-footer small text-muted">Lần cuối sửa đổi 11:59 PM</div>
                    </div>

                    <p class="small text-center text-muted my-5">
                        <em>Các thống kê khác sẽ có ở phiên bản sau...</em>
                    </p>

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Your Website 2019</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>

        <script>
                                                        function calRevenue() {
                                                            var listMoney = document.querySelectorAll('tbody .money');
                                                            let total = 0;
                                                            for (let row of listMoney) {
                                                                total += parseFloat(row.innerHTML);
                                                            }
                                                            document.getElementById('doanhThu').innerHTML = "Doanh thu: " + total;
                                                        }
                                                        $('#dataTable').on('draw.dt', function () {
                                                            var listMoney = document.querySelectorAll('tbody .money');
                                                            let total = 0;
                                                            for (let row of listMoney) {
                                                                let str = row.innerHTML;
                                                                str = str.replace(".", "");
                                                                str = str.replace(" đ", "");
                                                                total += parseFloat(str);
                                                            }
                                                            let result = total.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                                                            result = result.replace("VND", "đ")
                                                            document.getElementById('doanhThu').innerHTML = "Doanh thu: " + result;
                                                        });
        </script>
    </body>
</html>
