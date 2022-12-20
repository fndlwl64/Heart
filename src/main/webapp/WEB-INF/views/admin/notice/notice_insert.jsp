<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/notice.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<jsp:include page="../../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form method="post" enctype="multipart/form-data" action="${path }/notice_insert_ok" onsubmit="return submitOption();">
		<table class="table noticeinfo mt-4">
			<tr class="border-top">
				<th class="table-light col-1"><span class="sp2">공지제목</span></th>
				<td><input id="notice_title" class="form-control" type="text" name="notice_title"></td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">글내용</span></th>
				<td><textarea id="notice_content" class="form-control" rows="2" cols="22" name="notice_content"></textarea> </td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">조회수</span></th>
				<td><input id="notice_hit" class="form-control" type="text" name="notice_hit"></td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">첨부<br>이미지</span></th>
				<td>
					<input type="file" name="files" id="files" class="form-control" 
					accept="image/gif, image/jpeg, image/png" onchange="fileOption();" multiple>
				</td>
			</tr>
		</table>
		<br>
		
		<button type="button" class="btn btn-secondary mx-1" onclick="location.href='${path}/notice_list'"><i class="bi bi-card-list"></i> 목록</button>
        <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
        <button id="insert_btn" type="submit" class="btn btn-dark mx-1"><i class="bi bi-save"></i> 등록</button>
	</form>
</div>
</body>
</html>