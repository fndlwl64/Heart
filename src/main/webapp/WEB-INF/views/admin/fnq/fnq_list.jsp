<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="fList" value="${ fnqList }" />
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_fnq_list" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FNQ</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/admin_list_view.js"></script>
    <script src="${path}/resources/js/admin_search.js"></script>
</head>
<body>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="get" action="${path}/admin_fnq_list">
            <div class="form_box search d-flex">
           		<span class="search-name">대분류</span>
                <select name="field" class="form-select d-inline align-middle">
                    <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>카테고리</option>
                    <option value="question"<c:if test="${ field eq 'question' }">selected="selected"</c:if>>질문</option>
                    <option value="answer"<c:if test="${ field eq 'answer' }">selected="selected"</c:if>>답변</option>
                </select>
                <span class="search-name">검색어</span> 
                <input type="text" class="form-control d-inline align-middle search-text" value="${ keyword }" name="keyword" />
                <select name="" class="form-select d-none align-middle search-select">
                    <option value="입양"<c:if test="${ keyword eq '입양' }">selected="selected"</c:if>>입양</option>
                    <option value="입소"<c:if test="${ keyword eq '입소' }">selected="selected"</c:if>>입소</option>
                    <option value="후원"<c:if test="${ keyword eq '후원' }">selected="selected"</c:if>>후원</option>
                    <option value="기타"<c:if test="${ keyword eq '기타' }">selected="selected"</c:if>>기타</option>
                </select>                    
                <button type="submit" class="btn btn-dark align-middle d-inline"><i class="bi bi-search"></i> 검색</button>
                <button type="button" class="btn btn-light d-inline align-middle" onclick="location.href='${ path }/user_fnq_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>                    
           </div>
        <br>
        </form>
        
       <%-- 정렬 --%>
	    <div class="qna-section">
	        <div class="row">
	            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
	                <select class="form-select form-select-sm order" name="order" onchange="location.href='${ path }/admin_fnq_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
	                    <option selected="selected" value="no_desc" <c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호순</option>
	                    <option value="question_desc" <c:if test="${ order eq 'question_desc' }">selected="selected"</c:if>>가나다순</option>
	                </select>
	            </div>
            </div>
        </div>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>                
                    <th class="table-light" width="10%">No</th>
                    <th class="table-light" width="10%">카테고리</th>
                    <th class="table-light" width="65%">질문</th>
                    <th class="table-light" width="15%">수정 / 삭제</th>
                </tr>
				<c:forEach items="${ fList }" var="list">
                <tr>
                    <td>${ list.fnq_no }</td>
                    <td>${ list.fnq_category }</td>
                    <td class="list-title"><a href="${ path }/admin_fnq_content?fnq_no=${ list.fnq_no }"><strong>Q. </strong>${ list.fnq_question }</a></td>
                    <td>
                    	<c:set value="${ path }/admin_fnq_delete?fnq_no=${ list.fnq_no }" var="deleteAddr" />
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/admin_fnq_update?fnq_no=${ list.fnq_no }'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }" >삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        
        <%-- 삭제 모달 --%>
		<jsp:include page="../../include/deleteModal.jsp" />
		
		<%-- 답변 등록하기 버튼 --%>		
		<div class="insert-form">
            <button class="btn btn-primary insertbtn mb-3" onclick="location.href='${path}/admin_fnq_insert'"><i class="bi bi-pencil-fill"></i> 등록</button>
        </div>
        
        <%-- 페이징처리 --%>
		<%@ include file="../../include/pagination_update.jsp" %>
		
    </div>
</body>
</html>