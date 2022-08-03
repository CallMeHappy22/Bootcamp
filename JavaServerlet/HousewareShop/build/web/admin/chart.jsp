<%-- 
    Document   : chart
    Created on : Nov 10, 2019, 11:07:55 AM
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

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.min.css" rel="stylesheet">
        <style>
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
                        <li class="breadcrumb-item active">Biểu Đồ</li>
                    </ol>

                    <!-- Area Chart Example-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-area"></i>
                            Thống kê số lượng hóa đơn trong tuần</div>
                        <div class="card-body">
                            <canvas id="myAreaChart" width="100%" height="30"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Lần cuối sửa đổi 11:59 PM</div>
                    </div>

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar"></i>
                                    Doanh thu 6 tháng gần đây</div>
                                <div class="card-body">
                                    <canvas id="myBarChart" width="100%" height="50"></canvas>
                                </div>
                                <div class="card-footer small text-muted">Lần cuối sửa đổi 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie"></i>
                                    Thống kê danh mục</div>
                                <div class="card-body">
                                    <canvas id="myPieChart" width="100%" height="100"></canvas>
                                </div>
                                <div class="card-footer small text-muted">Lần cuối sửa đổi 11:59 PM</div>
                            </div>
                        </div>
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
                            <span>Copyright © HousewareShop 2019</span>
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
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
            // Area Chart Example
            var ctx = document.getElementById("myAreaChart");
            var myLineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [${thu}],
                    datasets: [{
                            label: "Sessions",
                            lineTension: 0.3,
                            backgroundColor: "rgba(2,117,216,0.2)",
                            borderColor: "rgba(2,117,216,1)",
                            pointRadius: 5,
                            pointBackgroundColor: "rgba(2,117,216,1)",
                            pointBorderColor: "rgba(255,255,255,0.8)",
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgba(2,117,216,1)",
                            pointHitRadius: 50,
                            pointBorderWidth: 2,
                            data: [${data}],
                        }],
                },
                options: {
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 7
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: 20,
                                    maxTicksLimit: 4
                                },
                                gridLines: {
                                    color: "rgba(0, 0, 0, .125)",
                                }
                            }],
                    },
                    legend: {
                        display: false
                    }
                }
            });
        </script>

        <script>
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [${label}],
                    datasets: [{
                            data: [${soluong}],
                            backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                        }],
                },
            });
        </script>
        <script>
            // Bar Chart Example
            var ctx = document.getElementById("myBarChart");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["July", "August", "September", "October", "November", "December"],
                    datasets: [{
                            label: "Revenue",
                            backgroundColor: "rgba(2,117,216,1)",
                            borderColor: "rgba(2,117,216,1)",
                            data: [1200, 1800, 900, 600,${revenue}, 800],
                        }],
                },
                options: {
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'month'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 6
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: 3000,
                                    maxTicksLimit: 5
                                },
                                gridLines: {
                                    display: true
                                }
                            }],
                    },
                    legend: {
                        display: false
                    }
                }
            });
        </script>



    </body>
</html>
