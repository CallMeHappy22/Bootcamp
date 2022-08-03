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
        <!--<link href="css/newcss.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/admin.css" rel="stylesheet" type="text/css"/>
        <style>
            .btn-group:hover >.dropdown-menu{
                display: block;
                padding: 1px !important;
            }
            .btn-grop:hover >.add{
                padding: 1px !important;
            }
            .imageDetail img{
                width: 11%;
                margin-left: 4.8%;
                opacity: .5;
            }
            .imageDetail img:hover{
                border: 1px solid red;
                opacity: 1;
            }
        </style>
        <title>Admin-Page</title>
    </head>
    <body>
        <%--<%@include file="../component/navbar.jsp" %>--%>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="http://localhost:8080/HousewareShop/home"><i class="fas fa-home mr-2"></i>Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle mr-2"></i> ${account.displayName}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">My profile</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="http://localhost:8080/HousewareShop/logout">Logout</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>



        <div class="container-fluid mt-2">


            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'dashboard')" id="defaultOpen"><i class="fas fa-tachometer-alt mr-2"></i>DashBoard</button>
                <div class="btn-group w-100 dropright">
                    <button id="Product" class="tablinks" onclick="openCity(event, 'product')"><i class="fas fa-tasks mr-2"></i>Product</button>
                    <div class="dropdown-menu">
                        <!--                    <a class="dropdown-item" href="add-product">Add Product</a>-->
                        <button class="btn btn-outline-success dropdown-item" onclick="document.getElementById('id01').style.display = 'block'"><i class="fas fa-plus-circle mr-2"></i>Add New Product</button>
                        <div class="dropdown-divider"></div>
                        <a class="btn btn-danger dropdown-item" href="http://localhost:8080/HousewareShop/admin-manager"><i class="fas fa-retweet mr-2"></i>Refresh</a>
                    </div>
                </div>
                <div id="id01" class="modal">

                    <form class="modal-content animate" action="add-product" method="post" enctype="multipart/form-data">
                        <div class="imgcontainer">
                            <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                            <h4 class="text-center" style="color: orange"><i class="fab fa-product-hunt mr-2"></i>Add new Product</h4>
                        </div>

                        <input type="hidden" name="id" value="${product.id}">

                        <div class="container">
                            <label for="code"><b>Code of product</b></label>
                            <input type="text" placeholder="Enter code of product" name="code" value="${product.code}" required>

                            <label for="name"><b>Name of Product</b></label>
                            <input type="text" placeholder="Enter name of product" name="name" value="${product.name}" required>


                            <label for="image" ><b>Images Product</b></label>
                            <input type="file" name="filename" value="${product.image}" class="form-control-file" multiple><br>

                            <div class="form-group">
                                <label for="exampleFormControlSelect1"><b>Category</b></label>
                                <select class="form-control" name="subCategory" id="exampleFormControlSelect1">
                                    <c:forEach items="${listSubCategory}" var="subCategory">
                                        <option value="${subCategory.id}">${subCategory.subCategoryName}</option>
                                    </c:forEach>
                                </select>

                            </div>


                            <div class="form-group">
                                <label for="quantity"><b>Quantity of product</b></label>
                                <input class="form-control" type="number" placeholder="Enter quantity of product" name="quantity" value="${product.quantity}" required>
                            </div>
                            <div class="form-group">
                                <label for="price"><b>Price of Product</b></label>
                                <input class="form-control" type="number" placeholder="Enter price of product" name="price" value="${product.price}" step="0.01" required>
                            </div>

                            <div class="form-group">
                                <label for="status"><b>status of Product</b></label>
                                <select class="form-control" name="status"id="exampleFormControlSelect1">
                                    <c:forEach items="${listStatusProduct}" var="statusProduct">
                                        <option <c:if test="${statusProduct.id eq product.status}">selected</c:if> value="${statusProduct.id}">${statusProduct.status}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"><b>Description of Product</b></label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" value="${product.description}">${product.description}</textarea>
                            </div>

                            <input class="btn btn-outline-success" style="width: 55%" type="submit" value="Add Product">
                            <input  onclick="document.getElementById('id01').style.display = 'none'" class="btn btn-outline-danger ml-2" style="width: 44%" type="button" value="Cancel">
                        </div>
                    </form>
                </div>




                <button class="tablinks" onclick="openCity(event, 'category')"><i class="fas fa-tasks mr-2"></i>Category</button>
                <button class="tablinks" onclick="openCity(event, 'subCategory')"><i class="fas fa-tasks mr-2"></i>SubCategory</button>
                <button class="tablinks" onclick="openCity(event, 'account')"><i class="fas fa-user mr-2"></i>Account</button>
            </div>

            <div id="dashboard" class="tabcontent">
                <h3>London</h3>
                <p>London is the capital city of England.</p>

            </div>

            <div id="product" class="tabcontent">

                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">NAME</th>
                            <th scope="col">IMAGE</th>
                            <th scope="col">Detail</th>
                            <th scope="col">DELETE</th>
                            <th scope="col">EDIT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProduct}" var="product">
                            <tr>
                                <th scope="row">${product.id}</th>
                                <td>${product.name}</td>
                                <td><img src="images/${product.image}" style="border: 1px solid #ededed; width: 50px; height: 50px"</td>
                                <td><a href="view-product?id=${product.id}" class="btn btn-outline-success">Detail</a></td>
                                
                                <td><button onclick="document.getElementById('idp${product.id}').style.display = 'block'" class="btn btn-outline-warning">Edit</button>

                                    <div id="idp${product.id}" class="modal">
                                        <form class="modal-content animate" action="edit-product" method="post" style="width: 70%" enctype="multipart/form-data">
                                            <div class="imgcontainer">
                                                <span onclick="document.getElementById('idp${product.id}').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                                <h3 style="color: #ffa500a1"><i class="fas fa-info-circle"></i>Infomation of Product</h3>
                                            </div>

                                            <input type="hidden" name="id" value="${product.id}">

                                            <div class="container">
                                                <label for="code"><b>Code of product</b></label>
                                                <input type="text" placeholder="Enter code of product" name="code" value="${product.code}" required>

                                                <label for="name"><b>Name of Product</b></label>
                                                <input type="text" placeholder="Enter name of product" name="name" value="${product.name}" required>


                                                <label for="image" ><b>Images Product</b></label><br>
                                                <span class="imageDetail">
                                                    <c:forEach items="${product.listImage}" var="image">
                                                        <img src="images/${image.imageName}" alt=""/>
                                                    </c:forEach>
                                                </span><br>
                                                <input type="file" name="fileName" class="form-control-file" multiple><br>
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect1"><b>Category</b></label>
                                                    <select class="form-control" name="subCategory"id="exampleFormControlSelect1">
                                                        <c:forEach items="${listSubCategory}" var="subCategory">
                                                            <option <c:if test="${subCategory.id eq product.subCategoryId }">selected</c:if> value="${subCategory.id}">${subCategory.subCategoryName}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>

                                                <input type="hidden" name="category" value="${product.categoryId}">

                                                <div class="form-group">
                                                    <label for="quantity"><b>Quantity of product</b></label>
                                                    <input class="form-control" type="number" placeholder="Enter quantity of product" name="quantity" value="${product.quantity}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price"><b>Price of Product</b></label>
                                                    <input class="form-control" type="number" placeholder="Enter price of product" name="price" value="${product.price}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="status"><b>status of Product</b></label>
                                                    <select class="form-control" name="status"id="exampleFormControlSelect1">
                                                        <c:forEach items="${listStatusProduct}" var="statusProduct">
                                                            <option <c:if test="${statusProduct.id eq product.status}">selected</c:if> value="${statusProduct.id}">${statusProduct.status}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="exampleFormControlTextarea1"><b>Description of Product</b></label>
                                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" value="${product.description}">${product.description}</textarea>
                                                </div>

                                                <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                                                <button onclick="document.getElementById('idp${product.id}').style.display = 'none'" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-trash mr-2"></i>Delete</button>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                                <td><form><a  href="delete-product?id=${product.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Delete</a><form</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>

            <div id="category" class="tabcontent">

                <!--coding here-->
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">SubId</th>
                            <th scope="col">Category</th>
                            <th scope="col">Status</th>
                            <th scope="col">DELETE</th>
                            <th scope="col">EDIT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCategory}" var="category">
                        
                            <tr>
                                <th scope="row">${category.id}</th>
                                <td>${category.category}</td>
                                <td>${category.getStatus(category.status).status}</td>


                                <td><button onclick="document.getElementById('idc${category.id}').style.display = 'block'" class="btn btn-outline-warning">Edit</button>

                                    <div id="idc${category.id}" class="modal">
                                        
                                        <form class="modal-content animate" action="edit-category" method="POST" style="width: 70%">
                                            <div class="imgcontainer">
                                                <span onclick="document.getElementById('idc${category.id}').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                                <h3 style="color: #ffa500a1"><i class="fas fa-info-circle"></i>Infomation of Category</h3>
                                            </div>

                                            <input type="hidden" name="id" value="${category.id}">

                                            <div class="container">
                                                <label for="code"><b>Name of category</b></label>
                                                <input type="text" placeholder="Enter name of subcategory" name="category" value="${category.category}" required>

                                                <div class="form-group">
                                                    <label for="status"><b>status of Category</b></label>
                                                    <select class="form-control" name="status"id="exampleFormControlSelect1">
                                                        <c:forEach items="${listStatusCategory}" var="statusCategory">
                                                            <option <c:if test="${statusCategory.code eq category.status}">selected</c:if> value="${statusCategory.id}">${statusCategory.status}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                                                <button onclick="document.getElementById('idc${category.id}').style.display = 'none'" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-window-close mr-2"></i></i>Cancel</button>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                                <td><a  href="delete-category?id=${category.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Delete</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>



                <!--end-->
            </div>

            <div id="subCategory" class="tabcontent">

                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">SubId</th>
                            <th scope="col">SubCategory</th>
                            <th scope="col">Category</th>
                            <th scope="col">Status</th>
                            <th scope="col">DELETE</th>
                            <th scope="col">EDIT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listSubCategory}" var="subCategory">
                            <tr>
                                <th scope="row">${subCategory.id}</th>
                                <td>${subCategory.subCategoryName}</td>
                                <td>${subCategory.getCategory(subCategory.categoryId).category}</td>
                                <td>${subCategory.getStatus(subCategory.status).status}</td>


                                <td><button onclick="document.getElementById('ids${subCategory.id}').style.display = 'block'" class="btn btn-outline-warning">Edit</button>

                                    <div id="ids${subCategory.id}" class="modal">
                                        <form class="modal-content animate" action="edit-subCategory" method="post" style="width: 70%" enctype="multipart/form-data">
                                            <div class="imgcontainer">
                                                <span onclick="document.getElementById('ids${subCategory.id}').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                                <h3 style="color: #ffa500a1"><i class="fas fa-info-circle"></i>Infomation of subCategory</h3>
                                            </div>

                                            <input type="hidden" name="id" value="${subCategory.id}">

                                            <div class="container">
                                                <label for="name"><b>Name of Subcategory</b></label>
                                                <input type="text" placeholder="Enter name of subcategory" name="name" value="${subCategory.subCategoryName}" required>
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect1"><b>Category</b></label>
                                                    <select class="form-control" name="subCategory"id="exampleFormControlSelect1">
                                                        <c:forEach items="${listCategory}" var="category">
                                                            <option <c:if test="${subCategory.categoryId eq category.id }">selected</c:if> value="${category.id}">${category.category}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                                <div class="form-group">
                                                    <label for="status"><b>status of Category</b></label>
                                                    <select class="form-control" name="status"id="exampleFormControlSelect1">
                                                        <c:forEach items="${listStatusSubCategory}" var="SubCategory">
                                                            <option <c:if test="${SubCategory.id eq subCategory.status}">selected</c:if> value="${SubCategory.id}">${SubCategory.status}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                                                <button onclick="document.getElementById('ids${product.id}').style.display = 'none'" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-window-close mr-2"></i></i>Cancel</button>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                                <td><a  href="delete-category?id=${subCategory.id}" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-outline-danger"><i class="fas fa-trash mr-2"></i>Delete</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>

            <div id="account" class="tabcontent">
                <h3>London</h3>
                <p>London is the capital city of England.</p>
            </div>

            <script>

                function openCity(evt, cityName) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " active";
                }

                // Get the element with id="defaultOpen" and click on it
                document.getElementById("defaultOpen").click();
                
                

            </script>
            <c:if test="${product!=null}">
                <script>
                $(document).ready(function (){
                    $('#myModal').modal('show');
                });
                </script>
                <%@include file="productModal.jsp" %>
            </c:if>
            
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/gallery.js" type="text/javascript"></script>

    </body>
</html>