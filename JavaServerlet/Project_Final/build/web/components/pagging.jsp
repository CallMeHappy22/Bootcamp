<%-- 
    Document   : pagging
    Created on : Oct 13, 2021, 7:37:52 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${totalPage>1}">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item ${page<=1?"disabled":""}">
                <a class="page-link" href="${url}page=${page-1}" tabindex="-1" aria-disabled="true">Previous</a>
            </li>

            <c:forEach begin="1" end="${totalPage}" var="i">
                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}page=${i}">${i}</a></li>
                </c:forEach>
            <li class="page-item ${page>=totalPage?"disabled":""}">
                <a class=" page-link" href="${url}page=${page+1}">Next</a>
            </li>
        </ul>
    </nav>
</c:if>