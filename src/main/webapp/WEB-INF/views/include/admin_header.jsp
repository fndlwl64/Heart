<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<link rel="stylesheet" href="resources/css/admin_include.css">
	
    <link rel="shortcut icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
    <style> @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap'); </style>    
 
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="${path}/resources/icon/favicon_57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/resources/icon/favicon_114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/resources/icon/favicon_144x144.png" />
</head>
<body>
	<div class="header-logo">
		<div class="row div_header">
			<div class="col-5 header-space"></div>		
			<div class="col-2 header-image">
				<a href="${path}/admin_main"><img class="logo" src="${path}/resources/logo/heartpet_logo_admin.png" alt="HeartPet" /></a>
			</div>
			<div class="col-5 header-nav">			
               	<div class="login-section">
					<ul class="row">
					   <li class="col-1 login-location"></li>
					   <li class="col-3 login-location"><a href="${path}/"><i class="bi bi-house-heart"></i> 사이트</a></li>
					   <li class="col-6 join-location"><a class="login-title" href="${path}/user_logout">로그아웃</a></li>
					</ul>
                </div>
            </div>
            <!-- nav-bar -->
			<div class="nav-bar navbar-dark bg-dark justify-content-center">
				<div class="nav-links">
					<ul>
						<li><a href="${path}/user_list">회원관리</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								동물관리
							</a>
							<ul class="dropdown-menu">
		                        <li><a class="dropdown-item" href="${path}/dog_list">강아지관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/cat_list">고양이관리</a></li>
		                    </ul>
				        </li>
						<li><a href="${path}/adoptreg_list">입양관리</a></li>
						<li><a href="${path}/support_list">후원관리</a></li>
						<li><a href="${path}/notice_list">공지관리</a></li>
						<li class="dropdown">
                            <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                문의관리
                            </a>
		                    <ul class="dropdown-menu">
		                        <li><a class="dropdown-item" href="${path}/admin_fnq_list">FNQ관리</a></li>
		                        <li><a class="dropdown-item" href="${path}/admin_qna_list">문의글관리</a></li>
		                    </ul>
	                    </li>
						<li><a href="${path}/admin_review_list">후기관리</a></li>
					</ul>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>