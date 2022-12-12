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
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
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
    
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/main.js"></script>

</head>
<body>
    <div class="wrap">
        <%-- header --%>
        <header class="h-wrap">
            <div class="header-logo">
                <div class="row">
                    <div class="col-4 header-space"></div>
                    <div class="col-4 header-image">
                        <a href="${path}/"><img src="${path}/resources/logo/heartpet_logo_words.png" alt="HeartPet" /></a>
                    </div>
                    <div class="col-4 header-nav">
                        <ul>
                            <c:if test="${empty session_id && empty session_admin_id }">
                                <li><a data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</a></li>
                                <li><a href="${path}/join">회원가입</a></li>
                            </c:if>
                            
                            <c:if test="${!empty session_id || !empty session_admin_id}">
                                <li><a href="${path}/user_mypage_user_update"><strong>${ session_name } <i class="bi bi-suit-heart-fill"></i></strong></a></li>
                                <li><a href="${path}/user_mypage_wish_list">마이페이지</a></li>
                                <li><a href="${path}/user_logout">로그아웃</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                
                <div class="nav-bar justify-content-center">
                    <div class="nav-links">
                        <ul>
                            <li><a href="${path}/user_notice">공지&안내</a></li>                            
                            <li><a href="${path}/user_animal_insert">무료입소</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    무료입양
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${path}/user_dog_list">강아지보기</a></li>
                                    <li><a class="dropdown-item" href="${path}/user_cat_list">고양이보기</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    문의하기
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${path}/user_fnq_list">FAQ</a></li>
                                    <li><a class="dropdown-item" href="${path}/user_qna_list">문의글</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/user_review_list">입양후기</a></li>
                            <li><a href="${path}/user_support">후원하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <%--로그인 모달--%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">HeartPet 로그인</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="login_form" method="post" action="${path}/login">
                                <label for="login_id">
	                                <input id="login_id" class="login_text" name="user_id" placeholder="아이디">
	                                <span id="idcheck"></span>
                                </label>
                                <br />
                                <label for="login_pwd">
	                                <input id="login_pwd" class="login_text" type="password" name="user_pwd" placeholder="비밀번호">
	                                <input type="submit" id="login_btn" class="btn login_btn" value="로그인">
                                </label>
                            </form>
                            <ul>
                                <li><a data-bs-toggle="modal" data-bs-target="#findId">아이디찾기</a></li>
                                <li><a data-bs-toggle="modal" data-bs-target="#findPwd">비밀번호찾기</a></li>
                                <li><a href="${path}/join">회원가입</a></li>
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

            

            <%--아이디 찾기--%>
            <div class="modal fade" id="findId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="findIdLabel">HeartPet 로그인</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form class="login_form" method="post" action="${path}/user_find_id">
                            <div class="modal-body">
                                <input class="login_text" name="user_name" placeholder="이름">
                                <span class="name_check"></span>
                                <input class="login_text" name="user_email" placeholder="이메일">
                                <input type="submit" class="btn login_btn" value="아이디 찾기">
                            </div>
                            <div class="modal-footer">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%--비밀번호 찾기--%>
            <div class="modal fade" id="findPwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="findPwdLabel">HeartPet 비밀번호 찾기</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form class="login_form" method="post" action="${path}/user_find_pwd">
                            <div class="modal-body">
                                <input class="login_text" name="user_id" placeholder="아이디">
                                <span class="name_check"></span>
                                <input class="login_text" name="user_email" placeholder="이메일">
                                <input type="submit" class="btn login_btn" value="비밀번호 찾기">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </header>
    </div>

    <!-- main start -->
    <main role="main" id="container">