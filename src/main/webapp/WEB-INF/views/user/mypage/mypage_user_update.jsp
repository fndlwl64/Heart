<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="resources/js/mypage.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<link rel="stylesheet" href="resources/css/mypage.css"/>
<%-- 여기서부터 작성 --%>

<div class="mypage_header">
    <div>
        <br><h1 class="mypage"><a id="mypage_a" href="${path }/user_mypage_wish_list">My Page</a><a class="adopt_a" href="${path }/user_mypage_adoptreg_list"><span id="adopt_span">입양대기목록<button id="adopt_btn"><span id="adopt_span2">${Count }</span></button></span></a></h1>
    </div>
    <br>
    <div class="mypage_header_mid">
        <div class="profile_img">
            <img id="profile_dog" src="${path }/resources/image/dog.png">
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
</div>
<div class="mypage_middle">
    <div class="mypage_top"></div>
    <div class="mypage_menu">
        <ul class="middle_ul">
            <li><a href="${path }/user_mypage_wish_list" class="my_a">관심목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li><br><br>
            <li><a href="${path }/user_mypage_user_update" class="my_a">회원정보변경</a></li><br><br>
            <li><a href="${path }/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div>
    <div id="my_cont4" class="mypage_cont">
        <div align="center">
            <form method="post" action="${path }/user_mypage_user_update2">
                <h3>회원정보변경</h3>
                <table class="table">
                    <tr>
                        <th class="table-secondary"><span class="sp2">아이디</span></th>
                        <td><input name="user_id" class ="input1" type="text" value="${dto.getUser_id()}" readonly></td>
                    </tr>
                    <tr>
                        <th class="table-secondary"><span class="sp2">이름</span></th>
                        <td><input name="user_name"class ="input1" type="text" value="${dto.getUser_name()}"></td>
                    </tr>
                    <tr>
                        <th class="table-secondary"><span class="sp2">이메일</span></th>
                        <td><input name="user_email" class ="input1" type="text" value="${dto.getUser_email()}"></td>
                    </tr>
                    <tr>
                        <th class="table-secondary"><span class="sp2">연락처</span></th>
                        <td><input name="user_phone" class ="input1" type="text" value="${dto.getUser_phone()}"></td>
                    </tr>
                    <tr>
                        <th class="table-secondary"><span class="sp2">주소</span></th>
                        <td><input name="user_addr" class ="input1" type="text" value="${dto.getUser_addr()}"></td>
                    </tr>
                    <tr>
                        <th class="table-secondary"><span class="sp2">반려동물경험</span></th>
                        <td><input name="user_animalexp" class ="input1" type="text" value="${dto.getUser_animalexp()}"></td>
                    </tr>
                </table>
                <br>
                <input class="btn btn-primary" id="update_btn" type="submit" value="변경" align="center">
            </form>
        </div>
    </div>
    <div class="mypage_bottom">

    </div>

</div>

<jsp:include page="../../include/user_footer.jsp" />

