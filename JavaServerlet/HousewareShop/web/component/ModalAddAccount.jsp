<%-- 
    Document   : ModalAddAccount
    Created on : Nov 6, 2019, 3:18:03 PM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modalAddAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Thông tin tài khoản</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmAddAccount" class="modal-content animate" style="padding: 5px;border-top:none;border-bottom: none" action="add-account" method="post">


                    <div class="container">
                        <label for="username"><b>Tên tài khoản</b></label><br>
                        <input class="text" type="text" placeholder="Enter User name" name="username" value="${accountEdit.userName}" required><br>
                         
                        <label for="username"><b>Mật khẩu</b></label><br>
                        <input class="text" type="password" placeholder="Enter User name" name="password" value="${accountEdit.userName}" required><br>
                        
                        <label for="displayName"><b>Tên hiển thị</b></label><br>
                        <input class="text" type="text" placeholder="Enter Display name" name="displayName" value="${accountEdit.displayName}" required><br>

                        <label for="address"><b>Địa chỉ</b></label><br>
                        <input class="text" type="text" placeholder="Enter address" name="address" value="${accountEdit.address}" required><br>

                        <label for="email"><b>Địa chỉ email</b></label><br>
                        <input class="text" type="text" placeholder="Enter email" name="email" value="${accountEdit.email}" required><br>

                        <label for="phone"><b>Số điện thoại</b></label><br>
                        <input class="text" type="text" placeholder="Enter phone" name="phone" value="${accountEdit.phone}" required><br>



                        <div class="form-group">
                            <label for="status"><b>Trạng thái</b></label>
                            <select class="form-control" name="status"id="exampleFormControlSelect1">
                                <c:forEach items="${listStatusAccount}" var="statusAccount">
                                    <option <c:if test="${statusAccount.id eq accountEdit.status}">selected</c:if> value="${statusAccount.id}">${statusAccount.status}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="role"><b>Vai trò</b></label>
                            <select class="form-control" name="role" id="exampleFormControlSelect12">
                                <c:forEach items="${listRoleAccount}" var="roleAccount">
                                    <option <c:if test="${roleAccount.id eq accountEdit.roleId}">selected</c:if> value="${roleAccount.id}">${roleAccount.role}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="document.getElementById('frmAddAccount').submit()" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
