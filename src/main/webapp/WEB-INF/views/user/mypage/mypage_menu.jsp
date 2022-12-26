<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="mypage-body">
    <div class="mypage_menu">
    	<span class="mypage-pin"><i class="bi bi-pin-angle-fill"></i></span>
        <ul class="middle_ul">
            <li><a href="${path }/user_mypage_wish_list" class="my_a">관심목록</a></li>
            <li><a href="${path }/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li>
            <li><a href="${path }/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li>
            <li><a href="${path }/user_mypage_user_update" class="my_a">회원정보변경</a></li>
            <li><a href="${path }/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div>