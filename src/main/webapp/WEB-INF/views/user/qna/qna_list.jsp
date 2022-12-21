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
<c:set var="cList" value="${ commentList }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_qna_list" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${ now }" pattern="yyyy-MM-dd" var="today" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />
<script src="${path}/resources/js/admin_search.js"></script>

<%-- qna list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="row">
            <div class="col title">QnA</div>
        </div>
    </div>

    <%-- 정렬 --%>
    <div class="qna-section">
        <div class="row">
            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
                <select class="form-select form-select-sm order" name="order" onchange="location.href='${path}/user_qna_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신등록순</option>
                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>인기순</option>
                    <option value="title_desc"<c:if test="${ order eq 'title_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
    </div>

    <%-- 아코디언 --%>
    <!-- 문의하기 -->
    <div class="qna-board">
        <table class="table table-bordered mb-0">
            <thead>
	            <tr class="table-light">
	                <th scope="col" width="10%">No</th>
	                <th scope="col" width="15%">카테고리</th>
	                <th scope="col" width="40%">제목</th>
	                <th scope="col" width="10%">작성자</th>
	                <th scope="col" width="15%">작성일</th>
	                <th scope="col" width="10%">조회수</th>
	            </tr>
            </thead>
            <tbody>
            <c:if test="${ not empty qList }">
                <c:forEach var="list" items="${ qList }" varStatus="status">
                <tr>
                    <td>${ list.board_no }</td>
                    <td>${ list.board_category }</td>
                    <td class="left-align">     
                    	<c:if test="${ list.board_state ne 'disabled' }">            
                        <a class="d-block qna-a-link" href="${path}/user_qna_content?board_no=${ list.board_no }&board_parentNo=${ list.board_parentNo }&board_group=${ board_group }">
	                    </c:if> 
	                    <c:if test="${ list.board_state eq 'disabled' }">
                        <a class="disabled">
	                    </c:if>
	                    <c:choose>
	                    	<c:when test="${ list.level > 1 }">
	                    		<c:forEach begin="1" end="${ list.level-1 }" step="1">
	                    		<span style="padding-left:20px"></span>	                    		
	                    		</c:forEach>
	                    		<span class="badge rounded-pill text-bg-light"><i class="bi bi-arrow-return-right"></i> Re</span>
	                    	</c:when>
	                    </c:choose>
	                    <c:if test="${ list.board_title.length() gt 20 }">${ list.board_title.substring(0,20) }... </c:if>
						<c:if test="${ list.board_title.length() lt 20 }">${ list.board_title } </c:if>
	                    <c:if test="${ list.board_secret eq 'Y' }"><i class="bi bi-lock-fill"></i></c:if>
	                    <c:if test="${ not empty list.board_update }"><small>(edited)</small></c:if>
	                    <c:if test="${ list.board_regdate.substring(0,10) eq today }"><span class="badge rounded-pill text-bg-warning">N</span></c:if>	                    
	                    <c:if test="${ cList[status.index] gt 0 }"><span>[${ cList[status.index] }]</span></c:if>	                    
                        </a> 
                    </td>
                    <td><c:if test="${ list.board_id eq 'admin' }"><span id="admin_id">관리자</span></c:if>
                    <c:if test="${ list.board_id ne 'admin' }"><span>${ list.board_id }</span></c:if></td>
                    <td><small>${ list.board_regdate.substring(0,10) }</small></td>
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
            <div class="col title btn-insert">
                <button type="button" class="btn btn-primary" onclick="location.href='${path}/user_qna_insert'"><i class="bi bi-pencil"></i> 글쓰기</button>
            </div>
        </div>
    </div>

    <%-- search --%>
    <div class="qna-section">
        <div class="row">
            <div class="col search">
                <form method="get" action="${ path }/user_qna_list">
                    <select name="field" class="form-select d-inline align-middle">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>카테고리</option>
                        <option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
                        <option value="content"<c:if test="${ field eq 'content' }">selected="selected"</c:if>>내용</option>
                        <option value="id"<c:if test="${ field eq 'id' }">selected="selected"</c:if>>작성자</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle search-text" value="${ keyword }" name="keyword" />
                    <select name="" class="form-select d-none align-middle search-select">
                        <option value="입양"<c:if test="${ keyword eq '입양' }">selected="selected"</c:if>>입양</option>
                        <option value="입소"<c:if test="${ keyword eq '입소' }">selected="selected"</c:if>>입소</option>
                        <option value="후원"<c:if test="${ keyword eq '후원' }">selected="selected"</c:if>>후원</option>
                        <option value="기타"<c:if test="${ keyword eq '기타' }">selected="selected"</c:if>>기타</option>
                    </select>
                    <button type="submit" class="btn btn-dark d-inline align-middle"><i class="bi bi-search"></i> 검색</button>
                    <button type="button" class="btn btn-light d-inline align-middle" onclick="location.href='${ path }/user_qna_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
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