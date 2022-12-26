<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="resources/css/animal.css" />
<% pageContext.setAttribute("newline", "\n"); %>

<c:set var="dto" value="${dto }" />
<c:set var="wishCheck" value="${wishCheck }" />
<c:set var="adoptRegDTO" value="${adoptRegDTO }" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="user_id" value='<%=(String) session.getAttribute("session_id")%>' />
<c:set var="user_grade" value='<%=(Integer) session.getAttribute("session_grade")%>' />
<c:set var="deleteAddr" value="${path }/user_cancel_animal?animal_no=${dto.animal_no }"></c:set>
<input type="hidden" value="<%=request.getContextPath()%>/wish" id="linkwish">
<input type="hidden" value="${user_id }" id="user_id" />
<input type="hidden" value="${user_grade }" id="user_grade" />
<input type="hidden" value="${dto.animal_no }" id="animal_number"/>
<script src="${path}/resources/js/admin_list_view.js"></script>

	<div class="div1">
	
		<div class="animal_info">
			
			<table class="table">
				
				<tr>
					<th class="table-light">이름</th>
					<td id="animal_name" colspan="3">${dto.animal_name}</td>
				</tr>
				
				<tr>
					<th class="table-light">종</th>
					<td>${dto.animal_species }</td>
					<th class="table-light">성별</th>
					<td>
					<c:if test="${dto.animal_gender eq 'male'}">수컷(♂)</c:if>
					<c:if test="${dto.animal_gender eq 'female'}">암컷(♀)</c:if>
					</td>
				</tr>
				
				<tr>
					<th class="table-light">중성화</th>
					<td>${dto.animal_neutered }</td>
					<th class="table-light">예방접종</th>
					<td>${dto.animal_vaccination}</td>
				</tr>
				
				<tr>
					<th class="table-light">추정나이</th>
					<td>${dto.animal_age }살</td>
					<th class="table-light">발견장소</th>
					<td>${dto.animal_place}</td>
				</tr>
				
				<tr>
					<th class="table-light">몸무게</th>
					<td>${dto.animal_weight }kg</td>
					<th class="table-light">입양상태</th>
					<td>${dto.animal_status}</td>
				</tr>
				
				<tr>
					<td colspan="4">
						<img src="<%=request.getContextPath() %>${dto.animal_img1 }" alt="이미지" />
						<c:if test="${!empty dto.animal_img2 }"><img src="<%=request.getContextPath() %>${dto.animal_img2 }" alt="이미지" /></c:if>
						<c:if test="${!empty dto.animal_img3 }"><img src="<%=request.getContextPath() %>${dto.animal_img3 }" alt="이미지" /></c:if>
					</td>
				</tr>
				
			</table>
			
			<button class="btn btn-dark btn_list" onclick="location.href='${path}/user_cat_list'"><i class="bi bi-card-list"></i> 목록</button>
			
		</div>
	
	</div>

