<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<link rel="stylesheet" href="${path}/resources/css/web.css">
<jsp:include page="../../include/user_header.jsp" />
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="animalList" value="${animalList }" />
<c:set var="animalDTO" value="${ animalDTO }" />
<c:set var="keyword" value="${keyword }" />
<c:set var="sort" value="${sort }" />
<c:set var="pagingTag"
	value="animal_size=${animalDTO.animal_size }&animal_species=${ animalDTO.animal_species}&animal_age=${animalDTO.animal_age }&animal_gender=${animalDTO.animal_gender }&animal_weight=${animalDTO.animal_weight }&animal_status=${animalDTO.animal_status }&animal_place=${animalDTO.animal_place }&keyword=${keyword }&sort=${sort }" />
<c:set var="pagingSort"
	value="animal_size=${animalDTO.animal_size }&animal_species=${ animalDTO.animal_species}&animal_age=${animalDTO.animal_age }&animal_gender=${animalDTO.animal_gender }&animal_weight=${animalDTO.animal_weight }&animal_status=${animalDTO.animal_status }&animal_place=${animalDTO.animal_place }&keyword=${keyword }" />
<%--검색--%>
<input type="hidden" id="sortlink"
	value="<%=request.getContextPath() %>/user_${animalDTO.animal_tag }_list?page=${ paging.page }&${pagingSort}" />
<div class="d-flex justify-content-center" style="font-size: 14px">
	<form
		action="<%=request.getContextPath() %>/user_${animalDTO.animal_tag }_list"
		class="validation-form" method="post">
		<div class="row row-cols-auto form-select-sm">
			<div class="col">
				<div class="input-group">
					<select name="animal_place" class="form-select">
						<option value=""></option>
						<option value="서울">서울특별시</option>
						<option value="울산">울산광역시</option>
						<option value="인천">인천광역시</option>
						<option value="부산">부산광역시</option>
						<option value="대전">대전광역시</option>
						<option value="광주">광주광역시</option>
						<option value="대구">대구광역시</option>
						<option value="세종">세종특별자치시</option>
						<option value="제주">제주도</option>
					</select> <span class="btn btn-sm btn-secondary position-relative">장소</span>
				</div>
			</div>

			<div class="col-sm">
				<div class="input-group">
					<input type="text" name="keyword" placeholder="상세주소 입력"
						class="form-control">
				</div>
			</div>
			<div class="col">
				<div class="input-group">
					<select name="animal_status" class="form-select">
						<option value=""></option>
						<option value="입소 신청">입소 신청</option>
						<option value="입양 가능">입양 가능</option>
						<option value="입양 대기">입양 대기</option>
						<option value="입양 완료">입양 완료</option>
					</select> <span class="btn btn-sm btn-secondary position-relative">입양</span>
				</div>
			</div>

		</div>
		<div class="row row-cols-auto form-select-sm">

			<div class="col">
				<div class="input-group">
					<select name="animal_gender" class="form-select">
						<option value=""></option>
						<option value="male">수컷</option>
						<option value="female">암컷</option>
					</select> <span class="btn btn-sm btn-secondary position-relative">성별</span>
				</div>
			</div>
			<div class="col">
				<div class="input-group">
					<select name="animal_age" class="form-select">
						<option value="0"></option>
						<option value="1">0~1</option>
						<option value="2">1~2</option>
						<option value="3">2~3</option>
						<option value="4">3~4</option>
						<option value="5">4~5</option>
						<option value="6">5~</option>
					</select> <span class="btn btn-sm btn-secondary position-relative">나이</span>
				</div>
			</div>

			<div class="col">
				<div class="input-group">
					<c:if test="${animalDTO.animal_tag eq 'dog'}">
						<select name="animal_species" class="form-select">
							<option value=""></option>
							<option value="말티즈">말티즈</option>
							<option value="푸들">푸들</option>
							<option value="포메라니안">포메라니안</option>
							<option value="믹스견">믹스견</option>
							<option value="치와와">치와와</option>
							<option value="시츄">시츄</option>
							<option value="골든리트리버">시츄</option>
							<option value="진돗개">진돗개</option>
							<option value="기타">기타</option>
						</select>
					</c:if>
					<c:if test="${animalDTO.animal_tag eq 'cat'}">
						<select name="animal_species" class="form-select">
							<option value=""></option>
							<option value="스코티시">스코티시</option>
							<option value="폴드">폴드</option>
							<option value="샴">샴</option>
							<option value="페르시안">페르시안</option>
							<option value="터키시">터키시</option>
							<option value="앙고라">앙고라</option>
							<option value="러시안 블루">러시안 블루</option>
							<option value="벵갈">벵갈</option>
							<option value="먼치킨">먼치킨</option>
							<option value="아비시니안">아비시니안</option>
							<option value="기타">기타</option>
						</select>
					</c:if>
					<span class="btn btn-sm btn-secondary position-relative">품종</span>
				</div>
			</div>

			<div class="col">
				<div class="input-group">
					<select name="animal_size" class="form-select">
						<option value=""></option>
						<option value="소형">소형</option>
						<option value="중형">중형</option>
						<option value="대형">대형</option>
					</select> <span class="btn btn-sm btn-secondary position-relative">크기</span>
				</div>
			</div>
			<div class="col">
				<div class="input-group">
					<input type="number" value="0" min="0" name="animal_weight"
						class="form-control" style="width: 70px"> <span
						class="btn btn-sm btn-secondary position-relative">무게</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-6"></div>
			<div class="col-4"></div>
			<div class="col-1">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
		</div>
	</form>
</div>

<%--정렬--%>
<div class="d-flex justify-content-end my-2">
	<div class="validation-form mx-2">
		<select class="form-select form-select-sm" name="sort" id="sort">
			<option value="">정렬</option>
			<option value="size" <c:if test="${sort eq 'size'}">selected</c:if>>크기</option>
			<option value="weight"
				<c:if test="${sort eq 'weight'}">selected</c:if>>무게</option>
			<option value="age" <c:if test="${sort eq 'age'}">selected</c:if>>나이</option>
		</select>
	</div>
	<!-- <form class="validation-form mx-2" action="" method="post">
		<select class="form-select form-select-sm " name="sort">
			<option value="des">내림차순</option>
			<option value="asc">오름차순</option>
		</select>
	</form> -->
</div>

<%--메인 페이지--%>
<div class="d-flex justify-content-center">
	<%--강아지 정보 폼--%>

	<div class="row row-cols-4">
		<c:if test="${not empty animalList}">
			<c:forEach var="dto" items="${animalList}">
				<div class="col">
					<div class="d-inline-block text-center">
						<a
							href="<%=request.getContextPath() %>/user_animal_content?no=${dto.getAnimal_no()}"><img
							class="img-fluid rounded mx-auto img-frame"
							src="<%=request.getContextPath()%>/resources/upload/${dto.getAnimal_img1()}"></a>
						<span class="text-center">${dto.getAnimal_name() }</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<c:if test="${empty animalList}">
		<h3>해당 내용이 없습니다.</h3>
	</c:if>

</div>
<%--페이징--%>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">

		<!-- 처음으로 -->
		<c:if test="${ paging.page eq 1 }">
			<li class="page-item disabled">
		</c:if>
		<c:if test="${ paging.page gt 1 }">
			<li class="page-item">
		</c:if>
		<a class="page-link" href="${link_address}?page=1&${pagingTag}"
			aria-label="First"> <span aria-hidden="true">&laquo;</span>
		</a>
		</li>

		<!-- 이전으로 -->
		<c:if test="${ paging.page eq 1 }">
			<li class="page-item disabled">
		</c:if>
		<c:if test="${ paging.page gt paging.block }">
			<li class="page-item">
		</c:if>
		<a class="page-link"
			href="${link_address}?page=${ paging.page - 1 }&${pagingTag}"
			aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
		</a>
		</li>

		<!-- 페이지 중간 -->
		<c:forEach begin="${ paging.startBlock }" end="${ paging.endBlock }"
			var="i">
			<c:if test="${ i == paging.page }">
				<li class="page-item active"><a class="page-link"
					href="${link_address}?page=${ i }&${pagingTag}">${ i }</a></li>
			</c:if>
			<c:if test="${ i != paging.page }">
				<li class="page-item"><a class="page-link"
					href="${link_address}?page=${ i }&${pagingTag}">${ i }</a></li>
			</c:if>
		</c:forEach>

		<!-- 다음으로 -->
		<c:if test="${ paging.endBlock lt paging.allPage }">
			<li class="page-item">
		</c:if>
		<c:if test="${ paging.endBlock eq paging.allPage }">
			<li class="page-item disabled">
		</c:if>
		<a class="page-link"
			href="${link_address}?page=${ paging.page + 1 }&${pagingTag}"
			aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
		</a>
		</li>

		<!-- 마지막으로 -->
		<c:if test="${ paging.endBlock lt paging.allPage }">
			<li class="page-item">
		</c:if>
		<c:if test="${ paging.endBlock eq paging.allPage }">
			<li class="page-item disabled">
		</c:if>
		<a class="page-link"
			href="${link_address}?page=${ paging.allPage }&${pagingTag}"
			aria-label="Last"> <span aria-hidden="true">&raquo;</span>
		</a>
		</li>
	</ul>
</nav>
<script type="text/javascript">
	//정렬 select
	$("#sort").change(
			function() {
				location.href = $("#sortlink").val() + '&sort='
						+ $('select[name=sort]').val();
			});
</script>

<jsp:include page="../../include/user_footer.jsp" />

