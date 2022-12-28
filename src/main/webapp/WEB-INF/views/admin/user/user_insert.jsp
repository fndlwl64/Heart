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
<body>
	<jsp:include page="../../include/admin_header.jsp" />
	
	<br><br>
	
	<div class="div1">
		<div style="width: 98%;" class="sub-title"><h4>회원 상세 내용</h4></div>
		
		<form method="post" action="${path }/user_inserted">
			
			<table class="table addUser">
				<tr>
					<th class="table-secondary"><span class="sp2">아이디</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">이름</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">등급</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">이메일</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">연락처</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">주소</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">후원금액</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">반려동물경험</span></th>
					<td><input class ="input1" type="text" size="40"></td>
				</tr>
			</table>
			
			<br>
			
			<input class="btn btn-secondary" type="submit" value="등록">
			
		</form>
		
	</div>
	
</body>
</html>