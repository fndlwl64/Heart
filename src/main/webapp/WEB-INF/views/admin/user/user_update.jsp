<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
</head>
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/admin_update.css" />
<body>
	
	<jsp:include page="../../include/admin_header.jsp" />
	
	<br><br>
	
	<div class="div1">
	    
	    <form method="post" action="${path}/user_updated">
	        
	        <table class="table">
	            <tr>
	                <th class="table-secondary">아이디</th>
	                <td><input class ="input1" name="user_id" type="text" value="${cont.user_id}" size="40" readonly></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">이름</th>
	                <td><input class ="input1" name="user_name" type="text" value="${cont.user_name}" size="40" readonly></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">등급</th>
	                <td>
	                	<select name="user_grade">
	                		<option value="1">1등급 [관리자]</option>
	                		<option value="2">2등급 [우수회원]</option>
	                		<option value="3">3등급 [일반회원]</option>
	                		<option value="4">4등급 [블랙리스트]</option>
	                		<option value="5">5등급 [탈퇴회원]</option>
	                	</select>
	                	<input class="input1" name="user_grade" type="text" value="${cont.user_grade }" size="40" />
	                </td>
	            </tr>
	            <tr>
	                <th class="table-secondary">이메일</th>
	                <c:if test="${empty cont.user_email }">
	                	<td><input class ="input1" name="user_email" type="text" value="${cont.user_email}" size="40" placeholder="카카오 로그인 회원. 이메일 입력 요망"></td>
	                </c:if>
	                <c:if test="${!empty cont.user_email }">
	                	<td><input class ="input1" name="user_email" type="text" value="${cont.user_email}" size="40"></td>
	                </c:if>
	            </tr>
	            <tr>
	                <th class="table-secondary">연락처</th>
	                <c:if test="${empty cont.user_phone }">
	                	<td><input class ="input1" name="user_phone" type="text" value="${cont.user_phone}" size="40" placeholder="SNS 로그인 회원. 연락처 입력 요망"></td>
	                </c:if>
	                <c:if test="${!empty cont.user_phone }">
	                	<td><input class ="input1" name="user_phone" type="text" value="${cont.user_phone}" size="40"></td>
	                </c:if>
	            </tr>
	            <tr>
	                <th class="table-secondary">주소</th>
	                <c:if test="${empty cont.user_addr }">
	                <td>
		                <input class="input1 zipcode" type="text" id="sample6_postcode" placeholder="우편번호" required>
	                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_address" placeholder="주소" required><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_detailAddress" placeholder="상세주소" required>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_extraAddress" placeholder="참고항목" required>
	                </td>
	                </c:if>
	                
	                
	                
	                <c:if test="${!empty cont.user_addr }">
	                <td>
		                <input class="input1 zipcode" type="text" id="sample6_postcode" placeholder="우편번호"  >
	                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_address" placeholder="주소"  ><br>
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_detailAddress" placeholder="상세주소"  >
	                    <input class="input1 addr" name="user_addr" type="text" id="sample6_extraAddress" placeholder="참고항목"  >
	                </td>
	                </c:if>
	            </tr>
	            <tr>
	                <th class="table-secondary">후원금액</th>
	                <td><input class ="input1" name="user_totalprice" type="text" value="${cont.user_totalprice}" size="40"></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">반려동물경험</th>
	                <td>
	                <c:if test="${'Y' eq cont.user_animalexp }">
	                	<input class ="input1" name="user_animalexp" type="radio" value="Y" checked> Y
	                	<input class ="input1" name="user_animalexp" type="radio" value="N"> N
	                </c:if>
	                <c:if test="${'N' eq cont.user_animalexp }">
	                	<input class ="input1" name="user_animalexp" type="radio" value="Y"> Y
	                	<input class ="input1" name="user_animalexp" type="radio" value="N" checked> N
	                </c:if>
	                <c:if test="${null eq cont.user_animalexp }">
	                	<input class ="input1" name="user_animalexp" type="radio" value="Y"> Y
	                	<input class ="input1" name="user_animalexp" type="radio" value="N"> N
	                </c:if>
	                </td>
	            </tr>
	        </table>
	        
	        <br>
	        
	        <input class="btn btn-secondary" type="submit" value="변경">
	        <input class="btn btn-secondary" type="reset" value="취소">
	        
	    </form>
	    
	</div>
	
</body>
</html>