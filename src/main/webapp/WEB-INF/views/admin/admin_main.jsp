<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hearpet_Admin_Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/admin_main.css" />
<style> @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap'); </style>    
<link rel="shortcut icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />

<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/icon/favicon_72x72.png" />
<link rel="apple-touch-icon-precomposed" sizes="57x57" href="${path}/resources/icon/favicon_57x57.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/resources/icon/favicon_72x72.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/resources/icon/favicon_114x114.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/resources/icon/favicon_144x144.png" />
</head>
<body>

	<div class="container">
		
		<div class="top">
			<img class="logo_img" src="resources/logo/heartpet_logo_words.png" alt="하트펫 로고" />
		</div>
		
		<h3>HEARTPET 관리자 페이지</h3>
		
		<div class="btns">
			
			<ul>
				<li> <a href="${path }/user_list">회원관리</a> </li>
				<li> <a href="${path}/support_list">후원관리</a> </li>
			</ul>
			<ul>	
				<li> <a href="${path}/dog_list">유기견관리</a> </li>
				<li> <a href="${path}/cat_list">유기묘관리</a> </li>
				<li> <a href="${path}/adoptreg_list">입양관리</a> </li>
			</ul>
			<ul>	
				<li> <a href="${path}/notice_list">공지관리</a> </li>
				<li> <a href="${path}/admin_qna_list">Q&A관리</a> </li>
				<li> <a href="${path}/admin_fnq_list">FAQ관리</a> </li>
				<li> <a href="${path}/admin_review_list">후기관리</a> </li>
			</ul>
			
		</div>
		
	</div>

</body>
</html>