<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/admin_include.css">
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">후원회원</span></th>
				<td><input class ="input1" type="text" value="아이디"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">금액</span></th>
				<td><input class ="input1" type="text" value="4000000"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">후원일자</span></th>
				<td><input class ="input1" type="text" value="2022-11-30"></td>
			</tr>
		</table>
		<br>
		<input id="update_btn" type="submit" value="변경" align="center">
	</form>
</div>
</body>
</html>