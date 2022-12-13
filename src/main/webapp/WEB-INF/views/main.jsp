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
<c:set var="dRList" value="${ dogReviewList }" />
<c:set var="cRList" value="${ catReviewList }" />
<c:set var="dList" value="${ dogList }" />
<c:set var="cList" value="${ catList }" />

<div id="main-contents" class="main-contents">

    <%-- 하트펫 Promotion 문구 --%>
    <div class="promo-title" style="background-image:linear-gradient(45deg, transparent, rgba(76, 40, 24, 0.5), rgba(166, 106, 44, 0.5), rgba(213, 170, 114, 0.5)), url('${path}/resources/image/potter_cute.jpg'); ">
        <p><span class="title-effect">유기동물 입양 중개 플랫폼</span><br>
        입양하고 싶은 반려동물 정보, <span class="title-effect">하트펫</span>에서 알아보세요</p>
    </div>

    <%-- 동영상 --%>
    <div class="main-video">
		<iframe id="video" width="100%" height="315" src="https://www.youtube.com/embed/1mjamoOVzo4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    <%-- 강아지 list 출력 // swiper --%>
    <div class="main-title">
        <p id="heart-pet">HeartPet, </p>
        <p>당신을 기다리고 있는 강아지를 만나보세요</p>
    </div>
    <div class="swiper dogSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ dList }" var="list">
            	<div class="swiper-slide">
            	<a href="${path}/user_animal_content?no=${ list.animal_no }">
            	<c:choose>
            	<c:when test="${ not empty list.animal_img1 }"><img src="${path}/resources/upload/${ list.animal_img1 }" alt="animal_img"></c:when>
            	<c:when test="${ not empty list.animal_img2 }"><img src="${path}/resources/upload/${ list.animal_img2 }" alt="animal_img"></c:when>
            	<c:when test="${ not empty list.animal_img3 }"><img src="${path}/resources/upload/${ list.animal_img3 }" alt="animal_img"></c:when>
            	</c:choose>
            	</a></div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="more">
        <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_dog_list'">더 보러가기</button>
    </div>
    
    <%-- 고양이 list 출력 // swiper --%>
    <div class="main-title">
        <p id="heart-pet">HeartPet, </p>
        <p>당신을 기다리고 있는 고양이를 만나보세요</p>
    </div>
    <div class="swiper dogSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ cList }" var="list">
            	<div class="swiper-slide">
            	<a href="${path}/user_animal_content?no=${ list.animal_no }">
            	<c:choose>
            	<c:when test="${ not empty list.animal_img1 }"><img src="${path}/resources/upload/${ list.animal_img1 }" alt="animal_img"></c:when>
            	<c:when test="${ not empty list.animal_img2 }"><img src="${path}/resources/upload/${ list.animal_img2 }" alt="animal_img"></c:when>
            	<c:when test="${ not empty list.animal_img3 }"><img src="${path}/resources/upload/${ list.animal_img3 }" alt="animal_img"></c:when>
            	</c:choose>
            	</a></div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="more">
        <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_cat_list'">더 보러가기</button>
    </div>
    
    <%-- 입양후기 list 출력 --%>
    <div class="main-title">HeartPet과 함께한 강아지 가족</div>
    <div class="swiper reviewSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ dRList }" var="list">
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo.png" /></a>
                <span class="title">${ list.review_title }</span><br>
                <span class="content">${ list.review_content }</span>
            </div>
            </c:forEach>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    
    <div class="main-title">HeartPet과 함께한 고양이 가족</div>
    <div class="swiper reviewSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ cRList }" var="list">
            <div class="swiper-slide">
                <a href=""><img src="${path}/resources/logo/heartpet_logo.png" /></a>
                <span class="title">${ list.review_title }</span><br>
                <span class="content">${ list.review_content }</span>
            </div>
            </c:forEach>
        </div>
        <div class="swiper-pagination"></div>
    </div>

</div>

<jsp:include page="./include/user_footer.jsp" />

