<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/user_header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mypage.css"/>
<script src="/js/mypage.js"></script>
<%-- 여기서부터 작성 --%>

<div class="mypage_header">
    <div>
        <br><h1 class="mypage"><a id="mypage_a" href="/user_mypage_wish_list">My Page</a><a class="adopt_a" href="/user_mypage_adoptreg_list"><span id="adopt_span">입양대기목록<button id="adopt_btn" value="1"><span id="adopt_span2">1</span></button></span></a></h1>
    </div>
    <br>
    <div class="mypage_header_mid">
        <div class="profile_img">
            <img id="profile_dog" src="/image/dog.png">
        </div>
        <div class="profile_text">
            <h1>홍길동<span class="sp1"><a href="/user_mypage_user_update">회원정보변경</a></span></h1>
        </div>
        <div class="profile_text2">
            <table id="mypage_table">
                <tr>
                    <td><a class="table_a" href="/user_mypage_grade_list"><img class="mypage_img" src="/image/level.png"></a></td>
                    <td><a class="table_a" href="/user_mypage_support_list"><img class="mypage_img" src="/image/support.png"></a></td>
                    <td><a class="table_a" href="#"><img class="mypage_img" src="/image/review.png"></a></td>
                </tr>
                <tr>
                    <td><a class="table_a" href="/user_mypage_grade_list">등급</a></td>
                    <td><a class="table_a" href="/user_mypage_support_list">후원금</a></td>
                    <td><a class="table_a" href="#">후기</a></td>
                </tr>
                <tr>
                    <td><a class="table_b" href="/user_mypage_grade_list">1등급</a></td>
                    <td><a class="table_b" href="/user_mypage_support_list">30000</a></td>
                    <td><a class="table_b" href="#">0</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="mypage_middle">
    <div class="mypage_top"></div>
    <div class="mypage_menu">
        <ul class="middle_ul">
            <li><a href="/user_mypage_wish_list" class="my_a">관심목록</a></li><br><br>
            <li><a href="/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li><br><br>
            <li><a href="/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li><br><br>
            <li><a href="/user_mypage_user_update" class="my_a">회원정보변경</a></li><br><br>
            <li><a href="/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div>
    <div id="my_cont2" class="mypage_cont">
        <div align="center">
            <h3>입양대기목록</h3>
            <ul class="my_cont_ul">
                <li><img class="my_cont_img"src="/image/dog.png"></li>
                <li>강아지종</li>
                <li>입양예정일</li>
            </ul>
            <ul class="my_cont_ul">
                <li><img class="my_cont_img" src="/image/dog.png"></li>
                <li>강아지종</li>
                <li>입양예정일</li>
            </ul>
            <ul class="my_cont_ul">
                <li><img class="my_cont_img" src="/image/dog.png"></li>
                <li>강아지종</li>
                <li>입양예정일</li>
            </ul>
        </div>
    </div>
    <div class="mypage_bottom">

    </div>

</div>

<jsp:include page="../include/user_footer.jsp" />

