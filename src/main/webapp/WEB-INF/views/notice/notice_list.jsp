<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/user_header.jsp" />
<link rel="short icon" href="#" />
<link rel="stylesheet" href="${path}/resources/css/notice.css">
<%-- 여기서부터 작성 --%>
<div class="notice-board">
    <div align="center">
        <h2>공지사항</h2>
        <table class="table table-bordered">
            <tr class="table-light">
                <th>글 No.</th>
                <th>공지제목</th>
                <th>조회수</th>
            </tr>
            <c:if test="${!empty List}">
                <c:forEach items="${List }" var="dto">
            <tr>
                <td>${dto.getNotice_no()}</td>
                <td>${dto.getNotice_title() }</td>
                <td>${dto.getNotice_hit() }</td>
            </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${empty List}">
            <h3>안떠</h3>
        </c:if>
    </div>
</div>
<jsp:include page="../include/user_footer.jsp" />
