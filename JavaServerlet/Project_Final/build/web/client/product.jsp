<%-- 
    Document   : product
    Created on : Oct 9, 2021, 2:52:58 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <!-- Show list category -->
                <div class="col-md-2">
                    <h5 class="labelhead">
                        <div class="alert alert-success" role="alert">
                            Category
                        </div>
                    </h5>
                    <div class="category">
                        <a href="#" class="pt-3" style="color: #d71e1e; font-size: 20px">All
                            Product</a>

                        <c:forEach items="${listCategories}" var="category" >
                            <a class="pt-4" href="filter?categoryId=${category.id}"
                               style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">${category.categoryName}</a>
                            <c:forEach items="${category.getListSubCategories()}" var="subCategory">
                                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Hand Tools">
                                    <a class="pl-3 subCategory" href="filter?subCategoryId=${subCategory.id}">
                                        <li>${subCategory.subCategoryName}</li>
                                    </a>
                                </span>
                            </c:forEach>
                        </c:forEach>



                    </div>
                </div>
                <!-- end -->
                <!-- Show list product -->

                <div class="col-md-10">
                    <h5 class="labelhead"></h5>
                    <div class="alert alert-secondary" role="alert">
                        <form onchange="submitForm()" id="combo" action="#">List of products
                            <i class="fas fa-cubes mr-2 ml-4"></i><a href="#"
                                                                     class="btn btn-outline-warning" style="color: #ff0707"> Best Match</a>
                            <i class="fas fa-filter mr-2 ml-4"></i><a href="#"
                                                                      class="btn btn-outline-primary">Random</a>
                            <i class="fas fa-dollar-sign mr-2 ml-4"></i>
                            <select name="price" style="font-size: 1rem">
                                <option value="-1">Price</option>
                                <option value="0">0$-5%</option>
                                <option value="1">5$-10$</option>
                                <option value="2">10$-15$</option>
                                <option value="3">15$-20$</option>
                                <option value="4">&gt;20$</option>
                            </select>
                            <i class="fas fa-sort-down mr-2 ml-4"></i><a href="#"
                                                                         class="btn btn-outline-info">new</a>
                            <i class="fas fa-bolt mr-2 ml-4"></i><a href="#"
                                                                    class="btn btn-outline-success">free ship</a>
                            <a href="#" style="color: orange"><i class="fas fa-sort ml-5"></i></a>
                        </form>
                    </div>

                    <%@include file="../components/pagging.jsp" %>

                    <div class="row mb-5">
                        <!-- Show product -->
                        <c:if test="${listProducts==null||listProducts.size()==0}"><h3>Not found</h3></c:if>
                        <c:forEach items="${listProducts}" var="product">
                            <div class="col-md-3 mt-4 pt-2">
                                <div class="card">
                                    <c:if test="${product.sale != 0}">
                                        <div id="DIV_1">
                                            <span id="SPAN_2">11</span>
                                        </div>
                                    </c:if>



                                    <a href="detail?productId=${product.id}"><img src="static/images/${product.imageUrl}" style="border: 1px solid #ededed;"
                                                                                  class="card-img-top pt-4" alt="..."></a>
                                    <div class="card-body pt-3">
                                        <a href="add-to-cart?productId=${product.id}" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                            cart</a>
                                        <a href="detail?productId=${product.id}" class="card-title text-center mb-1 mt-2">${product.name}</a>
                                        <p class="text-center my-0" style="color: #f60">$${product.price}</p>
                                        <!--                                        <p class="text-center my-0">
                                                                                                <fmt:formatNumber value="9.27" type="currency"></fmt:formatNumber>
                                                                                            </p>-->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                    <%@include file="../components/pagging.jsp" %>

                </div>
                <!--end -->
            </div>
        </div>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>
