<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/user_header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="resources/js/mypage.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="resources/css/mypage.css"/>
<%-- 여기서부터 작성 --%>

<div class="mypage_header">
    <div>
        <br><h1 class="mypage"><a id="mypage_a" href="/user_mypage_wish_list">My Page</a><a class="adopt_a" href="${path }/user_mypage_adoptreg_list"><span id="adopt_span">입양대기목록<button id="adopt_btn" value="1"><span id="adopt_span2">1</span></button></span></a></h1>
    </div>
    <br>
    <div class="mypage_header_mid">
        <div class="profile_img">
            <img id="profile_dog" src="${path }/resources/image/dog.png">
        </div>
        <div class="profile_text">
            <h1>홍길동<span class="sp1"><a href="${path }/user_mypage_user_update">회원정보변경</a></span></h1>
        </div>
        <div class="profile_text2">
            <table id="mypage_table">
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list"><img class="mypage_img" src="${path }/resources/image/level.png"></a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list"><img class="mypage_img" src="${path }/resources/image/support.png"></a></td>
                    <td><a class="table_a" href="#"><img class="mypage_img" src="${path }/resources/image/review.png"></a></td>
                </tr>
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list">등급</a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list">후원금</a></td>
                    <td><a class="table_a" href="#">후기</a></td>
                </tr>
                <tr>
                    <td><a class="table_b" href="${path }/user_mypage_grade_list">1등급</a></td>
                    <td><a class="table_b" href="${path }/user_mypage_support_list">30000</a></td>
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
            <li><a href="${path }/user_mypage_wish_list" class="my_a">관심목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li><br><br>
            <li><a href="${path }/user_mypage_user_update" class="my_a">회원정보변경</a></li><br><br>
            <li><a href="${path }/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div>
    <div id="my_cont5" class="mypage_cont">
        <div class="row g-3 align-items-center" style=" margin-top: 210px; margin-left: 800px; margin-right: 800px;">
            <form method="post" action="<%=request.getContextPath()%>/send.do">
                <div class="mb-3">
                    <label for="receiver" class="col-form-label">이메일 인증</label>
                </div>

                <div class="mb-3">
                    <input type="text" id="receiver" name="receiver" value="soopwe2@naver.com" class="form-control" aria-describedby="passwordHelpInline" readonly="readonly" /><br>
                    <input class="btn btn-primary" id="submit" type="submit"  value="인증번호발송">
                </div>

                <div class="mb-3">
                    <%--랜덤으로 임의의 숫자 5자리를 생성하는 메서드작성--%>
                    <%! public int getRandom(){
                        int random = 0;
                        random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
                        return random;
                    }
                    %>
                    <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
                </div>
            </form>
        </div>
    </div>
    <div class="mypage_bottom">

    </div>

</div>

<jsp:include page="../include/user_footer.jsp" />

