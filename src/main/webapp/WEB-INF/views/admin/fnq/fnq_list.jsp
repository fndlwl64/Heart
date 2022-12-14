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
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_fnq_list" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FNQ</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <br>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="get" action="${path}/admin_fnq_list?field=${ field }&keyword=${ keyword }">
            <div class="form_box d-flex">
           		<span class="search-name">대분류</span>
                <select name="field" class="form-select d-inline align-middle w-25">
                    <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>분류</option>
                    <option value="question"<c:if test="${ field eq 'question' }">selected="selected"</c:if>>질문</option>
                    <option value="answer"<c:if test="${ field eq 'answer' }">selected="selected"</c:if>>답변</option>
                </select>
                <span class="search-name">검색어</span> 
                <input name="keyword" class="form-control d-inline align-middle w-50" value="${ keyword }">
                <button class="btn btn-dark d-inline align-middle ms-1" type="submit"><i class="bi bi-search"></i> 검색</button>
           </div>
        <br>
        </form>
        
       <%-- 정렬 --%>
       <form class="order_form" method="get" action="${path}/admin_fnq_list?order=${ order }">
       <div class="qna-section">
            <div class="total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span></div>
            <div class="qna_order">
                <select class="form-select form-select-sm" name="order" onchange="this.form.submit()">
                    <option selected="selected" value="no_desc" <c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호순</option>
                    <option value="question_desc" <c:if test="${ order eq 'question_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
        </form>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>                
                    <th class="table-light col-1">No</th>
                    <th class="table-light col-1">분류</th>
                    <th class="table-light col-8">질문</th>
                    <th class="table-light col-2">수정 / 삭제</th>
                </tr>
				<c:forEach items="${ fList }" var="list">
                <tr>
                    <td>${ list.fnq_no }</td>
                    <td>${ list.fnq_category }</td>
                    <td class="list-title"><a href="${ path }/admin_fnq_content?fnq_no=${ list.fnq_no }"><strong>Q. </strong>${ list.fnq_question }</a></td>
                    <td>
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/admin_fnq_update?fnq_no=${ list.fnq_no }'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        
        <%-- 삭제 모달 // admin_list_view.js 삽입되어 있음
        	modal-dialog-centered 삽입됨
         --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div id="myInput" class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        해당 데이터를 삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" onclick="location.href='${path}/admin_qna_delete'">삭제</button>
                    </div>
                </div>
            </div>
        </div>
		
		<%-- 답변 등록하기 버튼 --%>		
		<div class="insert-form">
        <button class="btn btn-primary insertbtn mb-3" onclick="location.href='${path}/admin_fnq_insert'"><i class="bi bi-pencil-fill"></i> 등록하기</button>
        </div>
        
        <%-- 페이징처리 --%>
		<jsp:include page="../../include/pagination.jsp" />
		
    </div>
    <div class="space"> </div>
</body>
</html>