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

            <form class="join_form" method="post" action="${path}/joined">
				<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 10) %></c:set>
				<input type="hidden" name="user_image" value="${ran}.png" />
				
                <table class="table join_table">

                    <tr>
                        <th>아이디</th>
                        <td>
                            <input id="input_id" class="form-control" name="user_id" size="40" required>
                            <span id="join_id" class="user_id"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input id="input_pwd" class="form-control" type="password" name="user_pwd" size="40" required>
                            <span id="join_pwd" class="user_pwd"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>이름</th>
                        <td>
                            <input id="input_name" class="form-control" name="user_name" size="40" required>
                            <span id="join_name" class="user_name"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>등급</th>
                        <td>
                            <input class="text" name="user_grade" type="radio" value=3 checked> 일반 회원
                        </td>
                    </tr>

                    <tr>
                        <th>이메일</th>
                        <td>
                            <input id="input_email" class="form-control" name="user_email" size="40" placeholder="email@gmail.com" required>
                            <span id="join_email" class="user_email"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>연락처</th>
                        <td>
                            <input id="input_phone" class="form-control" name="user_phone" size="40" placeholder="010-0000-000" required>
                            <span id="join_phone" class="user_phone"></span>
                        </td>
                    </tr>

                    <tr>
                        <th>주소</th>
                        <td>
			                <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_postcode" placeholder="우편번호" required>
		                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_address" placeholder="주소" required><br>
		                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_detailAddress" placeholder="상세주소" required>
		                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_extraAddress" placeholder="참고항목" required>
		                </td>
                    </tr>

                    <tr>
                        <th>반려동물경험</th>
                        <td>
                            <input class="text" name="user_animalexp" type="radio" value="Y"> 유
                            <input class="text" name="user_animalexp" type="radio" value="N"> 무
                            <span id="join_animalexp" class="user_dogexp"></span>
                        </td>
                    </tr>

                </table>
                
				<button class="btn btn-warning" type="reset"><i class="bi bi-pencil"></i> 리셋</button>
				<button id="join_btn" class="btn btn-primary" type="submit"><i class="bi bi-save"></i> 가입</button>
								
            </form>

        </div>


    </div>
    <br>
    <jsp:include page="../include/user_footer.jsp" />
