<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_qna_list" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />

<%-- qna list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">QnA</div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- 정렬 --%>
    <div class="qna-section">
        <div class="row">
        	<div class="col-3 space"></div>
            <div class="col-5 total-data d-flex"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span></div>
            <div class="col-1 qna_order d-flex">
                <select class="form-select form-select-sm w-75" name="qna_order" id="">
                    <option selected="selected" value="date_desc">최신순</option>
                    <option value="hit_desc">조회수순</option>
                    <option value="no_desc">번호순</option>
                </select>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- 아코디언 --%>
    <!-- 문의하기 -->
    <div class="qna-board">
        <table class="table table-bordered">
            <thead>
	            <tr class="table-light">
	                <th scope="col" class="col-1">No</th>
	                <th scope="col" class="col-2">카테고리</th>
	                <th scope="col" class="col-4">제목</th>
	                <th scope="col" class="col-2">글쓴이</th>
	                <th scope="col" class="col-2">작성일</th>
	                <th scope="col" class="col-1">Hit</th>
	            </tr>
            </thead>
            <tbody>
            <c:if test="${ not empty qList }">
                <c:forEach var="list" items="${ qList }">
                <tr>
                    <td>${ list.board_no }</td>
                    <td>${ list.board_category }</td>
                    <td class="left-align">
	                    <a class="d-block qna-a-link" href="${path}/user_qna_content?board_no=${ list.board_no }">
	                    <c:if test="${ list.board_secret eq 'Y' }"><i class="bi bi-lock-fill"></i></c:if> ${ list.board_title }
	                    <c:if test="${ not empty list.board_update }"><small>(edited)</small></c:if>
	                    </a>
                    </td>
                    <td>${ list.board_id }</td>
                    <td>${ list.board_regdate.substring(0,10) }</td>
                    <td>${ list.board_hit }</td>
                </tr>
                </c:forEach>
            </c:if>
            <c:if test="${ empty qList }">
                <tr>
                    <td colspan="6">No data</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <div class="qna-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title btn-insert">
                <button type="button" class="btn btn-primary" onclick="location.href='${path}/user_qna_insert'">
                    <i class="bi bi-pencil"></i> 작성하기</button>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- search --%>
    <div class="qna-section">
        <div class="row">
            <div class="col-4 space"></div>
            <div class="col-4 search">
                <form method="get" action="${ path }/user_qna_list?field=${ field }&keyword=${ keyword }">
                    <select name="field" class="form-select d-inline align-middle w-25">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>카테고리</option>
                        <option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
                        <option value="content"<c:if test="${ field eq 'content' }">selected="selected"</c:if>>내용</option>
                        <option value="id"<c:if test="${ field eq 'id' }">selected="selected"</c:if>>작성자</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle w-50" name="keyword" value="${ keyword }" />
                    <button type="submit" class="btn btn-dark d-inline align-middle"><i class="bi bi-search"></i> 검색</button>
                </form>
            </div>
        </div>
    </div>

    <div class="space-add"></div>

    <!-- 페이징 처리 부분 -->
	<jsp:include page="../../include/pagination.jsp" />

    <div class="space-add"></div>

</div>

<jsp:include page="../../include/user_footer.jsp" />