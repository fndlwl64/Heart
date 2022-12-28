<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		 
<c:set var="path" value="${pageContext.request.contextPath}" />		 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HeartPet_Admin_AdoptReg</title>
</head>
<link rel="stylesheet" href="${path }/resources/css/admin_include.css">
<body>
<jsp:include page="../../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">입양회원</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양된유기견</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양등록일</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양예정일</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양완료일</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
		</table>
		<br>
		<input id="update_btn" type="submit" value="등록" align="center">
	</form>
</div>
</body>
</html>