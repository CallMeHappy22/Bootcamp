<%-- 
   Document   : list-product
   Created on : Oct 2, 2019, 8:57:18 PM
   Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session"></fmt:setLocale>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <title>Hello, world!</title>
    </head>
    <body>

        <%@include file="../component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <!-- Show list category -->
                <div class="col-md-2">
                    <h5 class="labelhead">
                        <div class="alert alert-success" role="alert">
                            Danh Mục
                        </div>
                    </h5>
                    <div class="category">
                        <a href="filter?id=0&page=${page}" class="pt-3" style="color: #d71e1e; font-size: 20px">Tất Cả</a>
                        <c:forEach items="${requestScope.listCategory}" var="category">
                            <a class="pt-4" href="filter?id=${category.id}&page=${page}" style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">${category.category}</a>
                            <c:forEach items="${category.listSubCategory}" var="subCategory">
                                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${subCategory.subCategoryName}">
                                    <a class="pl-3 subCategory" href="filter?cid=${subCategory.id}&page=${page}"><li>${subCategory.subCategoryName}</li></a>
                                </span>
                            </c:forEach>
                        </c:forEach>
                    </div>
                </div>
                <!-- end -->
                <!-- Show list product -->

                <div class="col-md-10">
                    <h5 class="labelhead">
                        <div class="alert alert-secondary d-flex justify-content-between align-items-center" role="alert">
                            <span style="font-size: 18px;">Danh Sách Sản Phẩm</span> 
                            <form id="frm2" onchange="onChangeSubmit()" action="sort-product" method="post">
                                <input type="hidden" name="page" value="${page}">
                                <select name="price" style="font-size: 1rem; margin-right: 0.25rem">
                                    <option value="-1">Giá bán</option>
                                    <option value="0" <c:if test="${price ==0}">selected</c:if>>0 - 50.000đ</option>
                                    <option value="1" <c:if test="${price ==1}">selected</c:if>>50.000 - 100.000đ</option>
                                    <option value="2" <c:if test="${price ==2}">selected</c:if>>100.000 - 150.000đ</option>
                                    <option value="3" <c:if test="${price ==3}">selected</c:if>>150.000 - 200.000đ</option>
                                    <option value="4" <c:if test="${price ==4}">selected</c:if>>> 200.000đ</option>
                                    </select>
                                    <span>
                                        <input type="checkbox" name="news" ${news?"checked":""}>
                                    New</span>
                                <span>
                                    <input type="checkbox" name="free" ${free?"checked":""}>
                                    Free ship</span>
                            </form>
                        </div>
                        <%@include file="../component/navPagingbyCategory.jsp" %>
                        <div class="row mb-5">

                            <c:choose>
                                <c:when test="${requestScope.listProduct.size() == 0}">
                                    <div class="col-md-12 pt-5">
                                        <h5>No products found</h5>
                                    </div>
                                </c:when>
                                <c:otherwise>

                                    <c:forEach items="${requestScope.listProduct}" var="product">
                                        <!-- Show product -->

                                        <div class="col-md-3 mt-4 pt-2">
                                            <div class="card">
                                                <c:if test="${product.status==2}">
                                                    <div id="DIV_1">
                                                        <span id="SPAN_2">26</span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${product.status==3}">
                                                    <div id="DIV_1">
                                                        <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                                                    </div>
                                                </c:if>
                                                <a href="detail?id=${product.id}"><img src="images/${product.image}" style="border: 1px solid #ededed;" class="card-img-top pt-4" alt="..."></a>
                                                <div class="card-body pt-3">
                                                    <a href="add-to-cart?id=${product.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Thêm giỏ hàng</a>
                                                    <a href="detail?id=${product.id}" class="card-title text-center mb-1 mt-2" style="font-size: 14px">${product.name}</a>
                                                    <p class="text-center my-0" style="color: #f60"><fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber></p>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- end -->
                                    </c:forEach>

                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%@include file="../component/navPagingbyCategory.jsp" %>
                </div>
                <!--end -->
            </div>
        </div>

        <script>
            function submitForm()
            {
                document.getElementById("combo").submit();
            }
            function onChangeSubmit()
            {
                document.getElementById("frm2").submit();
            }
        </script>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
