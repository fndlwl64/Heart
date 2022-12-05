<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<jsp:include page="./include/user_header.jsp" />
<script src="${path}/resources/js/main.js"></script>
<link rel="short icon" href="#" />

<div id="main-contents" class="main-contents">

    <%-- 하트펫 Promotion 문구 --%>
    <div class="promo-title" style="background-image:linear-gradient(45deg, transparent, rgba(76, 40, 24, 0.5), rgba(166, 106, 44, 0.5), rgba(213, 170, 114, 0.5)), url('${path}/resources/image/potter_cute.jpg'); ">
        <p><span class="title-effect">유기동물 입양 중개 플랫폼</span><br>
        입양하고 싶은 반려동물 정보, <span class="title-effect">하트펫</span>에서 알아보세요</p>
    </div>

    <%-- 동영상 --%>
    <div class="main-video">
        <iframe id="video" width="100%" height="315" src="https://www.youtube.com/embed/SUUbKD0GI-Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    <%-- 강아지 list 출력 // swiper --%>
    <div class="main-title">
        <p id="heart-pet">HeartPet, </p>
        <p>당신을 기다리고 있는 반려동물을 만나보세요</p>
    </div>
    <div class="swiper dogSwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><a href="${path}/user_dog_content"><img src="${path}/resources/logo/heartpet_logo.png" alt=""></a></div>
            <div class="swiper-slide"><img src="${path}/resources/logo/heartpet_logo_words.png" alt=""></div>
            <div class="swiper-slide">Slide 3</div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="more">
        <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_dog_list'">더 보러가기</button>
    </div>
    <%-- 입양후기 list 출력 --%>
    <div class="main-title">Review</div>
    <div class="swiper reviewSwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo.png" /></a>
                <span class="title">후기제목</span><br>
                <span class="content">후기내용</span>
            </div>
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo_words.png" /></a>
                <span class="title">제목</span><br>
                <span class="content">후기내용</span>
            </div>
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo.png" /></a>
                <span class="title">제목</span><br>
                <span class="content">후기내용</span>
            </div>
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo_words.png" /></a>
                <span class="title">제목</span><br>
                <span class="content">후기내용</span>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>

</div>

<jsp:include page="./include/user_footer.jsp" />

