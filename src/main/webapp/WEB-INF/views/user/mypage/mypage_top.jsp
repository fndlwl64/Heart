<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypage_header">
    <div class="mypage-header-title">
    	<div class="mypage-mypage">
	        <a id="mypage_a" href="${path }/user_mypage_wish_list">My Page</a>
       	</div>
       	<div class="mypage-adopt">
	        <a class="adopt_a" href="${path }/user_mypage_adoptreg_list">
	        	<span id="adopt_span">입양대기목록 <button id="adopt_btn" class="btn btn-info btn-sm">
	        	<span id="adopt_span2">${Count }</span></button></span>
	       	</a>
	    </div>
    </div>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	 <div class="mypage_header_mid">
	 	<div class="mypage-header-profile">
	        <div class="profile_img">
	            <img id="profile_dog" src="${path }/resources/image/user_img/${dto.getUser_image()}">
	        </div>
	        <div class="profile_text">
	            <h1>${dto.getUser_name() }<span class="sp1 btn btn-outline-info btn-sm mx-2"><a href="${path }/user_mypage_user_update"> 회원정보변경</a></span></h1>
	        </div>
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
                    <td><a class="table_b" href="${path }/user_mypage_support_list"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${Sum}" /></a></td>
                    <td><a class="table_b" href="${path }/user_review_list">${review_Count }</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>