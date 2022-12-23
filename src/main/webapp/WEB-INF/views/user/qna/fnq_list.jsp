<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="fList" value="${ fnqList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_fnq_list" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />
<script src="${path}/resources/js/admin_search.js"></script>


<%-- fnq list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="qna-title">
			<span>FNQ</span>
			<p>HeartPet의 자주 묻는 질문 게시판입니다.</p>
		</div>
    </div>
    
    <%-- 정렬 --%>
    <form class="order_form" method="get" action="${path}/user_fnq_list">        	
    <div class="qna-section">
        <div class="row">
            <div class="col total-data">
                <span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
                <select class="form-select form-select-sm order" name="order" onchange="this.form.submit()">
                    <option selected="selected" value="no_desc" <c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호순</option>
                    <option value="question_desc" <c:if test="${ order eq 'question_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
    </div>
    </form>

    <%-- 아코디언 --%>
    <!-- FAQ -->
    <div class="accordion accordion-flush" id="accordionFlushExample">
    	<c:if test="${ not empty fList }">
    	<c:forEach items="${ fList }" var="list" varStatus="status" >
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-heading${ status.count }">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${ status.count }" aria-expanded="false" aria-controls="flush-collapse${ status.count }">
                    <strong>Q.&nbsp;</strong> ${ list.fnq_question }
                </button>
            </h2>
            <div id="flush-collapse${ status.count }" class="accordion-collapse collapse" aria-labelledby="flush-heading${ status.count }" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>A.&nbsp;</strong>${ list.fnq_answer }
                </div>
            </div>
        </div>
        </c:forEach>
        </c:if>
        <c:if test="${ empty fList }">
        	No data
        </c:if>
    </div>
    <br>

    <%-- search --%>
    <div class="qna-section">
        <div class="row">
            <div class="col search">
                <form method="get" action="${path}/user_fnq_list">
                    <select name="field" class="form-select d-inline align-middle">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>카테고리</option>
                        <option value="question"<c:if test="${ field eq 'question' }">selected="selected"</c:if>>질문</option>
                        <option value="answer"<c:if test="${ field eq 'answer' }">selected="selected"</c:if>>답변</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle search-text" value="${ keyword }" name="keyword" />
                    <select name="" class="form-select d-none align-middle search-select">
                        <option value="입양"<c:if test="${ keyword eq '입양' }">selected="selected"</c:if>>입양</option>
                        <option value="입소"<c:if test="${ keyword eq '입소' }">selected="selected"</c:if>>입소</option>
                        <option value="후원"<c:if test="${ keyword eq '후원' }">selected="selected"</c:if>>후원</option>
                        <option value="기타"<c:if test="${ keyword eq '기타' }">selected="selected"</c:if>>기타</option>
                    </select>                    
                    <button type="submit" class="btn btn-dark align-middle d-inline"><i class="bi bi-search"></i> 검색</button>
                    <button type="button" class="btn btn-light d-inline align-middle" onclick="location.href='${ path }/user_fnq_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>                    
                </form>
            </div>
        </div>
    </div>
    <!-- 페이징 처리 부분 -->    
    <%@ include file="../../include/pagination_update.jsp" %>
</div>

<jsp:include page="../../include/user_footer.jsp" />
