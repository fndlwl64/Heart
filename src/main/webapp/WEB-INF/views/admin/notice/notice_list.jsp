<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="dto" value="${supportList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="search_title" value="${ search_title }"/>
<c:set var="search_cont" value="${ search_cont }"/>
<c:set var="search_date_start" value="${ search_date_start }"/>
<c:set var="search_date_end" value="${ search_date_end }"/>
<c:set var="url" value="&search_title=${ search_title }&search_cont=${ search_cont }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order=${ order }" />
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../include/admin_header.jsp"/>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link rel="stylesheet" href="resources/css/notice.css">
    <script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <div class="container">
        <%-- 검색 폼 --%>
        <form class="search_form" method="post" action="${path }/notice_list">
            <div class="form_box">
            	<div class="search-semi-title">
                	<span><i class="bi bi-check2-square"></i> 공지관리 검색</span>
            	</div>
            	<div class="search-table-box">
	                <table class="table table-sm" id="search-table">
	                    <tr>
	                        <th width="10%">공지글 제목</th>
	                        <td width="17.5%"><input type="text" class="form-control" name="search_title" value="${ search_title }" /></td>
	                        <th width="10%">공지글 내용</th>
	                        <td width="17.5%"><input type="text" class="form-control" name="search_cont" value="${ search_cont }" /></td>
	                        <th width="10%">작성일자</th>
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
					<button class="btn btn-light" type="button" onclick="location.href='${ path }/notice_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
		            <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
	            </div>   
            </div>
        </form>
        
        <%-- 정렬 & 게시물 수 --%>
	    <%-- <form class="order_form" method="get" action="${path}/notice_list">     --%>
	       <div class="qna-section">
	       		<div class="row">
		            <div class="col total-data justify-content-end">
		                <select class="form-select form-select-sm order" name="order" onchange="location.href='${path}/notice_list?page=${ paging.page }&search_title=${ search_title }&search_cont=${ search_cont }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order='+this.value;">
		                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
		                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신순</option>
		                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>조회수높은순</option>
		                </select>
		            </div>
	            </div>
	        </div>
	    <!-- </form> -->
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>
                    <th class="table-light" width="10%">번호</th>
                    <th class="table-light" width="50%">제목</th>
                    <th class="table-light" width="10%">조회수</th>
                    <th class="table-light" width="12.5%">게시일</th>
                    <th class="table-light" width="12.5%">수정 / 삭제</th>
                </tr>
				<c:if test="${!empty noticeList}">
					<c:forEach items="${noticeList }" var="dto">
		                <tr>
		                    <td>${dto.getNotice_no() }</td>
		                    <td class="notice_title"><a href="${path }/notice_content?no=${dto.getNotice_no()}">${dto.getNotice_title() }</a></td>
		                    <td>${dto.getNotice_hit() }</td>
		                    <td><small>${dto.getNotice_date().substring(0, 10) }</small></td>
		                    <td>
		                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/notice_update?no=${dto.getNotice_no() }'">수정</button>
		                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path }/notice_delete?no=${dto.getNotice_no()}">삭제</button>
		                    </td>
		                </tr>
                	</c:forEach>
                </c:if>
            </table>
            <br>
			<button id="insert_btn"class="btn btn-primary insertbtn mb-3" onclick="location.href='${path}/notice_insert'" style="float: right;"><i class="bi bi-pencil-fill"></i> 등록</button>
        </div>

        <br><br>
        <%-- 페이징처리 --%>
   	 	<%-- <jsp:include page="../../include/pagination.jsp" /> --%>
		<%@ include file="../../include/pagination_update.jsp" %>
		
        <%-- 삭제 모달 --%>
		<jsp:include page="../../include/deleteModal.jsp" />
    </div>

</body>
</html>