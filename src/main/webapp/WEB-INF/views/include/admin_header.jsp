<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<link rel="stylesheet" href="resources/css/admin_include.css">
	
    <link rel="shortcut icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
 
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="${path}/resources/icon/favicon_57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/resources/icon/favicon_114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/resources/icon/favicon_144x144.png" />
</head>
<body>
	<div class="header-logo">
		<div class="row div_header">
			<div class="col-4 space"></div>		
			<div class="col-4 header-logo">
				<a href="${path}/admin_main"><img class="logo" src="${path}/resources/logo/heartpet_logo_words.png" alt="HeartPet" /></a>
			</div>
			<div class="col-4 header-nav">
	            <ul>
	            	<li><a href="${path}/">홈</a></li>
	                <li><a href="${path}/user_logout">로그아웃</a></li>
	            </ul>
            </div>
			<div class="nav-bar justify-content-center">
				<div class="nav-links">
					<ul>
						<li><a href="${path}/user_list">회원관리</a></li>
						<%-- <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								동물관리
							</a>
							<ul class="dropdown-menu">
		                        <li><a class="dropdown-item" href="${path}/dog_list">유기견관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/cat_list">유기묘관리</a></li>
		                    </ul>
				        </li> --%>
						<li class="lis"><a href="${path}/dog_list">유기견관리</a></li>
						<li class="lis"><a href="${path}/cat_list">유기묘관리</a></li>
						<li><a href="${path}/adoptreg_list">입양관리</a></li>
						<li><a href="${path}/support_list">후원관리</a></li>
						<%-- <li class="dropdown">
		                    <a class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="true">
		                        게시물관리
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li><a class="dropdown-item" href="${path}/notice_list">공지사항관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/admin_qna_list">Q&A관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/admin_fnq_list">FNQ관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/admin_review_list">후기관리</a></li>
		                    </ul>
	                    </li> --%>
						<li><a href="${path}/notice_list">공지사항관리</a></li>
						<li><a href="${path}/admin_qna_list">Q&A관리</a></li>
						<li><a href="${path}/admin_fnq_list">FNQ관리</a></li>
						<li><a href="${path}/review_list">후기관리</a></li>
					</ul>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>