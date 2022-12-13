<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/support_insert_ok">
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">후원회원</span></th>
				<td><input name="support_userid" class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">금액</span></th>
				<td><input name="support_price" class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">후원일자</span></th>
				<td><input name="support_date" class ="input1" type="text"></td>
			</tr>
		</table>
		<br>
		<input id="update_btn" type="submit" value="등록" align="center">
	</form>
</div>
</body>
</html>