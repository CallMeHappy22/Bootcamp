<%-- 
    Document   : ModalEditProduct
    Created on : Nov 3, 2019, 9:18:43 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmEditProduct" class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="edit-product" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="id" value="${productEdit.id}">

                    <div class="container">
                        <label for="code"><b>Mã sản phẩm</b></label><br>
                        <input class="text" type="text" placeholder="Enter code of product" name="code" value="${productEdit.code}" required><br>

                        <label for="name"><b>Tên sản phẩm</b></label><br>
                        <input class="text" type="text" placeholder="Enter name of product" name="name" value="${productEdit.name}" required><br>


                        <label for="image" ><b>Ảnh</b></label><br>
                        <span class="imageDetail">
                            <c:forEach items="${productEdit.listImage}" var="image">
                                <img src="images/${image.imageName}" alt="" style="width: 11%; margin-left: 4.8%"/>
                            </c:forEach>
                        </span><br>
                        <input type="file" name="fileName" class="form-control-file" multiple><br>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1"><b>Danh mục con</b></label>
                            <select class="form-control" name="subCategory"id="exampleFormControlSelect1">
                                <c:forEach items="${listSubCategory}" var="subCategory">
                                    <option <c:if test="${subCategory.id eq product.subCategoryId }">selected</c:if> value="${subCategory.id}">${subCategory.subCategoryName}</option>
                                </c:forEach>
                            </select>

                        </div>

                        <input type="hidden" name="category" value="${productEdit.categoryId}">

                        <div class="form-group">
                            <label for="quantity"><b>Số lượng sản phẩm</b></label>
                            <input class="text" class="form-control" type="number" placeholder="Enter quantity of product" name="quantity" value="${productEdit.quantity}" required>
                        </div>
                        <div class="form-group">
                            <label for="price"><b>Giá bán</b></label>
                            <input class="text" class="form-control" type="number" placeholder="Enter price of product" name="price" pattern="\d*" value="${productEdit.price}" required>
                        </div>
                        <div class="form-group">
                            <label for="sale"><b>Phần trăm khuyến mãi</b></label>
                            <input class="text" class="form-control" type="number" min="0" max="100" pattern="\d*" placeholder="Enter price of product" value="${productEdit.sale*100}" name="sale" required>
                        </div>

                        <div class="form-group">
                            <label for="status"><b>Trạng thái</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusProduct}" var="statusProduct">
                                    <option <c:if test="${statusProduct.id eq productEdit.status}">selected</c:if> value="${statusProduct.id}">${statusProduct.status}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"><b>Mô tả sản phẩm</b></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" value="${productEdit.description}">${productEdit.description}</textarea>
                        </div>

                        <!--                        <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                                                <a data-dismiss="modal" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-trash mr-2"></i>Cancel</a>-->
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmEditProduct').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
