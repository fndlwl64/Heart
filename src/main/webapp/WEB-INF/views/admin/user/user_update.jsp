<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
	                <td><input class="input1" name="user_grade" type="text" value="${cont.user_grade }" size="40" /></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">이메일</th>
	                <td><input class ="input1" name="user_email" type="text" value="${cont.user_email}" size="40"></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">연락처</th>
	                <td><input class ="input1" name="user_phone" type="text" value="${cont.user_phone}" size="40"></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">주소</th>
	                <td><input class ="input1" name="user_addr" type="text" value="${cont.user_addr}" size="40"></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">후원금액</th>
	                <td><input class ="input1" name="user_totalprice" type="text" value="${cont.user_totalprice}원" size="40"></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">반려동물경험</th>
	                <td>
	                	<input class ="input1" name="user_dogexp" type="radio" value="Y"> Y
	                	<input class ="input1" name="user_dogexp" type="radio" value="N"> N
	                </td>
	            </tr>
	        </table>
	        
	        <br>
	        
	        <input class="btn btn-secondary" type="submit" value="변경">
	        
	    </form>
	    
	</div>
	
</body>
</html>