<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin_main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		
		<div class="top">
			<img class="logo_img" src="resources/logo/heartpet_logo_words.png" alt="하트펫 로고" />
		</div>
		
		<h3>HEARTPET 관리자 페이지</h3>
		
		<div class="btns">
			<ul>
				<li> <button class="btn" onclick="location.href='${path }/user_list'">회원관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/dog_list'">유기견관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/cat_list'">유기묘관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/adoptreg_list'">입양관리</button> </li>
			</ul>
			<ul>
				<li> <button class="btn" onclick="location.href='${path}/support_list'">후원관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/notice_list'">공지사항관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/admin_qna_list'">Q&A관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/admin_fnq_list'">FNQ관리</button> </li>
				<li> <button class="btn" onclick="location.href='${path}/admin_review_list'">후기관리</button> </li>
			</ul>
		</div>
		
	</div>

</body>
</html>