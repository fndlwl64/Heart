<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path }/resources/css/notice.css">
<%-- 여기서부터 작성 --%>
<div class="notice-board">
    <div align="center">
        <h2>공지사항</h2>
        
        <%-- 검색 폼 --%>
        <form class="search_form" method="post" action="${path }/notice_update_ok">
            <div class="form_box">
                <select name="field">
                    <option value="allSearch" <c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="title" <c:if test="${ field eq 'title' }">selected="selected"</c:if>>글제목</option>
                    <option value="cont" <c:if test="${ field eq 'cont' }">selected="selected"</c:if>>내용</option>
                </select>
				<span class="search-name">검색어</span> 
                <input name="keyword" value="${ keyword }">

                <input class="btn btn-secondary searchbtn" type="submit" value="검색">
            </div>
        </form>


        <br><br>
        
        <table class="table table-bordered">
            <tr class="table-light">
                <th>글 No.</th>
                <th>공지제목</th>
                <th>게시일</th>
                <th>조회수</th>
            </tr>
            <c:if test="${!empty List}">
                <c:forEach items="${List }" var="dto">
            <tr>
                <td>${dto.getNotice_no()}</td>
                <td><a href="${path }/user_notice_content?no=${dto.getNotice_no() }">${dto.getNotice_title() }</a></td>
                <td>${dto.getNotice_date().substring(0, 10) }</td>
                <td>${dto.getNotice_hit() }</td>
            </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${empty List}">
            <h3>공지사항이없습니다.</h3>
        </c:if>
    </div>
    
    <%-- 페이징처리 --%>
    <jsp:include page="../../include/pagination.jsp" />
</div>
<jsp:include page="../../include/user_footer.jsp" />
