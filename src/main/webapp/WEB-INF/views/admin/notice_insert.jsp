<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/notice_insert_ok">
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">공지제목</span></th>
				<td><input class ="input1" type="text" name="notice_title"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">글내용</span></th>
				<td><textarea rows="2" cols="22" name="notice_content"></textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">조회수</span></th>
				<td><input class ="input1" type="text" name="notice_hit"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지1</span></th>
				<td>
					<input type="file" name="notice_img1" onchange="readURL1(this);">
					<img class="preview" id="preview1"/>
				</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지2</span></th>
				<td>
					<input type="file" name="notice_img2" onchange="readURL2(this);">
					<img class="preview" id="preview2"/>
				</td>
			</tr>
		</table>
		<br>
		<input id="update_btn" type="submit" value="등록" align="center">
	</form>
</div>
</body>
</html>