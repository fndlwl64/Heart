<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% long time = System.currentTimeMillis(); %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- <link rel="short icon" href="temp"> -->

    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>        
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
    <link rel="shortcut icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon" />
 
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="${path}/resources/icon/favicon_57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/resources/icon/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/resources/icon/favicon_114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/resources/icon/favicon_144x144.png" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="${path}/resources/css/user_include.css?${time}">
    <style> @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap'); </style>
        
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    
    <script src="${path}/resources/js/main.js"></script>
</head>
<body>
    
    <div class="wrap">
        <%-- header --%>
        <header class="h-wrap">
            <div class="header-logo">
                <div class="row">
                    <c:if test="${ empty session_id && empty session_admin_id }">                
	                    <div class="col-5 header-space"></div>
	                    <div class="col-2 header-image">
	                        <a href="${path}/"><img src="${path}/resources/logo/heartpet_logo_words.png" alt="HeartPet" /></a>
	                    </div>
	                    <div class="col-5 header-nav">
	                    	<div class="login-section">
		                        <ul class="row">
		                           <li class="col-1"></li>
		                           <li class="col-3 login-location"><a class="login-title" id="goto-login" data-bs-toggle="modal" data-bs-target="#exampleModal">?????????</a></li>
		                           <li class="col-6 join-location"><a class="login-title" href="${path}/join">????????????</a></li>
		                        </ul>
	                        </div>
	                    </div>
                    </c:if>
                    <c:if test="${!empty session_id || !empty session_admin_id }">                
	                    <div class="col-5 header-space"></div>
	                    <div class="col-2 header-image">
	                        <a href="${path}/"><img src="${path}/resources/logo/heartpet_logo_words.png" alt="HeartPet" /></a>
	                    </div>
	                    <div class="col-5 header-nav">
	                    	<div class="login-section">
		                        <ul class="row">
		                        	<c:if test="${ not empty session_id }">
										<li class="col-4 login-location">
											<a class="login-title" href="${path}/user_mypage_user_update">
												<img class="user-image" src="${path}/resources/image/user_img/${ session_image }" alt="user_img" />
												<span>${ session_name }???</span>
											</a>
										</li>

									</c:if> 
									<c:if test="${ not empty session_admin_id }">
		                           		<li class="col-4 login-location">
			                           		<a class="login-title" href="${path}/user_list">
				                           		<img class="user-image" src="${path}/resources/image/user_img/${ session_admin_image }" alt="admin_img" />
				                           		<span>${ session_admin_name }???</span>
			                           		</a>
		                           		</li>
		                           </c:if>
		                           <li class="col-4 join-location"><a class="login-title" href="${path}/user_logout">????????????</a></li>
		                        </ul>
	                        </div>
	                    </div>
                    </c:if>
                </div>
                
                <div class="nav-bar justify-content-center">
                    <div class="nav-links">
                        <ul>
                            <li><a href="${path}/user_notice">??????&??????</a></li>                            
                            <li><a href="${path}/user_animal_insert">????????????</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ????????????
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${path}/user_dog_list">???????????????</a></li>
                                    <li><a class="dropdown-item" href="${path}/user_cat_list">???????????????</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ????????????
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${path}/user_fnq_list">FAQ</a></li>
                                    <li><a class="dropdown-item" href="${path}/user_qna_list">???????????????</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/user_review_list">????????????</a></li>
                            <li><a href="${path}/user_support">????????????</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <%--????????? ??????--%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">HeartPet ?????????</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="login_form" method="post" action="${path}/login">
                                <label for="login_id">
	                                <input id="login_id" class="login_text" name="user_id" placeholder="?????????">
	                                <span id="idcheck"></span>
                                </label>
                                <br />
                                <label for="login_pwd">
	                                <input id="login_pwd" class="login_text" type="password" name="user_pwd" placeholder="????????????">
	                                <input type="submit" id="login_btn" class="btn login_btn" value="?????????">
                                </label>
                            </form>
                            <ul>
                                <li><a data-bs-toggle="modal" data-bs-target="#findId">???????????????</a></li>
                                <li><a data-bs-toggle="modal" data-bs-target="#findPwd">??????????????????</a></li>
                                <li><a href="${path}/join">????????????</a></li>
                            </ul>
                        </div>
                        
                        <div class="modal-footer">
                            <a id="kakao-login-btn"></a>
                            <a id="naver_id_login"></a>
                        </div>
                        
                        <script src="${path}/resources/js/signin_up.js"></script>
                    </div>
                </div>
            </div>

            

            <%--????????? ??????--%>
            <div class="modal fade" id="findId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="findIdLabel">HeartPet ?????????</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        	<%-- <form method="post" action="${path }/user_find_id"> --%>
		                        <input class="login_text" id="id_name" placeholder="??????">
		                        <span id="name_check"></span>
		                        <input class="login_text" id="id_email" placeholder="?????????">
		                        <span id="email_check"></span>
		                        <button id="find_id" class="btn login_btn" onclick="idfind()" disabled>????????? ??????</button>
	                        <%-- </form> --%>
                        </div>
                        <div class="modal-footer">
                        	<div id="id_found">
				            	<label class="found_title"> 
				            		<span id="found_id"></span>
				            	</label>
				            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            

            <%--???????????? ??????--%>
            <div class="modal fade" id="findPwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="findPwdLabel">HeartPet ???????????? ??????</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form class="login_form" method="post" action="${path}/user_find_pwd">
                            <div class="modal-body">
                                <input id="pwd_id" class="login_text" name="user_id" placeholder="?????????">
                                <span id="name_check"></span>
                                <input id="pwd_email" class="login_text" name="user_email" placeholder="?????????">
                                <span id="email_check"></span>
                                <input type="submit" id="pwd_btn" class="btn login_btn" value="???????????? ??????" disabled>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </header>
    </div>

    <!-- main start -->
    <main role="main" id="container">
    