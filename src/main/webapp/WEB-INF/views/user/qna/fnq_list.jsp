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
<c:set var="link_address" value="${pageContext.request.contextPath}/user_fnq_list" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />

<%-- fnq list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">FAQ</div>
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
                    <option value="hit_desc">인기순</option>
                    <option value="no_desc">번호순</option>
                </select>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- 아코디언 --%>
    <!-- FAQ -->
    <div class="accordion accordion-flush" id="accordionFlushExample">
    	<c:if test="${ not empty fList }">
    	<c:forEach items="${ fList }" var="list" varStatus="status" >
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-heading${ status.count }">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${ status.count }" aria-expanded="false" aria-controls="flush-collapse${ status.count }">
                    ${ list.fnq_question }
                </button>
            </h2>
            <div id="flush-collapse${ status.count }" class="accordion-collapse collapse" aria-labelledby="flush-heading${ status.count }" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    ${ list.fnq_answer }
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
            <div class="col-4 space"></div>
            <div class="col-4 search">
                <form method="get" action="${path}/user_fnq_list?field=${ field }&keyword=${ keyword }"">
                    <select name="field" class="form-select d-inline align-middle w-25">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>카테고리</option>
                        <option value="question"<c:if test="${ field eq 'question' }">selected="selected"</c:if>>질문</option>
                        <option value="answer"<c:if test="${ field eq 'answer' }">selected="selected"</c:if>>답변</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle w-50" name="keyword" value="${ keyword }" />
                    <button type="submit" class="btn btn-dark align-middle d-inline"><i class="bi bi-search"></i> 검색</button>
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