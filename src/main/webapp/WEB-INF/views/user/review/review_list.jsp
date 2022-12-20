<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="rList" value="${ reviewList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="cList" value="${ commentList }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_review_list" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_review.css" />
<script src="${path}/resources/js/user_review_list.js"></script>

<%-- 리뷰 --%>
<%-- review list --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col-2 space"></div>
            <div class="col-8 title">
                <h2>하트펫 family</h2>
                <h6>하트펫을 통해 반려동물을 만나 가족이 된 이야기를 들어보세요.</h6>
            </div>
            <div class="col-2 space"></div>
        </div>
    </div>
    
    <div class="review-section">
        <div class="row">
            <div class="col-2 space"></div>
            <div class="col-8 title">
            	<form action="${path}/user_review_list" method="get" >
            	<input type="hidden" name="animal_tag" />
			    	<button type="button" class="btn btn-info animal-button" onclick="location.href='${path}/user_review_list'"><i class="bi bi-clipboard-heart"></i> 전체</button>
			    	<button type="submit" class="btn btn-info animal-button" value="dog" onclick="return animalChange(this.value)"><i class="bi bi-search-heart"></i> 강아지</button>
			    	<button type="submit" class="btn btn-info animal-button" value="cat" onclick="return animalChange(this.value)"><i class="bi bi-search-heart-fill"></i> 고양이</button>
		    	</form>
            </div>
            <div class="col-2 space"></div>
        </div>
    </div>

	<!-- 정렬 -->
    <div class="review-section">
        <div class="row">
            <div class="col-2 space"></div>
            <div class="col-7 total-data d-flex"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span></div>
            <div class="col-1 review_order d-flex">
                <select class="form-select form-select-sm w-75 order" name="order">
                    <option selected="selected" value="date_desc">최신순</option>
                    <option value="hit_desc">조회수순</option>
                    <option value="no_desc">번호순</option>
                </select>
            </div>
            <div class="col-2 space"></div>
        </div>
    </div>

    <div class="review-section">
       <div class="row">
           <div class="col-2 space"></div>
           <div class="col-8 review-card">
           
               <%-- 입양동물 --%>
                <div class="row row-cols-1 row-cols-md-4 g-4">             
                    <c:if test="${ not empty rList }">
                    <c:forEach items="${ rList }" var="list" varStatus="status">
	                    <div class="col">
	                        <div class="card h-100">
	                            <a href="${path}/user_review_content?review_no=${ list.review_no }">
	                            <c:choose>
	                            <c:when test="${ not empty list.review_img1 }">
	                               <div class="card-image" style="background-image: url('${ path }${ list.review_img1 }')"></div>
	                            </c:when>
	                            <c:when test="${ not empty list.review_img2 }">
	                               <div class="card-image" style="background-image: url('${ path }${ list.review_img2 }')"></div>
	                            </c:when>
	                            <c:when test="${ not empty list.review_img3 }">
	                               <div class="card-image" style="background-image: url('${ path }${ list.review_img3 }')"></div>
	                            </c:when>                                                        
	                            </c:choose>
		                        <div class="card-body">                              
		                            <div class="title-body">
		                                <h5 class="card-title">${ list.animal_name } 입양후기 
		                                <c:if test="${ cList[status.index] gt 0 }"><span class="comment-count">[${ cList[status.index] }]</span></c:if></h5>		                                                                                           
		                            </div>
		                            <h7>${ list.review_regdate.substring(0,10) } 조회 ${ list.review_hit }</h7>
		                        </div>
	                           </a>
	                       </div>
	                   </div>
                   </c:forEach>
                   </c:if>
                   <c:if test="${ empty rList }">
                  	 No data
                   </c:if>                   
               </div>
           </div>
       </div>
    </div>

    <div class="space-add"></div>

    <%-- search --%>
    <div class="review-section">
        <div class="row">
            <div class="col-4 space"></div>
            <div class="col-4 search">
                <form method="get" action="${ path }/user_review_list">
                    <select name="field" class="form-select d-inline align-middle w-25">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>구분</option>
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
    <%-- 페이지 링크 처리 예정 --%>    
	<jsp:include page="../../include/pagination.jsp" />

</div>

<jsp:include page="../../include/user_footer.jsp" />
