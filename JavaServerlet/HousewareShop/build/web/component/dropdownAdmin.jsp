<%-- 
    Document   : dropdownAdmin
    Created on : Nov 4, 2019, 9:46:28 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-fw fa-folder"></i>
        <span>Thêm Mới</span>
    </a>
    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
        <h6 class="dropdown-header">Thêm:</h6>
        <a onclick="addProduct();" class="dropdown-item">Sản Phẩm</a>
        <a onclick="addCategory();" class="dropdown-item">Danh Mục</a>
        <a onclick="addSubCategory();" class="dropdown-item">Danh Mục Con</a>
        <a onclick="addAccount();" class="dropdown-item">Tài Khoản</a>
        <div class="dropdown-divider"></div>
        <h6 class="dropdown-header"></h6>
    </div>
</li>
<%@include file="../component/ModalAddProduct.jsp" %>
<%@include file="../component/ModalAddCategory.jsp" %>
<%@include file="../component/ModalAddSubCategory.jsp" %>
<%@include file="../component/ModalAddAccount.jsp" %>
<script>
    function addProduct() {
        $(document).ready(function () {
            $('#modalAddProduct').modal('show');
        });
    }
    function addCategory() {
        $(document).ready(function () {
            $('#modalAddCategory').modal('show');
        });
    }
    function addSubCategory() {
        $(document).ready(function () {
            $('#modalAddSubCategory').modal('show');
        });
    }
    function addAccount() {
        $(document).ready(function () {
            $('#modalAddAccount').modal('show');
        });
    }
</script>
