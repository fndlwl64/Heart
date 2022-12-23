<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="search_title" value="${ search_title }"/>
<c:set var="search_cont" value="${ search_cont }"/>
<c:set var="search_date_start" value="${ search_date_start }"/>
<c:set var="search_date_end" value="${ search_date_end }"/>
<c:set var="url" value="&search_title=${ search_title }&search_cont=${ search_cont }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order=${ order }" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path }/resources/css/notice.css">
<%-- 여기서부터 작성 --%>
<div class="notice-board">
    <div align="center">
        <div class="notice-title">
            <span>공지사항</span>
            <p>HeartPet의 공지사항 게시판입니다.</p>
        </div>
        <%-- 검색 폼 --%>
        <div class="mb-3">
        <form class="search_form" method="post" action="${path }/user_notice">
            <div class="form_box">            	
            	<div class="search-table-box">
            	    <div class="search-semi-title">
		                <span><i class="bi bi-search-heart-fill"></i> 공지 검색</span>
		            </div>      
	                <table class="table table-sm" id="search-table">
	                    <tr>
	                        <th width="8.5%">제목</th>
	                        <td width="16.5%"><input type="text" class="form-control" name="search_title" value="${ search_title }" /></td>
	                        <th width="8.5%">내용</th>
	                        <td width="16.5%"><input type="text" class="form-control" name="search_cont" value="${ search_cont }" /></td>
	                        <th width="10%">작성일자</th>
	                        <td width="40%">
		                        <div class="notice-date">
			                        <input type="date" class="form-control" name="search_date_start" value="${ search_date_start }" />
			                        <input type="date" class="form-control" name="search_date_end" value="${ search_date_end }" />
		                        </div>
	                        </td>
	                    </tr>                                                           
	                </table>
					<div class="search-buttons">
			            <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
						<button class="btn btn-light" type="button" onclick="location.href='${ path }/user_notice'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
		            </div>   
				</div>
            </div>
        </form>
		</div>
        
        <%-- 정렬 & 게시물 수 --%>
        <div>
	    <%-- <form class="order_form" method="get" action="${path}/user_notice">   --%>  
	       <div class="notice-section2">
	       		<div class="row">
		            <div class="col total-data">
		                <select class="form-select form-select-sm" name="order" onchange="location.href='${path}/user_notice?page=${ paging.page }&search_title=${ search_title }&search_cont=${ search_cont }&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }&order='+this.value;">
		                   <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
		                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신게시일순</option>
		                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>조회수높은순</option>
		                </select>
		            </div>
	            </div>
	        </div>
	    <!-- </form> -->
	    </div>
        <table class="table table-hover table-bordered notice-main-table">
            <tr class="table-light">
                <th width="10%">No</th>
                <th width="65%">제목</th>
                <th width="15%">게시일</th>
                <th width="10%">조회수</th>
            </tr>
            <c:if test="${!empty List}">
                <c:forEach items="${List }" var="dto">
            <tr>
                <td>${dto.getNotice_no()}</td>
                <td class="notice-table-title"><a href="${path }/user_notice_content?no=${dto.getNotice_no() }">${dto.getNotice_title() }</a></td>
                <td><small>${dto.getNotice_date().substring(0, 10) }</small></td>
                <td>${dto.getNotice_hit() }</td>
            </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${empty List}">
            <h3>공지사항이없습니다.</h3>
        </c:if>
    </div>
    <br>
    <%-- 페이징처리 --%>
    <%-- <jsp:include page="../../include/pagination.jsp" /> --%>
    <%@ include file="../../include/pagination_update.jsp" %>
</div>
<jsp:include page="../../include/user_footer.jsp" />
