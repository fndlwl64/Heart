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
		
		<c:if test="${dto.animal_tag eq 'cat' }">
			<div class="btns">
				<div>
					<button class="btn btn-dark btn_list" onclick="location.href='${path}/user_cat_list'"><i class="bi bi-card-list"></i> 목록</button>
				</div>
				
				<c:choose>
					<c:when
						test="${not empty user_id and user_id eq adoptRegDTO.adopt_reg_userid and dto.animal_status eq '입양 대기'}">
						<c:set var="deleteAddr"
							value="${path }/user_cancel_animal?animal_no=${dto.animal_no }"></c:set>
						<div>
							<button class="btn btn-danger " data-bs-toggle="modal"
								data-bs-target="#deleteModal" data-id="${ deleteAddr }" onclick="changeOptionCancel()">입양취소</button>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="deleteAddr"
							value="${path }/user_get_animal?animal_no=${dto.animal_no }"></c:set>
						<div>
							<c:choose>
								<c:when test="${dto.animal_status eq '입양 가능' and not empty user_id}">
									<button class="btn btn-primary " data-bs-toggle="modal"
										data-bs-target="#deleteModal" data-id="${ deleteAddr }"
										onclick="changeOption()">입양하기</button>
								</c:when>
								<c:otherwise>
									<form action="user_get_animal" method="post"
										onsubmit="return submitOption();">
										<input type="hidden" id="animal_status"
											value="${dto.animal_status }"> <input type="hidden"
											name="animal_no" id="animal_no" value="${dto.animal_no }">
										<input type="submit" class="btn btn-primary " value="입양하기"
											data-bs-toggle="modal" data-bs-target="#cautionModal">
									</form>
								</c:otherwise>
							</c:choose>
							<%--  --%>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>
		
		<c:if test="${dto.animal_tag eq 'dog' }">
			<div class="btns">
				<div>
					<button class="btn btn-dark btn_list" onclick="location.href='${path}/user_dog_list'"><i class="bi bi-card-list"></i> 목록</button>
				</div>
				
				<c:choose>
					<c:when
						test="${not empty user_id and user_id eq adoptRegDTO.adopt_reg_userid and dto.animal_status eq '입양 대기'}">
						<c:set var="deleteAddr"
							value="${path }/user_cancel_animal?animal_no=${dto.animal_no }"></c:set>
						<div class="col-1">
		
							<button class="btn btn-danger " data-bs-toggle="modal"
								data-bs-target="#deleteModal" data-id="${ deleteAddr }" onclick="changeOptionCancel()">입양취소</button>
		
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="deleteAddr"
							value="${path }/user_get_animal?animal_no=${dto.animal_no }"></c:set>
						<div class="col-1">
							<c:choose>
								<c:when test="${dto.animal_status eq '입양 가능' and not empty user_id}">
									<button class="btn btn-primary " data-bs-toggle="modal"
										data-bs-target="#deleteModal" data-id="${ deleteAddr }"
										onclick="changeOption()">입양하기</button>
								</c:when>
								<c:otherwise>
									<form action="user_get_animal" method="post"
										onsubmit="return submitOption();">
										<input type="hidden" id="animal_status"
											value="${dto.animal_status }"> <input type="hidden"
											name="animal_no" id="animal_no" value="${dto.animal_no }">
										<input type="submit" class="btn btn-primary " value="입양하기"
											data-bs-toggle="modal" data-bs-target="#cautionModal">
									</form>
								</c:otherwise>
							</c:choose>
							<%--  --%>
						</div>
					</c:otherwise>
				</c:choose>
			</div>	
		</c:if>
		
	</div> <%-- div1 end --%>
	
	<!-- Modal -->
	<jsp:include page="../../include/cautionModal.jsp" />
	<jsp:include page="../../include/deleteModal.jsp" />
	
<script type="text/javascript">
	function changeOption() {
		$('#deleteModalLabel').empty();
		$('#deleteModalLabel').append('입양신청');
		$('#deleteModalBody').empty();
		$('#deleteModalBody').append('입양신청을 하시겠습니까?');
		$('#deleteFunction').empty();
		$('#deleteFunction').append('신청');
	}
	function changeOptionCancel() {
		$('#deleteModalLabel').empty();
		$('#deleteModalLabel').append('입양취소');
		$('#deleteModalBody').empty();
		$('#deleteModalBody').append('입양신청을 취소하시겠습니까?');
		$('#deleteFunction').empty();
		$('#deleteFunction').append('취소');
	}
	function submitOption() {
		if (!$('#user_grade').val()) {
			$('.modal-body-cancel').empty();
			$('.modal-body-cancel').append('로그인을 해주세요');
			return false;
		}
		if ($('#user_grade').val() > 3) {
			$('.modal-body-cancel').empty();
			$('.modal-body-cancel').append('회원의 등급이 낮아 입양 자격이 없습니다.');
			return false;
		}
		if ($('#animal_status').val() == '입소 신청') {
			$('.modal-body-cancel').empty();
			$('.modal-body-cancel').append('아직 입소가 완료되지 않은 상태입니다.');
			return false;
		}
		if ($('#animal_status').val() == '입양 대기') {
			$('.modal-body-cancel').empty();
			$('.modal-body-cancel').append('입양 대기 중인 상태입니다.');
			return false;
		}
		if ($('#animal_status').val() == '입양 완료') {
			$('.modal-body-cancel').empty();
			$('.modal-body-cancel').append('이미 입양 완료된 상태입니다.');
			return false;
		}
	}
	let wishDTO = {
		"wish_petno" : $("#animal_number").val(),
		"wish_userid" : $("#user_id").val()
	};
	$(document).ready(function() {$("#wish").on("click",function() {
		let wishDTO = {
			"wish_petno" : $("#animal_number").val(),
			"wish_userid" : $("#user_id").val()
		};
		$.ajax({
			url : $("#linkwish").val(),
			type : 'POST',
			data : JSON.stringify(wishDTO),
			contentType : "application/json",
			success : function(data) {
				if (data) {
					$("#wish").empty();
					$("#wish").append(
									'<i class="bi bi-star-fill text-warning"></i>');
				} else {
					$("#wish").empty();
					$("#wish").append('<i class="bi bi-star"></i>');
				}
			}
		})
		});
	});
</script>

<jsp:include page="../../include/user_footer.jsp" />
	