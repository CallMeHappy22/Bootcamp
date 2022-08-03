<%-- 
    Document   : ModalAddSubCategory
    Created on : Nov 5, 2019, 12:31:04 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalAddSubCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin danh mục con</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmAddSubCategory"  class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="add-sub-category" method="POST">


                    <div class="container">
                        <label for="category"><b>Tên danh mục con</b></label><br>
                        <input class="text" type="text" placeholder="Enter name of category" name="name" value="${SubCategory.subCategoryName}" required><br>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1"><b>Danh mục</b></label>
                            <select class="form-control" name="category"id="exampleFormControlSelect1">
                                <c:forEach items="${listCategory}" var="category">
                                    <option <c:if test="${subCategory.categoryId eq category.id }">selected</c:if> value="${category.id}">${category.category}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="status"><b>Trạng thái</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusSubCategory}" var="SubCategory">
                                    <option <c:if test="${SubCategory.id eq subCategory.status}">selected</c:if> value="${SubCategory.id}">${SubCategory.status}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmAddSubCategory').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
