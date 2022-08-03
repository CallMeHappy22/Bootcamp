<%-- 
    Document   : product
    Created on : Nov 3, 2019, 7:10:58 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <!--<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">-->
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <!--<link href="css/admin.css" rel="stylesheet" type="text/css"/>-->

        <style>
            * {
                box-sizing: border-box;
            }


            /*Hide the images by default*/ 
            .mySlides {
                display: none;
            }

            /*Add a pointer when hovering over the thumbnail images*/ 
            .cursor {
                cursor: pointer;
            }

            /*Next & previous buttons*/ 
            .prevs,
            .nexts {
                cursor: pointer;
                position: absolute;
                top: 40%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: white;
                font-weight: bold;
                font-size: 20px;
                border-radius: 0 3px 3px 0;
                user-select: none;
                -webkit-user-select: none;
            }

            /*Position the "next button" to the right*/ 
            .nexts {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /*On hover, add a black background color with a little bit see-through*/ 
            .prevs:hover,
            .nexts:hover {
                color: #0077ff!important
            }

            /*Number text (1/3 etc)*/ 
            .numbertext {
                color: #fff;
                font-size: 14px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }


            .row-image:after {
                content: "";
                display: table;
                clear: both;
            }

            /*Six columns side by side*/ 
            .column {
                margin-top: 5%;
                border-radius: 3px;
                border: 1px solid #ededed;
                float: left;
                width: 11%;
                margin-left: 4.8%
            }

            .column:hover{
                border: 1px solid red;
                width: 13%;
            }


            /*Add a transparency effect for thumnbail images*/ 
            .demo {
                opacity: 0.6;
            }

            .active,
            .demo:hover {
                opacity: 1;
            }

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
                            <a href="#">Trang Chủ</a>
                        </li>
                        <li class="breadcrumb-item active">Quản Lý Sản Phẩm</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Danh sách sản phẩm</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên</th>
                                            <th>Ảnh</th>
                                            <th>Chi tiết sản phẩm</th>
                                            <th>Thay đổi thông tin</th>
                                            <th>Xóa sản phẩm</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProduct}" var="product">
                                            <tr>
                                                <td>${product.id}</td>
                                                <td>${product.name}</td>
                                                <td><img src="images/${product.image}" style="border: 1px solid #ededed; width: 50px; height: 50px" alt=""/></td>
                                                <td><a href="detail-product?id=${product.id}" class="btn btn-outline-success">Chi tiết</a></td>
                                                <td><a href="edit-product?id=${product.id}" class="btn btn-outline-warning">Sửa</a></td>
                                                <td><a  href="delete-product?id=${product.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Xóa</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
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

        <c:if test="${productDetail!=null}">
            <script>
                $(document).ready(function () {
                    $('#myModal').modal('show');
                });
            </script>
            <%@include file="../component/ModalProduct.jsp" %>
        </c:if>
        <c:if test="${productEdit!=null}">
            <script>
                $(document).ready(function () {
                    $('#myModal2').modal('show');
                });
            </script>
            <%@include file="../component/ModalEditProduct.jsp" %>
        </c:if>
        <script src="js/gallery.js" type="text/javascript"></script>
    </body>
</html>
