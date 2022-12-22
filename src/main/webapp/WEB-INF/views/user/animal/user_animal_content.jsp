<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/user_animal_main.css">
<jsp:include page="../../include/user_header.jsp" />
<%
pageContext.setAttribute("newline", "\n");
%>
<c:set var="wishCheck" value="${wishCheck }" />
<c:set var="appdate" value="${appdate }" />
<c:set var="user_id"
	value='<%=(String) session.getAttribute("session_id")%>' />
<input type="hidden" value="<%=request.getContextPath()%>/wish"
	id="linkwish">
<input type="hidden" value="${user_id }" id="user_id" />
<div class="container">
	<div class=" justify-content-start">
		<c:if test="${not empty appdate }">
			<dl class="col mx-5">
				<dt>입소날짜</dt>
				<dd>${appdate }</dd>
			</dl>
		</c:if>
	</div>
	<div>
		<div class="justify-content-center">
			<div class="row row-cols-auto rounded-3 m-2 animal-row">
				<div class="col-4 ">
					<img class="img-thumbnail"
						src="<%=request.getContextPath()%>/resources/upload/${dto.animal_img1}">
				</div>
				<div class="col-4 m-1 animal-col">
					<dl class="m-2">
						<dt class="mx-2">이름</dt>
						<dd class="mx-2">${dto.animal_name }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">품종</dt>
						<dd class="mx-2">${dto.animal_species }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">성별</dt>
						<dd class="mx-2">${dto.animal_gender }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">백신접종</dt>
						<dd class="mx-2">${dto.animal_vaccination }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">크기</dt>
						<dd class="mx-2">${dto.animal_size }</dd>
					</dl>
				</div>
				<div class="col-2 m-1 animal-col">
					<dl class="m-2">
						<dt class="mx-2">발견장소</dt>
						<dd class="mx-2">${dto.animal_place }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">중성여부</dt>
						<dd class="mx-2">${dto.animal_neutered }</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">나이</dt>
						<dd class="mx-2">${dto.animal_age }(세)</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">체중</dt>
						<dd class="mx-2">${dto.animal_weight }(Kg)</dd>
					</dl>
					<dl class="m-2">
						<dt class="mx-2">입양상태</dt>
						<dd class="mx-2">${dto.animal_status }</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class=" justify-content-center">
			<div class="row row-cols-auto rounded-3 m-2">
				<div class="col-6 animal-col">
					<div class="form-control animal_explan text-center m-2">${dto.animal_caution.replace(newline,'<br>') }</div>
				</div>
				<c:if
					test="${not empty dto.animal_img2 or not empty dto.animal_img3 }">
					<div class="col-6">
						<c:if test="${not empty dto.animal_img2}">
							<div class="row row-cols-auto rounded-3 m-2">
								<img class="img-thumbnail"
									src="<%=request.getContextPath()%>/resources/upload/${dto.animal_img2}">
							</div>
						</c:if>
						<c:if test="${not empty dto.animal_img3 }">
							<div class="row row-cols-auto rounded-3 m-2">
								<img class="img-thumbnail"
									src="<%=request.getContextPath()%>/resources/upload/${dto.animal_img3}">
							</div>
						</c:if>
					</div>
				</c:if>
			</div>

		</div>
	</div>
	<input type="hidden" id="animal_status" value="${dto.animal_status }">

	<form action="user_get_animal" method="post"
		onsubmit="return submitOption();">
		<div class="animal-right float-end">
			<c:if test="${not empty user_id }">

				<button class="btn" id="wish">
					<c:if test="${wishCheck ne 0 }">
						<i class="bi bi-star-fill text-warning"></i>'
					</c:if>
					<c:if test="${wishCheck eq 0 }">
						<i class="bi bi-star"></i>
					</c:if>

				</button>

			</c:if>
			<input type="hidden" name="animal_no" id="animal_no"
				value="${dto.animal_no }"> <input type="submit"
				class="btn btn-primary " value="입양하기">
		</div>
	</form>
	<br><br><br>
</div>
<script type="text/javascript">
	function submitOption() {
		if ($('#user_grade').val() < 3) {
			alert("회원의 등급이 낮아 입양 자격이 없습니다.");
			return false;
		}
		if ($('#animal_status').val() == '입소 신청') {
			alert('아직 입소가 완료되지 않은 상태입니다.');
			return false;
		}
		if ($('#animal_status').val() == '입양 대기') {
			alert('입양 대기 중인 상태입니다.');
			return false;
		}
		if ($('#animal_status').val() == '입양 완료') {
			alert('이미 입양 완료된 상태입니다.')
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
											console.log(wishDTO);
											$
													.ajax({
														url : $("#linkwish")
																.val(),
														type : 'POST',
														data : JSON
																.stringify(wishDTO),
														contentType : "application/json",
														success : function(data) {
															console
																	.log('success');
															console.log(data);
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

											/* <i class="bi bi-star-fill text-warning"></i> */
										});
					});
</script>


<jsp:include page="../../include/user_footer.jsp" />