<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet</title>
<link rel="stylesheet" href="${path}/resources/css/list_view.css">
<script src="${path}/resources/js/main.js"></script>

<%-- <meta charset="UTF-8">
<title>HeartPet</title>
<link rel="stylesheet" href="${path}resources/css/list_view.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="${path}resources/js/main.js"></script> --%>
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="sort" value="${sort }" />
<c:set var="catList" value="${ catList }" />
<c:set var="animalDTO" value="${ animalDTO }" />
<c:set var="pagingTag"
	value="animal_species=${ animalDTO.animal_species }&animal_neutered=${ animalDTO.animal_neutered }&animal_size=${animalDTO.animal_size }&sort=${sort }" />
<c:set var="pagingSort"
	value="animal_species=${ animalDTO.animal_species }&animal_neutered=${ animalDTO.animal_neutered }&animal_size=${animalDTO.animal_size }" />
</head>
<input type="hidden" id="sortlink"
	value="<%=request.getContextPath() %>/cat_list?page=${ paging.page }&${pagingSort}" />
<body>

	<div class="container">

		<br> <br>

		<%-- 검색 폼 --%>
		<form class="search_form" action="${path}/cat_list" method="post">
			<div class="form_box">
				<select name="animal_species" class="form-select form-select-sm w-25">
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
				<!-- <label class="Dneutered"><input type="checkbox"
					name="animal_neutered"> 중성화</label> <label class="size"><input
					type="radio" name="animal_size" ondblclick="this.checked=false"
					value="대형"> 대</label> <label class="size"><input
					type="radio" name="animal_size" ondblclick="this.checked=false"
					value="중형"> 중</label> <label class="size"><input
					type="radio" name="animal_size" ondblclick="this.checked=false"
					value="소형"> 소</label> -->
				<div>
					<label><input type="radio" name="animal_size" value="대형" />대</label>
					<label><input type="radio" name="animal_size" value="중형" />중</label>
					<label><input type="radio" name="animal_size" value="소형" />소</label>
				</div>
				<div>
					<input type="hidden" id="YN" name="animal_neutered" /> <label><input
						type="checkbox" id="checkYN">중성화</label>
				</div>
				<div>
					<button class="btn searchbtn" type="submit">
						<i class="bi bi-search"></i>검색
					</button>
				</div>
			</div>

		</form>


		<%-- 검색 결과 테이블 : 일련번호 클릭 시 해당 동물 상세 정보 페이지로 이동 --%>
		<div class="lists">
			<%--정렬--%>
			<div class="d-flex justify-content-end my-2">
				<div class="validation-form mx-2">
					<select class="form-select form-select-sm" name="sort" id="sort">
						<option value="">정렬</option>
						<option value="size"
							<c:if test="${sort eq 'size'}">selected</c:if>>크기</option>
						<option value="weight"
							<c:if test="${sort eq 'weight'}">selected</c:if>>무게</option>
						<option value="age" <c:if test="${sort eq 'age'}">selected</c:if>>나이</option>
					</select>
				</div>
			</div>
			<table class="table table-hover searched_list">
				<tr>
					<th class="table-light col-1">이름</th>
					<th class="table-light col-1">종</th>
					<th class="table-light col-1">성별</th>
					<th class="table-light col-1">크기</th>
					<th class="table-light col-1">중성화</th>
					<th class="table-light col-1">예방접종</th>
					<th class="table-light col-1">입양 상태</th>
					<!-- <th class="table-secondary">수정/삭제</th> -->
				</tr>
				<c:forEach var="dto" items="${catList }">
					<c:if test="${dto.animal_state eq 1 }">
						<tr>
							<td><a href="${path}/animal_content?no=${dto.animal_no}">${dto.animal_name }</a></td>
					</c:if>
					<c:if test="${dto.animal_state eq 0 }">
						<tr class="table-secondary">
						<td><a data-bs-toggle="modal"
							data-bs-target="#lockModal">${dto.animal_name }</a></td>
					</c:if>
					<td>${dto.animal_species }</td>
					<td>${dto.animal_gender }</td>
					<td>${dto.animal_size }</td>
					<td>${dto.animal_neutered }</td>
					<td>${dto.animal_vaccination }</td>
					<td>${dto.animal_status }</td>
					<%-- <td>
							<button class="btn btn-primary"
								onclick="location.href='${path}/animal_update?no=${dto.animal_no }'">수정</button>
							<button class="btn btn-secondary" data-bs-toggle="modal"
								data-bs-target="#exampleModal"
								onclick="location.href='${path}/animal_delete?no=${dto.animal_no }'">삭제</button>
						</td> --%>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="7"><button
							class="btn btn-success btn-sm insertbtn float-end"
							onclick="location.href='${path}/animal_insert?tag=cat'">등록</button></td>
				</tr>
			</table>
		</div>
		<br>
		<%-- 페이징처리 --%>

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
		<%-- 잠금 모달 --%>
		<!-- Modal -->
		<div class="modal fade" id="lockModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="lockModalLabel">Caution</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">이미 삭제된 데이터입니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#checkYN").change(function() {
		if ($("#checkYN").is(":checked")) {
			$("#YN").val('Y');
			console.log($("#YN").val());
		} else {

		}
	})
	//정렬 select
	$("#sort").change(
			function() {
				location.href = $("#sortlink").val() + '&sort='
						+ $('select[name=sort]').val();
			});
</script>
</html>