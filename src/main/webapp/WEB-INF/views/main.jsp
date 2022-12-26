<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<jsp:include page="./include/user_header.jsp" />
<script src="${path}/resources/js/main.js"></script>
<c:set var="dRList" value="${ dogReviewList }" />
<c:set var="cRList" value="${ catReviewList }" />
<c:set var="dList" value="${ dogList }" />
<c:set var="cList" value="${ catList }" />

<div id="main-contents" class="main-contents">

	<div class="animal-intro"></div>

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
        <h1 id="heart-pet">HeartPet, </h1>
        <div class="more">
            <div>
	           <span>당신과 평생 함께 할 반려동물을 만나보세요</span>
	        </div>    
	        <div class="d-flex">
		      <button type="button" class="btn btn-dark mx-3" onclick="location.href='${path}/user_dog_list'"><i class="bi bi-arrow-right-circle"></i> 강아지</button>
		      <button type="button" class="btn btn-light" onclick="location.href='${path}/user_cat_list'"><i class="bi bi-arrow-right-circle-fill"></i> 고양이</button>
	        </div>
	    </div>
    </div>
    
    <div class="animal-intro"></div>
	    
    <div class="swiper dogSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ dList }" var="list">
            	<div class="swiper-slide">
		            <c:choose>
	            		<c:when test="${ not empty list.animal_img1 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img1 }');"></c:when>
	            		<c:when test="${ not empty list.animal_img2 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img2 }');"></c:when>
	            		<c:when test="${ not empty list.animal_img3 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img3 }');"></c:when>
		            </c:choose>
			            <div>
			            	<span class="swiper-text">${ list.animal_name } <c:if test="${ list.animal_gender eq 'male' }"><i class="bi bi-gender-male"></i></c:if><c:if test="${ list.animal_gender eq 'female' }"><i class="bi bi-gender-female"></i></c:if></span>          
			            </div>
		            </a>
            	</div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    
    <div class="swiper dogSwiper catSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ cList }" var="list">
            	<div class="swiper-slide">
		            <c:choose>
	            		<c:when test="${ not empty list.animal_img1 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img1 }');"></c:when>
	            		<c:when test="${ not empty list.animal_img2 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img2 }');"></c:when>
	            		<c:when test="${ not empty list.animal_img3 }"><a href="${path}/user_animal_content?no=${ list.animal_no }" style="background-image: url('${path}${ list.animal_img3 }');"></c:when>
		            </c:choose>
			            <div>
			            	<span class="swiper-text">${ list.animal_name } <c:if test="${ list.animal_gender eq 'male' }"><i class="bi bi-gender-male"></i></c:if><c:if test="${ list.animal_gender eq 'female' }"><i class="bi bi-gender-female"></i></c:if></span>          
			            </div>
		            </a>
            	</div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    
    <%-- 입양후기 list 출력 --%>
    <div class="main-title">HeartPet과 함께한 강아지 가족</div>
    <div class="swiper reviewSwiper">
        <div class="swiper-wrapper">
        	<c:forEach items="${ dRList }" var="list">
            <div class="swiper-slide">
                <a href="${ path }/user_review_content?review_no=${ list.review_no }">
                <c:choose>
					<c:when test="${ not empty list.review_img1 }"><img src="${path}${ list.review_img1 }" alt="review_img"></c:when>
					<c:when test="${ not empty list.review_img2 }"><img src="${path}${ list.review_img2 }" alt="review_img"></c:when>
					<c:when test="${ not empty list.review_img3 }"><img src="${path}${ list.review_img3 }" alt="review_img"></c:when>
                </c:choose>
                </a>
                <div>
                    <span class="title">
                        <c:if test="${ list.review_title.length() gt 15 }">${ list.review_title.substring(0,15) }...</c:if>
                        <c:if test="${ list.review_title.length() lt 15 }">${ list.review_title }</c:if>
                    </span>
                </div>
                <div>
                    <span class="content">등록일 ${ list.review_regdate.substring(0,10) } 조회 ${ list.review_hit }</span>
                </div>
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
                <a href="${ path }/user_review_content?review_no=${ list.review_no }">
                <c:choose>
                    <c:when test="${ not empty list.review_img1 }"><img src="${path}${ list.review_img1 }" alt="review_img"></c:when>
                    <c:when test="${ not empty list.review_img2 }"><img src="${path}${ list.review_img2 }" alt="review_img"></c:when>
                    <c:when test="${ not empty list.review_img3 }"><img src="${path}${ list.review_img3 }" alt="review_img"></c:when>
                </c:choose>
                </a>
                <div>
	                <span class="title">
	                    <c:if test="${ list.review_title.length() gt 15 }">${ list.review_title.substring(0,15) }...</c:if>
	                    <c:if test="${ list.review_title.length() lt 15 }">${ list.review_title } </c:if>
	                </span>
                </div>
                <div>
                    <span class="content">등록일 ${ list.review_regdate.substring(0,10) } 조회 ${ list.review_hit }</span>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

</div>

<jsp:include page="./include/user_footer.jsp" />

