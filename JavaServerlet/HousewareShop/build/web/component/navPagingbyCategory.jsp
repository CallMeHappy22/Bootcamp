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
      <a class="page-link" href="filter?page=${page-1}&id=${id}&cid=${cid}" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <c:forEach items="${listCount}" var="i">
    <li class="page-item <c:if test="${page eq i}">active</c:if>"><a class="page-link" href="filter?page=${i}&id=${id}&cid=${cid}">${i}</a></li>
    </c:forEach>
    <li class="page-item <c:if test="${page eq listCount.size()}">disabled</c:if>">
      <a class="page-link" href="filter?page=${page+1}&id=${id}&cid=${cid}">Next</a>
    </li>
  </ul>
</nav>
</c:if>

