<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet</title>
 <link rel="stylesheet" href="resources/css/list_view.css">
</head>
<body>

	<div class="container">
		
			<div class="_container">
			
			<div class="wrap">
				
				<h3>기본정보</h3>
				
				<div class="user_info">
					
					<div class="info_title">
						<ul class="info_border">
							<li><img class="user_img" src="${path }/resources/image/user_img/${cont.user_image}" alt="회원 랜덤 이미지" /></li>
							<li>
								<div>
									<label class="title">이름</label> <span class="bold"> ${cont.user_name}</span> <br />
									<label class="title">아이디</label> <span> ${cont.user_id}</span>
								</div>
							</li>
						</ul>
						
						<ul class="info_border">
							<li class="forMargin">
								<div>
									<label class="title">등급</label><span> ${cont.user_grade }</span> <br />
									<label class="title">이메일</label> <span> ${cont.user_email}</span>
								</div>
							</li>
						</ul>
					</div>	
				</div>
				
			</div>
			
			<div class="wrap">
			
				<h3>상세정보</h3>
			
				<div class="user_info">
					<c:set var="addrlength" value="${cont.user_addr }"/>
					<c:set var="length" value="${fn:length(addrlength)}"/>
					<c:set var="addr" value = "${fn:substring(addrlength, 6, length-7)}" />
					<div class="info_title">
						<ul>
							<li class="forMargin">
								<div>
									<label class="title">회원번호</label><span> ${cont.user_no }</span> <br />
									<label class="title">연락처</label> <span> <c:if test="${empty cont.user_phone }">-</c:if>
							<c:if test="${!empty cont.user_phone }">${cont.user_phone }</c:if> </span> <br />
									<label class="title">주소</label> <span> <c:if test="${empty cont.user_addr }">-</c:if>
							<c:if test="${!empty cont.user_addr }">${addr}</c:if> </span> <br />
									<label class="title">후원금액</label> <span> <fmt:formatNumber>${cont.user_totalprice}</fmt:formatNumber>원 </span> <br />
									<label class="title">반려동물경험</label> <span> <c:if test="${empty cont.user_animalexp }">-</c:if> ${cont.user_animalexp } </span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
	
		<button class="listbtn" onclick="location.href='${path}/user_list'"><i class="bi bi-card-list"></i> 목록</button>
		<button class="listbtn_1" onclick="location.href='${path}/user_update?user_id=${cont.user_id }'"><i class="bi bi-eraser"></i> 수정</button>
		<button class="listbtn_2" onclick="location.href='${path}/user_delete?id=${cont.user_id }&no=${cont.user_no }'"><i class="bi bi-trash3"></i> 삭제</button>
		
	
	</div>
	
	

</body>
</html>