<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${supportList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="search_id" value="${ search_id }"/>
<c:set var="search_price" value="${ search_price }"/>
<c:set var="search_date_start" value="${ search_date_start }"/>
<c:set var="search_date_end" value="${ search_date_end }"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="url" value="&search_id=${ search_id }&search_price=${ search_price }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order=${ order }" />
<jsp:include page="../../include/admin_header.jsp"/>
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
	<script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
<div class="container">
    <%-- 검색 폼 --%>
    <form class="search_form" method="post" action="${path }/support_list">
        <div class="form_box">
            	<div class="search-semi-title">
                	<span><i class="bi bi-check2-square"></i> 후원관리 검색</span>
            	</div>
            	<div class="search-table-box">
	                <table class="table table-sm" id="search-table">
	                    <tr>
	                        <th width="10%">회원 아이디</th>
	                        <td width="15%"><input type="text" class="form-control" name="search_id" value="${ search_id }" /></td>
	                        <th width="10%">후원 금액</th>
	                        <td width="17.5%">
		                        <div class="support-money">
			                        <input type="text" class="form-control d-inline" name="search_price" value="${ search_price }" />
			                        <span>원</span>
		                        </div>
	                        </td>    
	                        <th width="10%">후원일자</th>
							<td width="35%">
								<div class="search-date">
			                        <input type="date" class="form-control search-date-picker" name="search_date_start" value="${ search_date_start }" />
			                        <input type="date" class="form-control search-date-picker" name="search_date_end" value="${ search_date_end }" />
		                        </div>
	                        </td>
	                    </tr>                                                           
	                </table>
				</div>
				<div class="search-buttons">
					<button class="btn btn-light" type="button" onclick="location.href='${ path }/support_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
		            <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
	            </div>   
            </div>
    </form>

    
       <%-- 정렬 & 게시물 수 --%>
<%--     <form class="order_form" method="get" action="${path}/support_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">     --%>
       <div class="sup-section">
       		<div class="row">
       			<div class="col total-data">
		                <select class="form-select form-select-sm order" name="order" onchange="location.href='${path}/support_list?page=${ paging.page }&search_id=${ search_id }&search_price=${ search_price }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order='+this.value;">
		                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
		                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신후원순</option>
		                    <option value="price_desc"<c:if test="${ order eq 'price_desc' }">selected="selected"</c:if>>금액순</option>
		                </select>

	            </div>
            </div>
        </div>
<!--     </form> -->

    
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
        </table>
		<br>
	        <c:if test="${empty supportList }">
	        	<h3>후원내역이 없습니다.</h3>
	        </c:if>
		<button id="insert_btn" class="btn btn-primary insertbtn mb-3" onclick="location.href='${path }/support_insert'"><i class="bi bi-pencil-fill"></i> 등록</button>
    </div>
    <br><br>
    <%-- 삭제 모달 --%>
    <jsp:include page="../../include/deleteModal.jsp" />
    <%-- 페이징처리 --%>
    <%-- <jsp:include page="../../include/pagination.jsp" /> --%>
    <%@ include file="../../include/pagination_update.jsp" %>
</div>
</body>
</html>