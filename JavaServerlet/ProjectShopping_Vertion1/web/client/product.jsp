<%-- 
    Document   : product
    Created on : Jul 31, 2022, 11:21:15 AM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark"
        style="height: 4rem; opacity: .9; background-color: #404040 !important">
        <a class="navbar-brand" href="./home.html">HouseWareShop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="btn btn-outline-warning ml-5 " style="border: none;"
                        href="./listProduct.html">Products</i></a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-warning ml-5" style="border: none;" href="#">Sale Items</i></a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-warning ml-5" style="border: none;" href="#">Contact
                        Us</i></a>
                </li>
            </ul>


            <form target="_self" id="frm">
                <div class="search-box">
                    <input class="search-txt" name="inputSearch" type="text" placeholder="Type to search">
                    <input type="hidden" value="${page}" name="page">
                    <a href="#" class="search-btn">
                        <i class="fas fa-search text-center" style="margin-top:12px;color: white"></i>
                    </a>
                </div>
            </form>
            <ul class="navbar-nav ml-auto mr-2">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle mr-5" href="#" id="navbarDropdown"
                        style="color: green; font-size: 2.5rem" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-cart-plus mr-2" style="color: #e9ecef; font-size: 2.5rem"></i>
                        <sup style="color: #fcae00 !important">5</sup>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <div class="popup-list-cart">
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="px-2"><img src="static/images/tools/1_0.jpg"></td>
                                        <td class="f-small"><a href="#">Repair Tool</a></td>
                                        <td class="px-3 f-small">x 1</td>
                                    </tr>

                                    <tr>
                                        <td class="px-2"><img src="static/images/tools/2_0.jpg"></td>
                                        <td class="f-small"><a href="#">Measure Tools</a></td>
                                        <td class="px-3 f-small">x 1</td>
                                    </tr>

                                    <tr>
                                        <td class="px-2"><img src="static/images/tools/3_0.jpg"></td>
                                        <td class="f-small"><a href="#">Manual Screw</a></td>
                                        <td class="px-3 f-small">x 1</td>
                                    </tr>

                                    <tr>
                                        <td class="px-2"><img src="static/images/tools/4_0.jpg"></td>
                                        <td class="f-small"><a href="#">Painting Brush</a></td>
                                        <td class="px-3 f-small">x 1</td>
                                    </tr>

                                    <tr>
                                        <td class="px-2"><img src="static/images/tools/5_0.jpg"></td>
                                        <td class="f-small"><a href="#">Hiro Crimping Pliers</a></td>
                                        <td class="px-3 f-small">x 1</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./listCart.html">View List Cart</a>
                    </div>
                </li>

                <!-- Example single danger button -->
                <div class="btn-group">
                    <a class="nav-link btn btn-outline-primary mt-2 ml-2" href="#">
                        Nguyễn Thị Ánh
                        <i class="fas fa-user-plus ml-2"></i>
                    </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">My profile</a>
                        <a class="dropdown-item" href="#" onclick="openOrder()">Orders</a>
                        <a class="dropdown-item" href="#">History</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Logout</a>
                    </div>
                </div>
            </ul>
        </div>
    </nav>
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

                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Tools</a>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Hand Tools">
                        <a class="pl-3 subCategory" href="#">
                            <li>Hand Tools</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Tool Parts">
                        <a class="pl-3 subCategory" href="#">
                            <li>Tool Parts</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Power Tools">
                        <a class="pl-3 subCategory" href="#">
                            <li>Power Tools</li>
                        </a>
                    </span>


                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Measurements</a>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Temperature Instruments">
                        <a class="pl-3 subCategory" href="#">
                            <li>Temperature Instruments</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip"
                        title="Measurement &amp; Analysis Instruments">
                        <a class="pl-3 subCategory" href="#">
                            <li>Measurement &amp; Analysis Instruments</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Gauging Tool">
                        <a class="pl-3 subCategory" href="#">
                            <li>Gauging Tool</li>
                        </a>
                    </span>


                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Improvement</a>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title=" Bathroom Fixtures">
                        <a class="pl-3 subCategory" href="#">
                            <li> Bathroom Fixtures</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Kitchen Fixtures ">
                        <a class="pl-3 subCategory" href="#">
                            <li>Kitchen Fixtures </li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Door&amp; Window Part ">
                        <a class="pl-3 subCategory" href="#">
                            <li>Door&amp; Window Part </li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Bag,Box,Bottle">
                        <a class="pl-3 subCategory" href="#">
                            <li>Bag,Box,Bottle</li>
                        </a>
                    </span>


                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Lights&amp;Lighting</a>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Stage Lighting ">
                        <a class="pl-3 subCategory" href="#">
                            <li>Stage Lighting </li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Lighting Bulbs &amp; Tubes">
                        <a class="pl-3 subCategory" href="#">
                            <li>Lighting Bulbs &amp; Tubes</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title=" Indoor Light">
                        <a class="pl-3 subCategory" href="#">
                            <li> Indoor Light</li>
                        </a>
                    </span>


                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Home&amp;Garden</a>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Kitchen, Dining &amp; Bar">
                        <a class="pl-3 subCategory" href="#">
                            <li>Kitchen, Dining &amp; Bar</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip"
                        title="Household Cleaning Tools &amp; Accessories">
                        <a class="pl-3 subCategory" href="#">
                            <li>Household Cleaning Tools &amp; Accessories</li>
                        </a>
                    </span>

                    <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Garden Supplies">
                        <a class="pl-3 subCategory" href="#">
                            <li>Garden Supplies</li>
                        </a>
                    </span>


                    <a class="pt-4" href="#"
                        style="color: #8400e7 !important; margin-left: 5px;font-size: 20px">Others</a>


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






                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>

                        <li class="page-item active"><a class="page-link" href="#">1</a></li>

                        <li class="page-item "><a class="page-link" href="#">2</a></li>

                        <li class="page-item "><a class="page-link" href="#">3</a></li>

                        <li class="page-item ">
                            <a class=" page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>



                <div class="row mb-5">






                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <div id="DIV_1">
                                <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                            </div>

                            <a href="./detail.html"><img src="static/images/tools/1_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Repair Tool</a>
                                <p class="text-center my-0" style="color: #f60">$16.61</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="16.61" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">11</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/2_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Measure Tools</a>
                                <p class="text-center my-0" style="color: #f60">$9.27</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="9.27" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/3_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Manual Screw</a>
                                <p class="text-center my-0" style="color: #f60">$8.6</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="8.6" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/4_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Painting Brush</a>
                                <p class="text-center my-0" style="color: #f60">$5.93</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="5.93" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <div id="DIV_1">
                                <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                            </div>

                            <a href="./detail.html"><img src="static/images/tools/5_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Hiro Crimping
                                    Pliers</a>
                                <p class="text-center my-0" style="color: #f60">$15.36</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="15.36" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">15</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/6_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Stripping Pliers</a>
                                <p class="text-center my-0" style="color: #f60">$12.42</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="12.42" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <div id="DIV_1">
                                <span id="SPAN_2"><i class="fas fa-bolt"></i></span>
                            </div>

                            <a href="./detail.html"><img src="static/images/tools/7_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Steel Triangular</a>
                                <p class="text-center my-0" style="color: #f60">$9.14</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="9.14" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">8</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/8_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Game Cube</a>
                                <p class="text-center my-0" style="color: #f60">$9.25</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="9.25" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/9_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Cutting Saw</a>
                                <p class="text-center my-0" style="color: #f60">$3.46</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="3.46" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">20</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/10_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Brush Point Paint</a>
                                <p class="text-center my-0" style="color: #f60">$18.06</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="18.06" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">13</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/11_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Nozzle Water</a>
                                <p class="text-center my-0" style="color: #f60">$14.15</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="14.15" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/12_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Plastic Car</a>
                                <p class="text-center my-0" style="color: #f60">$12.81</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="12.81" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">10</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/13_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Screen Opening</a>
                                <p class="text-center my-0" style="color: #f60">$12.07</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="12.07" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">10</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/14_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Mini Spade Shovel</a>
                                <p class="text-center my-0" style="color: #f60">$12.34</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="12.34" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">2</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/15_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Separating Pliers </a>
                                <p class="text-center my-0" style="color: #f60">$8.96</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="8.96" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">2</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/16_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Plasterboard Gypsum</a>
                                <p class="text-center my-0" style="color: #f60">$6.9</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="6.9" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">9</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/17_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Cocktail Muddler</a>
                                <p class="text-center my-0" style="color: #f60">$14.33</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="14.33" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/18_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Toolbox+Digital </a>
                                <p class="text-center my-0" style="color: #f60">$6.59</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="6.59" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">

                            <div id="DIV_1">
                                <span id="SPAN_2">15</span>
                            </div>


                            <a href="./detail.html"><img src="static/images/tools/19_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Stainless Steel</a>
                                <p class="text-center my-0" style="color: #f60">$10.36</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="10.36" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->

                    <!-- Show product -->

                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card">


                            <a href="./detail.html"><img src="static/images/tools/20_0.jpg" style="border: 1px solid #ededed;"
                                    class="card-img-top pt-4" alt="..."></a>
                            <div class="card-body pt-3">
                                <a href="#" class="btn btn-outline-danger"><i class="fas fa-cart-plus mr-2"></i>Add to
                                    cart</a>
                                <a href="./detail.html" class="card-title text-center mb-1 mt-2">Screwdriver Bit</a>
                                <p class="text-center my-0" style="color: #f60">$9.59</p>
                                <!--                                        <p class="text-center my-0">
                                                                                        <fmt:formatNumber value="9.59" type="currency"></fmt:formatNumber>
                                                                                    </p>-->
                            </div>
                        </div>
                    </div>

                    <!-- end -->




                </div>






                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>

                        <li class="page-item active"><a class="page-link" href="#">1</a></li>

                        <li class="page-item "><a class="page-link" href="#">2</a></li>

                        <li class="page-item "><a class="page-link" href="#">3</a></li>

                        <li class="page-item ">
                            <a class=" page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>



            </div>
            <!--end -->
        </div>
    </div>

    <section id="footer">
        <div class="container">
            <div class="row text-center text-xs-center text-sm-left text-md-left">
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <ul class="list-unstyled quick-links">
                        <img src="static/images/My_Facebook_Code.png" alt="" style="height: 250px">
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h5>About Website</h5>
                    <ul class="list-unstyled quick-links">
                        <li><a href="#"><i class="fa fa-angle-double-right"></i>Home</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i>About</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i>Product</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i>Sale now</a></li>
                        <li><a href="#"><i class="fa fa-angle-double-right"></i>Singup</a></li>
                        <li><a href="
                                http://localhost:8080/HousewareShop/login">
                                <i class="fa fa-angle-double-right"></i>Your-Profile</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h5>Contact</h5>

                    <ul class="list-unstyled quick-links">
                        <li><a><i class="fas fa-phone-volume"></i>0123456789</a><a><i
                                    class="fa fa-envelope ml-3"></i>anhng2610@gmail.com</a></li>
                        <li><a
                                href="https://www.google.com/maps?ll=20.994897,105.523648&amp;z=15&amp;t=m&amp;hl=vi&amp;gl=US&amp;mapclient=embed&amp;saddr=QL21,+Th%E1%BA%A1ch+Ho%C3%A0,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&amp;daddr=Ng%C3%A3+ba+H%C3%B2a+L%E1%BA%A1c+-+QL+21,+H%C3%B2a+L%E1%BA%A1c,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&amp;dirflg=d"><i
                                    class="fa fa-angle-double-right"></i>21, Thôn 6, Xã Thạch Hòa, Huyện Thạch Thất, Hà
                                Nội, Việt Nam</a></li>
                        <div id="map" style="height:150px;">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d28951.161087040786!2d105.51070539259248!3d20.995169088270938!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e0!4m3!3m2!1d20.9946236!2d105.52396399999999!4m5!1s0x31345b9f825d11d7%3A0x1772bcf973ec956c!2zTmfDoyBiYSBIw7JhIEzhuqFjIC0gUUwgMjEsIEjDsmEgTOG6oWMsIFRo4bqhY2ggVGjhuqV0LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d20.994598999999997!2d105.523479!5e0!3m2!1svi!2s!4v1573398015876!5m2!1svi!2s"
                                width="250" height="100" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                        </div>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                    <ul class="list-unstyled list-inline social text-center">
                        <li class="list-inline-item"><a href="https://www.facebook.com/messages/t/xb.jamesgosling"><i
                                    class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                        <li class="list-inline-item"><a href="https://www.instagram.com/xbjamesgosling/?hl=vi"><i
                                    class="fab fa-instagram"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="fas fa-phone-volume"></i></a></li>
                        <li class="list-inline-item"><a href="mailto:lehongquan15a@gmail.com?cc=name2@rapidtables.com&amp;bcc=name3@rapidtables.com
                                                        &amp;subject=The%20subject%20of%20the%20email
                                                        &amp;body=The%20body%20of%20the%20email" target="_blank"><i
                                    class="fa fa-envelope"></i></a></li>
                    </ul>
                </div>

            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
                    <p><u><a href="#">National Transaction Corporation</a></u> is a
                        Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp,
                        Minneapolis, MN]</p>
                    <p class="h6">© copyright by <a class="text-green" href="#" target="_blank">HousewareShop</a></p>
                </div>

            </div>
        </div>
    </section>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
    </body>
</html>
