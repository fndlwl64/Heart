<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/css/admin_include.css">
</head>
<body>
	<div align="center" class="div_header">
		<a href="<%=request.getContextPath() %>/admin_main"><img class ="logo" src="resources/image/heartpet_logo.png" /></a>
		<ul>
			<li class="lis"><a href="<%=request.getContextPath() %>/user_list">회원관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/user_dog_list_list">유기견관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/cat_list">유기묘관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/adoptreg_list">입양관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/support_list">후원관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/notice_list">공지사항관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/board_list">Q&A관리</a></li>
			<li class="lis"><a href="<%=request.getContextPath() %>/user_review_list">후기관리</a></li>
		</ul>
	</div>
</body>
</html>