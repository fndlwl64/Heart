<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/list_view.css">
<jsp:include page="../../include/user_header.jsp" />
<%
pageContext.setAttribute("newline", "\n");
%>
<c:set var="dto" value="${dto }" />
<c:set var="wishCheck" value="${wishCheck }" />
<c:set var="adoptRegDTO" value="${adoptRegDTO }" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="user_id"
	value='<%=(String) session.getAttribute("session_id")%>' />
<c:set var="user_grade"
	value='<%=(Integer) session.getAttribute("session_grade")%>' />
<c:set var="deleteAddr" value="${path }/user_cancel_animal?animal_no=${dto.animal_no }"></c:set>	
<input type="hidden" value="<%=request.getContextPath()%>/wish"
	id="linkwish">
<input type="hidden" value="${user_id }" id="user_id" />
<input type="hidden" value="${user_grade }" id="user_grade" />
<script src="${path}/resources/js/admin_list_view.js"></script>
<div class="container">
	<div class="_container">

		<div class="wrap">

			<h3>입양동물</h3>

			<div class="user_info">

				<div class="info_title">
					<ul class="info_border">
						<%-- <li><img class="user_img"
							src="<%=request.getContextPath()%>/resources/upload/${dto.animal_img1}"
							alt="회원 랜덤 이미지" /></li> --%>
						<li>
							<div>
								<label class="title">이름</label> <span class="bold">
									${dto.animal_name}</span> <br /> <label class="title">입양상태</label> <span>
									${dto.animal_status}</span>
							</div>
						</li>
					</ul>

					<ul class="">
						<li class="forMargin">
							<div>
								<label class="title">입소날짜</label><span>${adoptRegDTO.adopt_reg_appdate }</span>
								<br /> <label class="title">백신</label><span>${dto.animal_vaccination }</span>
								<br /> <label class="title">중성화</label><span>${dto.animal_neutered}</span>
							</div>
						</li>
					</ul>
				</div>
			</div>

		</div>

		<div class="wrap">
			<h3>상세정보</h3>
			<div class="user_info">
				<div class="info_title">
					<ul>
						<li class="forMargin">
							<div>
								<label class="title">품종</label><span>
									${dto.animal_species }</span> <br /> <label class="title">나이</label><span>
									${dto.animal_age }</span> <br /> <label class="title">성별</label><span>
									${dto.animal_gender }</span> <br /> <label class="title">크기</label><span>
									${dto.animal_size }</span> <br /> <label class="title">발견장소</label><span>
									${dto.animal_place }</span> <br />
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-8"></div>
		<div class="col-1">
			<c:if test="${not empty user_id }">
				<button class="btn" id="wish">
					<c:if test="${wishCheck ne 0 }">
						<i class="bi bi-star-fill text-warning"></i>
					</c:if>
					<c:if test="${wishCheck eq 0 }">
						<i class="bi bi-star"></i>
					</c:if>
				</button>
			</c:if>
		</div>
		<c:choose>
			<c:when
				test="${not empty user_id and user_id eq adoptRegDTO.adopt_reg_userid and dto.animal_status eq '입양 대기'}">
				<c:set var="deleteAddr"
					value="${path }/user_cancel_animal?animal_no=${dto.animal_no }"></c:set>
				<div class="col-1">

					<button class="btn btn-danger " data-bs-toggle="modal"
						data-bs-target="#deleteModal" data-id="${ deleteAddr }">입양취소</button>

				</div>
			</c:when>
			<c:otherwise>
				<c:set var="deleteAddr"
					value="${path }/user_get_animal?animal_no=${dto.animal_no }"></c:set>
				<div class="col-1">
					<c:choose>
						<c:when test="${dto.animal_status eq '입양 가능'}">
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

	<!-- Modal -->
	<jsp:include page="../../include/cautionModal.jsp" />
	<jsp:include page="../../include/deleteModal.jsp" />
</div>
<script type="text/javascript">
	function changeOption() {
		$('#deleteModalLabel').empty();
		$('#deleteModalLabel').append('입양신청');
		$('#deleteModalBody').empty();
		$('#deleteModalBody').append('입양신청을 하시겠습니까?');
		
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
	$(document)
			.ready(
					function() {
						$("#wish")
								.on(
										"click",
										function() {
											let wishDTO = {
												"wish_petno" : $("#animal_no")
														.val(),
												"wish_userid" : $("#user_id")
														.val()
											};
											$
													.ajax({
														url : $("#linkwish")
																.val(),
														type : 'POST',
														data : JSON
																.stringify(wishDTO),
														contentType : "application/json",
														success : function(data) {
															if (data) {
																$("#wish")
																		.empty();
																$("#wish")
																		.append(
																				'<i class="bi bi-star-fill text-warning"></i>');
															} else {
																$("#wish")
																		.empty();
																$("#wish")
																		.append(
																				'<i class="bi bi-star"></i>');
															}
														}
													})
										});
					});
</script>


<jsp:include page="../../include/user_footer.jsp" />