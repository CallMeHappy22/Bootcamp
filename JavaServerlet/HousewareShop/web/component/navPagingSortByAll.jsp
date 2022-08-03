<%-- 
    Document   : navPaging
    Created on : Nov 5, 2019, 1:48:14 PM
    Author     : ThinkPro
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${listCount.size()>1}">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-end">
      <li class="page-item <c:if test="${page eq 1}">disabled</c:if>">
      <a class="page-link" href="sort-product?page=${page-1}&price=${price}&news=${news}&free=${free}" tabindex="-1" aria-disabled="true">Trước</a>
    </li>
    <c:forEach items="${listCount}" var="i">
    <li class="page-item <c:if test="${page eq i}">active</c:if>"><a class="page-link" href="sort-product?page=${i}&price=${price}&news=${news}&free=${free}">${i}</a></li>
    </c:forEach>
    <li class="page-item <c:if test="${page eq listCount.size()}">disabled</c:if>"">
      <a class="page-link" href="sort-product?page=${page-1}&price=${price}&news=${news}&free=${free}">Sau</a>
    </li>
  </ul>
</nav>
</c:if>

