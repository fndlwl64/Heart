<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="qList" value="${ qnaList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_qna_list" />
	

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QNA_LIST</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <br>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="get" action="${path}/admin_qna_list?field=${ field }&keyword=${ keyword }">
            <div class="form_box">
                <select name="field">
                    <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>분류</option>
                    <option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
                    <option value="content"<c:if test="${ field eq 'content' }">selected="selected"</c:if>>내용</option>
                    <option value="id"<c:if test="${ field eq 'id' }">selected="selected"</c:if>>작성자</option>
                </select>
                <input name="keyword">
                <button class="btn btn-secondary searchbtn" type="submit"><i class="bi bi-search"></i>검색</button>
            </div>
        </form>
        <br>
        <button class="btn btn-success insertbtn" onclick="location.href='${path}/user_qna_insert'">등록하기</button>
        <br>
        <br>

        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table searched_list">
                <tr>
                    <th class="table-secondary col-1">No</th>
                    <th class="table-secondary col-1">분류</th>
                    <th class="table-secondary col-4">제목</th>
                    <th class="table-secondary col-1">작성자</th>
                    <th class="table-secondary col-1">조회수</th>
                    <th class="table-secondary col-2">작성일시</th>
                    <th class="table-secondary col-2">수정/삭제</th>
                </tr>
				<c:forEach items="${ qList }" var="list">
                <tr>
                    <td>${ list.board_no }</td>
                    <td>${ list.board_category }</td>
                    <td>${ list.board_title }</td>
                    <td>${ list.board_id }</td>
                    <td>${ list.board_hit }</td>
                    <td>${ list.board_regdate.substring(0,10) }</td>
                    <td>
                        <button class="btn btn-outline-primary btn-sm" onclick="location.href='${path}/admin_qna_update'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        
        <%-- 삭제 모달 --%>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div id="myInput" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="deleteModalLabel">데이터 삭제</h1>
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
        <br>
        
        <%-- 페이징처리 --%>
		<jsp:include page="../../include/pagination.jsp" />

    </div>
    
</body>
</html>