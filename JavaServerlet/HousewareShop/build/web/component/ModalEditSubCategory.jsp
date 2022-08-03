<%-- 
    Document   : ModalEditSubCategory
    Created on : Nov 5, 2019, 11:43:18 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalEditSubCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin danh mục con</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmEditSubCategory" class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="edit-sub-category" method="POST">


                    <input type="hidden" name="id" value="${subCategory.id}">

                    <div class="container">
                        <label for="name"><b>Tên danh mục con</b></label>
                        <input class="text" type="text" placeholder="Enter name of subcategory" name="name" value="${subCategory.subCategoryName}" required>
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

<!--                        <button class="btn btn-outline-info" style="width: 55%" type="submit" ><i class="fas fa-sync-alt mr-2"></i>Update</button>
                        <a data-dismiss="modal" class="btn btn-outline-danger" style="width: 44%" ><i class="fas fa-window-close mr-2"></i></i>Cancel</a>-->
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmEditSubCategory').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
