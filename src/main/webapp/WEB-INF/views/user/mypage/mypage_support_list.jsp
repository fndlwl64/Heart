<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/user_header.jsp" />
<script src="resources/js/mypage.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="search_date_start" value="${ search_date_start }"/>
<c:set var="search_date_end" value="${ search_date_end }"/>
<c:set var="url" value="&search_date_start=${ search_date_start }&search_date_end=${ search_date_end }"/>
<link rel="stylesheet" href="resources/css/mypage.css"/>
<%-- 여기서부터 작성 --%>

<%-- <div class="mypage_header">
    <div>
        <br><h1 class="mypage"><a id="mypage_a" href="${path }/user_mypage_wish_list">My Page</a><a class="adopt_a" href="${path }/user_mypage_adoptreg_list"><span id="adopt_span">입양대기목록<button id="adopt_btn"><span id="adopt_span2">${Count }</span></button></span></a></h1>
    </div>
    <br>
     <div class="mypage_header_mid">
        <div class="profile_img">
            <img id="profile_dog" src="${path }/resources/image/user_img/${dto.getUser_image()}">
        </div>
        <div class="profile_text">
            <h1>${dto.getUser_name() }<span class="sp1"><a href="${path }/user_mypage_user_update">회원정보변경</a></span></h1>
        </div>
        <div class="profile_text2">
            <table id="mypage_table">
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list"><img class="mypage_img" src="${path }/resources/image/level.png"></a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list"><img class="mypage_img" src="${path }/resources/image/support.png"></a></td>
                    <td><a class="table_a" href="${path }/user_review_list"><img class="mypage_img" src="${path }/resources/image/review.png"></a></td>
                </tr>
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list">등급</a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list">후원금</a></td>
                    <td><a class="table_a" href="${path }/user_review_list">후기</a></td>
                </tr>
                <tr>
                    <td><a class="table_b" href="${path }/user_mypage_grade_list">${dto.getUser_grade()}등급</a></td>
                    <td><a class="table_b" href="${path }/user_mypage_support_list">${Sum }</a></td>
                    <td><a class="table_b" href="${path }/user_review_list">${review_Count }</a></td>
                </tr>
            </table>
        </div>
    </div>
</div> --%>
<%@ include file="mypage_top.jsp" %>
<div class="mypage_middle">
    <div class="mypage_top"></div>
<%--     <div class="mypage_menu">
        <ul class="middle_ul">
            <li><a href="${path }/user_mypage_wish_list" class="my_a">관심목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li><br><br>
            <li><a href="${path }/user_mypage_user_update" class="my_a">회원정보변경</a></li><br><br>
            <li><a href="${path }/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div> --%>
    <%@ include file="mypage_menu.jsp" %>
	    <div id="my_cont2" class="mypage_cont">
	    	<h3>후원내역</h3>	
	    	<form method="post" action="${path }/user_mypage_support_list">    	
		    	<div align="center">
		    		<table style="width: 400px;">
		    			<tr>
		    				<td colspan="3">
		    					<h6 style="display: block;">기간별 총액 확인하기</h6>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>
		    					<input class="form-control" type="date" name="search_date_start" value="${ search_date_start }">
		    				</td>
		    				<td>
		    					<input class="form-control" type="date" name="search_date_end" value="${ search_date_end }">
		    				</td>
		    				<td>
		    					<button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td colspan="3" style="text-align: right;">
		    					<strong>기간별 후원 금액 합 : <fmt:formatNumber value="${ dateSum }" /> 원</strong>
		    				</td>
		    			</tr>
		    		</table>
		    	</div>
	    	</form>
	        <div class="support-money-div">	   
	        <c:if test="${!empty List}">     	
	            <table class="table support-money-table">
	                <tr>
	                    <th width="20%" class="table-secondary"><span class="sp2">No</span></th>
	                    <th width="40%" class="table-secondary"><span class="sp2">후원금액</span></th>
	                    <th width="30%" class="table-secondary"><span class="sp2">후원일</span></th>	
	                </tr>
	                
	                <c:forEach items="${List }" var="dto">
		            <tr>
		            	<td>${dto.getSupport_no()}</td>
		                <td><fmt:formatNumber value="${dto.getSupport_price()}" /> 원</td>
		                <td><small>${dto.getSupport_date().substring(0,10) }</small></td>
		            </tr>
		                </c:forEach>
		            <tr>
		            	<th class="align-right" colspan="3"><strong>후원금액 합계 : <fmt:formatNumber value="${ Sum }" /> 원</strong></th>
		            </tr>
		            
		            </table>
	            </c:if>
	            <c:if test="${empty List}">
	            	<h3>후원내역이 없습니다.</h3>
	      		</c:if>
	        	</div>
	        	
	        <%-- 페이징처리 --%>
	        <c:if test="${!empty List}">
	    	<%-- <jsp:include page="../../include/pagination.jsp" /> --%>
	    	<%@ include file="../../include/pagination_update.jsp" %>
	    	</c:if>
	    </div>
    </div>
    <!-- mypage-body end 부분  -->
    <div class="mypage_bottom">
    </div>	
</div>

<jsp:include page="../../include/user_footer.jsp" />

