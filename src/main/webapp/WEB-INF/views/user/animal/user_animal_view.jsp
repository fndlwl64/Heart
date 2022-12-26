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
		
		<div class="animal_name">
			<h3>${dto.animal_name }</h3>
			<span>
				<c:if test="${dto.animal_gender eq 'male'}"> ${dto.animal_species } (수컷 ♂)</c:if>
				<c:if test="${dto.animal_gender eq 'female'}"> ${dto.animal_species } (암컷 ♀)</c:if>
			</span>
		</div>
		
		<div class="animal_info">
			
			<div class="animal_img">
				<img src="<%=request.getContextPath() %>${dto.animal_img1 }" alt="대표 이미지" />	
			</div>
			
			<div class="info_box">
				<div class="row">	
					<div class="col">	
						<label>중성화</label>
						<span>
							<c:if test="${dto.animal_neutered eq 'Y'}"> O</c:if>
							<c:if test="${dto.animal_neutered eq 'N'}"> X</c:if>
						</span><br />
						
						<label>예방접종</label>
						<span>
							<c:if test="${dto.animal_vaccination eq 'Y'}"> O</c:if>
							<c:if test="${dto.animal_vaccination eq 'N'}"> X</c:if>
						</span><br />
						
						<label>추정나이</label>
						<span> ${dto.animal_age }살</span><br />
					</div>
					
					<div class="col">	
						<label>발견장소</label>
						<span> ${dto.animal_place }</span><br />
						
						<label>크기</label>
						<span> ${dto.animal_size }</span><br />
						
						<label>무게</label>
						<span> ${dto.animal_weight }kg</span><br />
					</div>
				
					<div class="detail">
						<textarea cols="40" rows="5">${dto.animal_caution }</textarea>
					</div>
				</div>
			</div>

		</div>
		
		<div class="more_images">
			<c:if test="${!empty dto.animal_img2 && !empty dto.animal_img3}">
				<div class="img_2">
					<img src="<%=request.getContextPath() %>${dto.animal_img2 }" alt="상세 이미지 1" />
					<img src="<%=request.getContextPath() %>${dto.animal_img3 }" alt="상세 이미지 2" />
				</div>
			</c:if>
			
			<c:if test="${!empty dto.animal_img2 && empty dto.animal_img3}">
				<div class="img_1">
					<img src="<%=request.getContextPath() %>${dto.animal_img2 }" alt="상세 이미지 1" />
				</div>
			</c:if>				
		</div>
		
		<button class="btn btn-dark btn_list" onclick="location.href='${path}/user_cat_list'"><i class="bi bi-card-list"></i> 목록</button>
	
	</div>

