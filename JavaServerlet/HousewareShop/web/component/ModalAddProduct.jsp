<%-- 
    Document   : ModalAddProduct
    Created on : Nov 4, 2019, 9:50:55 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalAddProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmAddProduct" class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="add-product" method="post" enctype="multipart/form-data">


                    <div class="container">
                        <label for="code"><b>Mã sản phẩm</b></label><br>
                        <input class="text" type="text" placeholder="Enter code of product" name="code" value="${product.code}" required><br>

                        <label for="name"><b>Tên sản phẩm</b></label><br>
                        <input class="text" type="text" placeholder="Enter name of product" name="name" value="${product.name}" required><br>


                        <label for="image" ><b>Ảnh</b></label><br>

                        <input type="file" name="fileName" class="form-control-file" multiple><br>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1"><b>Danh mục con</b></label>
                            <select class="form-control" name="subCategory"id="exampleFormControlSelect1">
                                <c:forEach items="${listSubCategory}" var="subCategory">
                                    <option value="${subCategory.id}">${subCategory.subCategoryName}</option>
                                </c:forEach>
                            </select>

                        </div>


                        <div class="form-group">
                            <label for="quantity"><b>Số lượng sản phẩm</b></label>
                            <input class="text" class="form-control" type="number" placeholder="Enter quantity of product" name="quantity" required>
                        </div>
                        <div class="form-group">
                            <label for="price"><b>Giá bản</b></label>
                            <input class="text" class="form-control" type="number" pattern="\d*" placeholder="Enter price of product" name="price" required>
                        </div>

                        <div class="form-group">
                            <label for="sale"><b>Phần trăm khuyến mãi</b></label>
                            <input class="text" class="form-control" type="number" min="0" max="100" pattern="\d*" placeholder="Enter price of product" name="sale" required>
                        </div>

                        <div class="form-group">
                            <label for="status"><b>Trạng thái</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusProduct}" var="statusProduct">
                                    <option value="${statusProduct.id}">${statusProduct.status}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"><b>Mô tả sản phẩm</b></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmAddProduct').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
