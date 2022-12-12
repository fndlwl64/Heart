<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				
				<div class="user_info row">
					
					<div class="info_title col">
						<p class="title"><i class="bi bi-list-ol"></i> 회원번호</p>
						<p class="title"><i class="bi bi-tag"></i> 회원이름</p>
						<p class="title"><i class="bi bi-tag"></i> 아이디</p>
						<p class="title"><i class="bi bi-key"></i> 비밀번호</p>
						<p class="title"><i class="bi bi-person-badge"></i> 회원등급</p>
					</div>
					
					<div class="info_cont col">
						<p class="cont"> ${cont.user_no}</p>
						<p class="cont"> ${cont.user_name}</p>
						<p class="cont"> ${cont.user_id}</p>
						<p class="cont"><c:forEach begin="1" end="${cont.getUser_pwd().length() }">
							*
						</c:forEach></p>
						<p class="cont"> ${cont.user_grade}</p>
					</div>		
				</div>
				
			</div>
			
			<div class="wrap">
			
				<h3>상세정보</h3>
			
				<div class="user_info row">
					
					<div class="info_title col">
						<p class="title"><i class="bi bi-list-ol"></i> 이메일</p>
						<p class="title"><i class="bi bi-tag"></i> 연락처</p>
						<p class="title"><i class="bi bi-tag"></i> 주소</p>
						<p class="title"><i class="bi bi-key"></i> 후원금액</p>
						<p class="title"><i class="bi bi-person-badge"></i> 반려동물경험</p>
					</div>
					
					<div class="info_cont col">
						<p class="cont"> 
							<c:if test="${empty cont.user_email }">-</c:if>
							<c:if test="${!empty cont.user_email }">${cont.user_email }</c:if>
						</p>
						<p class="cont"> 
							<c:if test="${empty cont.user_phone }">-</c:if>
							<c:if test="${!empty cont.user_phone }">${cont.user_phone }</c:if>
						</p>
						<p class="cont"> 
							<c:if test="${empty cont.user_addr }">-</c:if>
							<c:if test="${!empty cont.user_addr }">${cont.user_addr }</c:if>
						</p>
						<p class="cont"> <fmt:formatNumber>${cont.user_totalprice}</fmt:formatNumber>원 </p>
						<p class="cont"> 
							<c:if test="${empty cont.user_animalexp }">-</c:if>
							<c:if test="${!empty cont.user_animalexp}">${cont.user_animalexp}</c:if>
						</p>
					</div>
				</div>
			
			</div>
			
		</div>
	
		<button class="listbtn" onclick="location.href='${path}/user_list'"><i class="bi bi-card-list"></i> 목록</button>
		<button class="listbtn_1" onclick="location.href='${path}/user_update?user_id=${cont.user_id }'"><i class="bi bi-eraser"></i> 수정</button>
		<button class="listbtn_2" onclick="location.href='${path}/user_delete?user_id=${cont.user_id }'"><i class="bi bi-trash3"></i> 삭제</button>
		
	
	</div>
	
	

</body>
</html>