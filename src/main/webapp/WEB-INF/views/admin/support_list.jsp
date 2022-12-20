<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${supportList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/admin_header.jsp"/>
<!DOCTYPE html>

<html>
<style>
.container {
    text-align: center;
    margin: auto;
    width: 85%;
}
</style>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link rel="stylesheet" href="resources/css/support.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
<div class="container">
    <br>
    <%-- 검색 폼 --%>
    <form class="search_form" method="post" action="${path }/support_list">
        <div class="form_box d-flex">
            <select name="field" class="form-select d-inline align-middle w-25">
            	<option value="allSearch" <c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                <option value="id" <c:if test="${ field eq 'id' }">selected="selected"</c:if>>회원아이디</option>
                <option value="grade" <c:if test="${ field eq 'grade' }">selected="selected"</c:if>>후원금액</option>
            </select>
			<span class="search-name">검색어</span> 
            <input name="keyword" class="form-control d-inline align-middle w-50" value="${ keyword }">

            <button class="btn btn-dark d-inline align-middle ms-1" type="submit"><i class="bi bi-search"></i> 검색</button>
        </div>
    </form>

    <br>
    
       <%-- 정렬 & 게시물 수 --%>
    <form class="order_form" method="get" action="${path}/support_list">    
       <div class="qna-section">
            <div class="qna_order">
                <select class="form-select form-select-sm" name="order" onchange="this.form.submit()">
                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신후원순</option>
                    <option value="price_desc"<c:if test="${ order eq 'price_desc' }">selected="selected"</c:if>>금액순</option>
                </select>
            </div>
        </div>
    </form>

    <br><br>
    <%-- 검색 결과 테이블 --%>
    <div class="lists">
		
        <table class="table table-hover searched_list">
            <tr>
                <th class="table-light col-1">후원번호</th>
                <th class="table-light col-1">회원아이디</th>
                <th class="table-light col-1">후원금액</th>
                <th class="table-light col-1">후원날짜</th>
                <th class="table-light col-1">수정/삭제</th>
            </tr>
            <c:if test="${!empty supportList }">
				<c:forEach items="${supportList }" var="dto">
	            <tr>
	                <td>${dto.getSupport_no() }</td>
	                <td>${dto.getSupport_userid() }</td>
	                <td>${dto.getSupport_price() }원</td>
	                <td>${dto.getSupport_date().substring(0,10) }</td>
	                <td>
	                    <button class="btn btn-outline-success btn-sm" onclick="location.href='${path }/support_update?no=${dto.getSupport_no()}'">수정</button>
	                    <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path }/support_delete?no=${dto.getSupport_no()}">삭제</button>
	                </td>
	            </tr>
	            </c:forEach>
            </c:if>
            <c:if test="${empty supportList }">
            	<h3>후원내역이 없습니다.</h3>
            </c:if>
        </table>
		<br>
		<button id="insert_btn" class="btn btn-primary insertbtn mb-3" onclick="location.href='${path }/support_insert'"><i class="bi bi-pencil-fill"></i> 등록</button>
    </div>
    <br><br>
    <%-- 삭제 모달 --%>
    <jsp:include page="../include/deleteModal.jsp" />
    <%-- 페이징처리 --%>
    <jsp:include page="../include/pagination.jsp" />
</div>
</body>
</html>