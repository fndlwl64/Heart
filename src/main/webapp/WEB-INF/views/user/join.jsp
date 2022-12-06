<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/sign_in_up.css">
<script src="${path}/resources/js/signin_up.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="../include/user_header.jsp" />

    <div class="container">
    

        <div class="title">
        <h3> HeartPet 회원가입 </h3>
        </div>
        <br>

        <div class="join_div">

            <form class="join_form" method="post" action="${path}/joinOk">

                <table class="table join_table">

                    <tr>
                        <th>아이디</th>
                        <td>
                            <input class="text" name="user_id" size="40" required>
                            <span class="id"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input class="text" type="password" name="user_pwd" size="40" required>
                            <span class="pwd"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>이름</th>
                        <td>
                            <input class="text" name="user_name" size="40" required>
                            <span class="name"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>등급</th>
                        <td>
                            <input class="text" name="user_grade" type="radio" checked disabled> 일반 회원
                            <span class="grade"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>이메일</th>
                        <td>
                            <input class="text" name="user_email" size="40" required>
                            <span class="email"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>연락처</th>
                        <td>
                            <input class="text" name="user_phone" size="40" required>
                            <span class="phone"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>주소</th>
                        <td>
                            <input class="text zipcode" type="text" id="sample6_postcode" placeholder="우편번호">
                            <input class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            <input class="text addr1" name="addr1" type="text" id="sample6_address" placeholder="주소"><br>
                            <input class="text addr3" name="addr2" type="text" id="sample6_detailAddress" placeholder="상세주소">
                            <input class="text addr2" name="addr3" type="text" id="sample6_extraAddress" placeholder="참고항목">
                        </td>
                    </tr>

                    <tr>
                        <th>반려동물경험</th>
                        <td>
                            <input class="text" name="user_dogexp" type="radio"> 유
                            <input class="text" name="user_dogexp" type="radio"> 무
                            <span class="dogexp"></span>
                        </td>
                    </tr>

                </table>

                <input class="btn btn-secondary" type="button" value="가입">

            </form>

        </div>


    </div>
    <br>
    <jsp:include page="../include/user_footer.jsp" />
