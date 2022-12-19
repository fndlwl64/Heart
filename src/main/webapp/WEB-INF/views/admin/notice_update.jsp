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
<c:set var="dto" value="${Cont }" />
<body>
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/notice_update_ok" enctype="multipart/form-data">
		<input type="hidden" name="notice_img1" value="${dto.getNotice_img1() }">
		<input type="hidden" name="notice_img2" value="${dto.getNotice_img2() }">
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">공지제목</span></th>
				<td><input class ="input1" type="text" name="notice_title" value="${dto.getNotice_title() }"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">글내용</span></th>
				<td><textarea rows="2" cols="22" name="notice_content">${dto.getNotice_content() }</textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">조회수</span></th>
				<td><input class ="input1" type="text" name="notice_hit" value="${dto.getNotice_hit() }"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지</span></th>
				<td>
					<div class="image-upload">
						<label for="file-input1">
							<img id="file_change1" class="logo" src="resources/upload/${dto.getNotice_img1() } "/>
						</label>
						<input class="file_input" id="file-input1" type="file" onchange="readURL4(this);" name="files"/>
					</div>
					<c:if test="${not empty dto.getNotice_img2() }">
						<div class="image-upload">
							<label for="file-input2"> 
							<img id="file_change2" class="logo" src="resources/upload/${dto.getNotice_img2() }"
								style="max-height: 200px;" alt="notice_img" />
							</label>
							<input class="file_input btn" id="file-input2" type="file" onchange="readURL5(this);" name="files" />
						</div>
					</c:if>
				</td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="notice_no" value="${dto.getNotice_no() }">
		<input id="update_btn" type="submit" value="변경">
	</form>
</div>
</body>
</html>