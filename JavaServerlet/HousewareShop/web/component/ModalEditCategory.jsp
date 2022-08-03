<%-- 
    Document   : ModalEditCategory
    Created on : Nov 3, 2019, 10:51:42 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="myModalEditCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin danh mục</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmEditCategory" class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="edit-category" method="POST">


                    <input type="hidden" name="id" value="${categoryEdit.id}">

                    <div class="container">
                        <label for="code"><b>Tên danh mục</b></label>
                        <input class="text" type="text" placeholder="Enter name of subcategory" name="category" value="${categoryEdit.category}" required>

                        <div class="form-group">
                            <label for="status"><b>Trạng thái</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusCategory}" var="statusCategory">
                                    <option ${statusCategory.id == categoryEdit.status ? "selected":""} value="${statusCategory.id}">${statusCategory.status}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmEditCategory').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
