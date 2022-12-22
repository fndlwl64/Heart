<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path }/resources/css/notice.css">
<%-- 여기서부터 작성 --%>
<div class="notice-board">
    <div align="center">
        <h2>공지사항</h2>
        <br><br>
        <%-- 검색 폼 --%>
        <div>
        <form class="search_form" method="post" action="${path }/user_notice">
            <div>
                <select name="field" class="form-select d-inline align-middle">
                    <option value="allSearch" <c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="title" <c:if test="${ field eq 'title' }">selected="selected"</c:if>>글제목</option>
                    <option value="cont" <c:if test="${ field eq 'cont' }">selected="selected"</c:if>>내용</option>
                </select>
				<span class="search-name">&nbsp;&nbsp;&nbsp;검색어</span> 
                <input class="form-control d-inline align-middle" name="keyword" value="${ keyword }">
                <button class="btn btn-dark d-inline align-middle ms-1" type="submit"><i class="bi bi-search"></i> 검색</button>
            </div>
        </form>
		</div>

        <br>
        
        <%-- 정렬 & 게시물 수 --%>
        <div>
	    <%-- <form class="order_form" method="get" action="${path}/user_notice">   --%>  
	       <div class="notice-section2">
	       		<div class="row">
		            <div class="col total-data">
		                <select class="form-select form-select-sm" name="order" onchange="location.href='${path}/user_notice?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
		                   <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
		                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신게시일순</option>
		                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>조회수높은순</option>
		                </select>
		            </div>
	            </div>
	        </div>
	    <!-- </form> -->
	    </div>
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
    <br>
    <%-- 페이징처리 --%>
    <%-- <jsp:include page="../../include/pagination.jsp" /> --%>
    <%@ include file="../../include/pagination_update.jsp" %>
</div>
<jsp:include page="../../include/user_footer.jsp" />
