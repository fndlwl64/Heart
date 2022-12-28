<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/admin_update.css" />
<script src="${path}/resources/js/admin_user_update.js"></script>
<script src="${path }/resources/js/signin_up.js"></script>
    
<body>
	
	<jsp:include page="../../include/admin_header.jsp" />
	
	<br><br>
	
	<div class="container">
	    
	    <form method="post" action="${path}/user_updated">
	        
	        <table class="table">
	            <tr>
	                <th class="table-light">아이디</th>
	                <td><input class ="input1" name="user_id" type="text" value="${cont.user_id}"   readonly></td>
	            </tr>
	            <tr>
	                <th class="table-light">이름</th>
	                <td><input class ="input1" name="user_name" type="text" value="${cont.user_name}"   readonly></td>
	            </tr>
	            <tr>
	                <th class="table-light">등급</th>
	                <c:set var="grade" value="${cont.user_grade}" />
	                <td>
	                
	                	<select name="user_grade" id="select_value">
	                		<option  value="">--선택--</option>
	                		<option value="1" <c:if test="${cont.user_grade eq 1 }">selected</c:if>> 1등급 [관리자]</option>
	                		<option value="2" <c:if test="${cont.user_grade eq 2 }">selected</c:if>>2등급 [우수회원]</option>
	                		<option value="3" <c:if test="${cont.user_grade eq 3 }">selected</c:if>>3등급 [일반회원]</option>
	                		<option value="4" <c:if test="${cont.user_grade eq 4 }">selected</c:if>>4등급 [블랙리스트]</option>
	                		<option value="5" <c:if test="${cont.user_grade eq 5 }">selected</c:if>>5등급 [탈퇴회원]</option>
	                	</select>
	                </td>
	            </tr>
	            <tr>
	                <th class="table-light">이메일</th>
	                <c:if test="${empty cont.user_email }">
	                	<td><input class ="input1" name="user_email" type="text" value="${cont.user_email}"   placeholder="카카오 로그인 회원. 이메일 입력 요망"></td>
	                </c:if>
	                <c:if test="${!empty cont.user_email }">
	                	<td><input class ="input1" name="user_email" type="text" value="${cont.user_email}"  ></td>
	                </c:if>
	            </tr>
	            <tr>
	                <th class="table-light">연락처</th>
	                <c:if test="${empty cont.user_phone }">
	                	<td><input class ="input1" name="user_phone" type="text" value="${cont.user_phone}"   placeholder="SNS 로그인 회원. 연락처 입력 요망"></td>
	                </c:if>
	                <c:if test="${!empty cont.user_phone }">
	                	<td><input class ="input1" name="user_phone" type="text" value="${cont.user_phone}"  ></td>
	                </c:if>
	            </tr>
	            <tr>
	                <c:set var="addr" value="${cont.user_addr }"/>
	                <th class="table-light">주소</th>
	                <c:if test="${empty addr }">
	                <td>
		                <input class="input1 zipcode" name="user_addr" type="text" id="sample6_postcode" placeholder="우편번호" required>
	                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_address" placeholder="주소" required><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_detailAddress" placeholder="상세주소" required>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_extraAddress" placeholder="참고항목" required>
	                </td>
	                </c:if>
	                
	                <c:if test="${!empty addr }">
	                <td>
		                <input class="input1 zipcode" name="user_addr" type="text" id="sample6_postcode" value="${fn:split(addr,',')[0]}"  >
	                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_address" value="${fn:split(addr,',')[1]}"  ><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_detailAddress" value="${fn:split(addr,',')[2]}"  >
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_extraAddress" value="${fn:split(addr,',')[3]}"  >
	                </td>
	                </c:if>
	            </tr>
	            <tr>
	                <th class="table-light">후원금액</th>
	                <td><input class ="input1" name="user_totalprice" type="text" value="${cont.user_totalprice}"  ></td>
	            </tr>
	            <tr>
	                <th class="table-light">반려동물경험</th>
	                <td>
	                <c:if test="${'Y' eq cont.user_animalexp }">
	                	<input class ="expcss" name="user_animalexp" type="radio" value="Y" checked> Y
	                	<input class ="expcss" name="user_animalexp" type="radio" value="N"> N
	                </c:if>
	                <c:if test="${'N' eq cont.user_animalexp }">
	                	<input class ="expcss" name="user_animalexp" type="radio" value="Y"> Y
	                	<input class ="expcss" name="user_animalexp" type="radio" value="N" checked> N
	                </c:if>
	                <c:if test="${null eq cont.user_animalexp }">
	                	<label class ="expcss"><input name="user_animalexp" type="radio" value="Y"> Y</label>
	                	<label class ="expcss"><input name="user_animalexp" type="radio" value="N"> N</label>
	                </c:if>
	                </td>
	            </tr>
	        </table>
	       
	        <div class="btns">
				<div>
					<button class="btn btn-dark insertbtn mb-3"><i class="bi bi-card-list"></i> 목록</button>
				</div>	
				<div>
					<button class="btn btn-warning insertbtn mb-3"><i class="bi bi-pencil"></i> 리셋</button>
					<button class="btn btn-success insertbtn mb-3"><i class="bi bi-eraser"></i> 수정</button>
				</div>
			</div>
	    </form>
	    
	</div>
	
</body>
</html>