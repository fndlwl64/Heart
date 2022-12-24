<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="rList" value="${ reviewList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="animal_tag" value="${ animal_tag }" />
<c:set var="order" value="${ order }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="cList" value="${ commentList }" />
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&animal_tag=${ animal_tag }&order=${ order }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_review_list" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_review.css" />
<script src="${path}/resources/js/user_review_list.js"></script>
<script src="${path}/resources/js/admin_search.js"></script>

<%-- 리뷰 --%>
<%-- review list --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col title">
                <h2>하트펫 family</h2>
                <h6>하트펫을 통해 반려동물을 만나 가족이 된 이야기를 들어보세요.</h6>
            </div>
        </div>
    </div>
    
    <div class="review-section">
        <div class="row">
            <div class="col title">
            	<form action="${path}/user_review_list" method="get" >
            	<input type="hidden" name="animal_tag" />
			    	<button type="button" class="btn btn-light animal-button" onclick="location.href='${path}/user_review_list'"><i class="bi bi-clipboard-heart"></i> 전체</button>
			    	<button type="submit" class="btn btn-light animal-button" value="dog" onclick="return animalChange(this.value)"><i class="bi bi-search-heart"></i> 강아지</button>
			    	<button type="submit" class="btn btn-light animal-button" value="cat" onclick="return animalChange(this.value)"><i class="bi bi-search-heart-fill"></i> 고양이</button>
		    	</form>
            </div>
        </div>
    </div>

	<!-- 정렬 -->
    <div class="review-section">
        <div class="row">
            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
                <select class="form-select form-select-sm order" name="order" onchange="location.href='${ path }/user_review_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&animal_tag=${ animal_tag }&order='+this.value;">
                    <option selected="selected" value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신순</option>
                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>인기순</option>
                    <option value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호순</option>
                    <option value="title_desc"<c:if test="${ order eq 'title_desc' }">selected="selected"</c:if>>가나다순</option>                    
                </select>
            </div>
        </div>
    </div>
    
    <div class="review-section review-main mb-5">
       <div class="row">
           <div class="col review-card">
           
               <%-- 입양동물 --%>
                <div class="row row-cols-1 row-cols-md-3 g-2">             
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
		                                <c:if test="${ not empty list.review_img1 || not empty list.review_img2 || not empty list.review_img3 }"><i class="bi bi-paperclip"></i></c:if>
                                        <c:if test="${ not empty list.review_video }"><i class="bi bi-film"></i></c:if>
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

    <%-- search --%>
    <div class="review-section mb-4">
        <div class="row">
            <div class="col search">
                <form method="get" action="${ path }/user_review_list">
                    <select name="field" class="form-select d-inline align-middle">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="category"<c:if test="${ field eq 'category' }">selected="selected"</c:if>>구분</option>
                        <option value="title"<c:if test="${ field eq 'title' }">selected="selected"</c:if>>제목</option>
                        <option value="content"<c:if test="${ field eq 'content' }">selected="selected"</c:if>>내용</option>
                        <option value="id"<c:if test="${ field eq 'id' }">selected="selected"</c:if>>작성자</option>
                        <option value="animal"<c:if test="${ field eq 'animal' }">selected="selected"</c:if>>반려동물명</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle search-text" name="keyword"                    
                        value=<c:if test="${ keyword ne 'dog' && keyword ne 'cat' }">"${ keyword }"</c:if>>
                    <select name="" class="form-select d-none align-middle search-select">
                        <option value="dog"<c:if test="${ keyword eq 'dog' }">selected="selected"</c:if>>강아지</option>
                        <option value="cat"<c:if test="${ keyword eq 'cat' }">selected="selected"</c:if>>고양이</option>
                    </select>
                    <button type="submit" class="btn btn-dark d-inline align-middle"><i class="bi bi-search"></i> 검색</button>
                    <button type="button" class="btn btn-light d-inline align-middle" onclick="location.href='${ path }/user_review_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
                </form>
            </div>
        </div>
    </div>
    
    <%-- 페이징 --%>    
    <%@ include file="../../include/pagination_update.jsp" %>
    
</div>

<jsp:include page="../../include/user_footer.jsp" />
