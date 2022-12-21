<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="rList" value="${ reviewList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="cList" value="${ commentList }"/>
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_review_list" />
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  

<!-- modal delete Function 추가 시 data-id 검색 -> 주소값만 수정하세요....
+ admin_list_view.js include 하기 -->

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
    <br>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="get" action="${path}/admin_review_list">
            <div class="form_box d-flex">
                <span class="search-name">분류</span>
                <select name="field" class="form-select d-inline align-middle w-25">
                    <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                    <option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
                    <option value="content"<c:if test="${ field eq 'content' }">selected="selected"</c:if>>내용</option>
                    <option value="name"<c:if test="${ field eq 'name' }">selected="selected"</c:if>>반려동물명</option>
                    <option value="id"<c:if test="${ field eq 'id' }">selected="selected"</c:if>>작성자</option>
                </select>
                 <input type="text" class="form-control d-inline align-middle w-50" value="${ keyword }" name="keyword" />
                <span class="search-name">검색어</span> 
                <input name="keyword" class="form-control d-inline align-middle keyword" value="${ keyword }">
                <button class="btn btn-dark d-inline align-middle ms-1" type="submit"><i class="bi bi-search"></i> 검색</button>
                <button class="btn btn-light d-inline align-middle ms-1" type="submit"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
           </div>
        </form>
        <br>
        
       <%-- 정렬 & 게시물 수 --%>
    <form class="order_form" method="get" action="${path}/admin_review_list">    
       <div class="qna-section">
            <div class="total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span></div>
            <div class="qna_order">
                <select class="form-select form-select-sm" name="order" onchange="this.form.submit()">
                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>높은번호순</option>
                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신등록순</option>
                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>인기순</option>
                    <option value="title_desc"<c:if test="${ order eq 'title_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
        </form>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>                
                    <th class="table-light col-1">No</th>
                    <th class="table-light col-1">종류</th>
                    <th class="table-light col-4">제목</th>
                    <th class="table-light col-1">작성자</th>
                    <th class="table-light col-1">조회수</th>
                    <th class="table-light col-2">작성일시</th>
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
                        <c:if test="${ cList[status.index] gt 0 }"><span>[${ cList[status.index] }]</span></c:if>
	                    </a>
                    </td>
                    <td>${ list.review_id }</td>
                    <td>${ list.review_hit }</td>
                    <td>${ list.review_regdate.substring(0,10) }</td>
                    <td>
                    	<c:set var="deleteAddr" value="${ path }/admin_review_delete?review_no=${ list.review_no }" />
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/admin_review_update?review_no=${ list.review_no }'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }">삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        
        <%-- 삭제 모달 // admin_list_view.js 삽입되어 있음
            modal-dialog-centered 삽입됨
         --%>
		<jsp:include page="../../include/deleteModal.jsp" />
        
        <%-- 페이징처리 --%>
        <jsp:include page="../../include/pagination_update.jsp" />
        
    </div>
    <div class="space"> </div>
</body>
</html>