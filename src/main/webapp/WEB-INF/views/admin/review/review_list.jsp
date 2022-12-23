<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="rList" value="${ reviewList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="search_id" value="${ search_id }"/>
<c:set var="search_animal" value="${ search_animal }"/>
<c:set var="search_content" value="${ search_content }"/>
<c:set var="cList" value="${ commentList }"/>
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_review_list" />
<c:set var="url" value="&search_id=${ search_id }&search_animal=${ search_animal }&search_content=${ search_content }&order=${ order }" />
<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_Review</title>
    <jsp:include page="../../include/admin_header.jsp" />
    <link rel="stylesheet" href="${path}/resources/css/list_view.css" />
    <script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <div class="container">
    
        <form action="${path}/admin_review_list" class="search_form" method="get">
        <div class="form_box">
            <div class="search-semi-title">
                <span><i class="bi bi-check2-square"></i> 후기관리 검색</span>
            </div>       
            <div class="search-table-box">
                <table class="table table-sm" id="search-table">
                    <tr>
                        <th class="col-1">반려동물 이름</th>
                        <td class="col-2"><input type="text" class="form-control" name="search_animal" value="${ search_animal }" /></td>
                        <th class="col-1">작성자 아이디</th>
                        <td class="col-2"><input type="text" class="form-control" name="search_id" value="${ search_id }" /></td>
                        <th class="col-1">후기글 내용</th>
                        <td class="col-2"><input type="text" class="form-control" name="search_content" value="${ search_content }" /></td>
                    </tr>                                                           
                </table>
			</div>
			<div class="search-buttons">
			<button class="btn btn-light" type="button" onclick="location.href='${ path }/admin_review_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
            <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
            </div>
        </div>
        </form>
        
       <%-- 정렬 & 게시물 수 --%>
        <div class="qna-section">
            <div class="row">
	            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
	                <select class="form-select form-select-sm order" name="order" onchange="location.href='${ path }/user_review_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
	                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>높은번호순</option>
	                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신등록순</option>
	                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>인기순</option>
	                    <option value="title_asc"<c:if test="${ order eq 'title_asc' }">selected="selected"</c:if>>가나다순</option>
	                </select>
	            </div>
            </div>
        </div>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list mb-4">
                <tr>                
                    <th class="table-light col-1">No</th>
                    <th class="table-light col-1">종류</th>
                    <th class="table-light col-5">제목</th>
                    <th class="table-light col-1">작성자</th>
                    <th class="table-light col-1">조회수</th>
                    <th class="table-light col-1">작성일시</th>
                    <th class="table-light col-2">수정 / 삭제</th>
                </tr>
                <c:forEach items="${ rList }" var="list" varStatus="status">
                <tr>
                    <td>${ list.review_no }</td>
                    <td>
                       <c:if test="${ list.review_animal_tag eq 'dog' }">강아지</c:if>
                       <c:if test="${ list.review_animal_tag eq 'cat' }">고양이</c:if>    
                    </td>                
                    <td class="list-title">
	                    <a href="${ path }/admin_review_content?review_no=${ list.review_no }">
	                    <c:if test="${ list.review_title.length() gt 30 }">${ list.review_title.substring(0,30) }...</c:if>
	                    <c:if test="${ list.review_title.length() lt 30 }">${ list.review_title }</c:if>
	                    <c:if test="${ list.review_regdate.substring(0,10) eq today }"><span class="badge rounded-pill text-bg-warning">N</span></c:if>
                        <c:if test="${ cList[status.index] gt 0 }"><span class="comment-count">[${ cList[status.index] }]</span></c:if>
	                    </a>
                    </td>
                    <td>${ list.review_id }</td>
                    <td>${ list.review_hit }</td>
                    <td><small>${ list.review_regdate.substring(0,10) }</small></td>
                    <td>
                    	<c:set var="deleteAddr" value="${ path }/admin_review_delete?review_no=${ list.review_no }" />
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/admin_review_update?review_no=${ list.review_no }'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }">삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <%-- 삭제 모달 --%>		
        <jsp:include page="../../include/deleteModal.jsp" />
        
        <%-- 페이징처리 --%>
        <%@ include file="../../include/pagination_update.jsp" %>
    </div>
</body>
</html>