<%-- 
    Document   : menuAdmin
    Created on : Jun 27, 2021, 11:13:04 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="sidebar navbar-nav">
    <li class="nav-item ${path == "admin-manager" ? "active":""}">
        <a class="nav-link" href="admin-manager">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Trang Chủ</span>
        </a>
    </li>
    <li class="nav-item ${path == "product" ? "active":""}">
        <a class="nav-link" href="get-products">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Sản Phẩm</span></a>
    </li>
    <li class="nav-item ${path == "category" ? "active":""}">
        <a class="nav-link" href="get-categories">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Danh Mục</span></a>
    </li>
    <li class="nav-item ${path == "sub-category" ? "active":""}">
        <a class="nav-link" href="get-sub-category">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Danh Mục Con</span></a>
    </li>
    <li class="nav-item ${path == "account" ? "active":""}">
        <a class="nav-link" href="get-accounts">
            <i class="fas fa-users fa-fw"></i>
            <span>Tài Khoản</span></a>
    </li>

    <!--dropdown-->
    <%@include file="../component/dropdownAdmin.jsp" %>

    <li class="nav-item ${path == "chart" ? "active":""}">
        <a class="nav-link" href="get-charts">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Biểu Đồ</span></a>
    </li>
    <li class="nav-item ${path == "order" ? "active":""} dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Đơn Hàng</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">Đơn Hàng:</h6>
            <a href="process-order?status=1" class="dropdown-item">Chờ Xác Nhận</a>
            <a href="process-order?status=2" class="dropdown-item">Được Chấp Nhận</a>
            <a href="process-order?status=3" class="dropdown-item">Đang Vận Chuyển</a>
            <a href="process-order?status=4" class="dropdown-item">Thanh Toán Online</a>
            <a href="process-order?status=5" class="dropdown-item">Thành Công</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header"></h6>
        </div>
    </li>
</ul>
