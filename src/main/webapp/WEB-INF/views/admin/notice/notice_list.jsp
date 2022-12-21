<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="dto" value="${supportList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<script src="${path}/resources/js/admin_list_view.js"></script>
<head>
<jsp:include page="../../include/admin_header.jsp"/>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link rel="stylesheet" href="resources/css/notice.css">
    <script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <%-- 검색 폼 --%>
        <form class="search_form" method="post" action="${path }/notice_list">
            <div class="form_box d-flex">
                <select name="field" class="form-select d-inline align-middle w-25">
                    <option value="allSearch" <c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="title" <c:if test="${ field eq 'title' }">selected="selected"</c:if>>글제목</option>
                    <option value="cont" <c:if test="${ field eq 'cont' }">selected="selected"</c:if>>내용</option>
                </select>
				<span class="search-name">검색어</span> 
                <input name="keyword" class="form-control d-inline align-middle w-50" value="${ keyword }">
                <button class="btn btn-dark d-inline align-middle ms-1" type="submit"><i class="bi bi-search"></i> 검색</button>
            </div>
        </form>

        <br>
        
        <%-- 정렬 & 게시물 수 --%>
	    <form class="order_form" method="get" action="${path}/notice_list">    
	       <div class="notice-section">
	            <div class="notice_order">
	                <select class="form-select form-select-sm" name="order" onchange="this.form.submit()">
	                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
	                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신게시일순</option>
	                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>조회수높은순</option>
	                </select>
	            </div>
	        </div>
	    </form>

        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>
                    <th class="table-light col-1">글번호</th>
                    <th class="table-light col-1">글제목</th>
                    <th class="table-light col-1">조회수</th>
                    <th class="table-light col-1">게시일</th>
                    <th class="table-light col-1">수정/삭제</th>
                </tr>
				<c:if test="${!empty noticeList}">
					<c:forEach items="${noticeList }" var="dto">
		                <tr>
		                    <td>${dto.getNotice_no() }</td>
		                    <td><a href="${path }/notice_content?no=${dto.getNotice_no()}">${dto.getNotice_title() }</a></td>
		                    <td>${dto.getNotice_hit() }</td>
		                    <td>${dto.getNotice_date().substring(0, 10) }</td>
		                    <td>
		                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/notice_update?no=${dto.getNotice_no() }'">수정</button>
		                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path }/notice_delete?no=${dto.getNotice_no()}">삭제</button>
		                    </td>
		                </tr>
                	</c:forEach>
                </c:if>
            </table>
            <br>
			<button id="insert_btn"class="btn btn-primary insertbtn mb-3" onclick="location.href='${path}/notice_insert'"><i class="bi bi-pencil-fill"></i> 등록</button>
        </div>

        <br><br>
        <%-- 페이징처리 --%>
   	 	<jsp:include page="../../include/pagination.jsp" />

        <%-- 삭제 모달 --%>
		<jsp:include page="../../include/deleteModal.jsp" />
    </div>

</body>
</html>