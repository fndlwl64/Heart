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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
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
<c:set var="dogList" value="${ dogList }"/>
<c:set var="animalDTO" value="${ animalDTO }"/>
<c:set var="pagingTag" value="animal_species=${ animalDTO.animal_species }&animal_neutered=${ animalDTO.animal_neutered }&animal_size=${animalDTO.animal_size }"/>
</head>
<body>

	<div class="container">

		<br> <br>

		<%-- 검색 폼 --%>
		<form class="search_form" action="${path}/dog_list" method="post">
			<div class="form_box">

				<select name="animal_species">
					<option value=""></option>
					<option value="말티즈">말티즈</option>
					<option value="푸들">푸들</option>
					<option value="포메라니안">포메라니안</option>
					<option value="믹스견">믹스견</option>
					<option value="치와와">치와와</option>
					<option value="시츄">시츄</option>
					<option value="골든리트리버">골든리트리버</option>
					<option value="진돗개">진돗개</option>
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
				<input type="hidden" id="YN" name="animal_neutered"/>
				<label><input type="checkbox" id="checkYN">중성화</label> 
				<label><input type="radio" name="animal_size" value="대형"/>대</label>
				<label><input type="radio" name="animal_size" value="중형"/>증</label>
				<label><input type="radio" name="animal_size" value="소형"/>소</label>
				<input class="btn searchbtn" type="submit" value="검색">

			</div>

		</form>

		<br>

		<button class="btn btn-success insertbtn"
			onclick="location.href='${path}/animal_insert?tag=dog'">등록</button>

		<br> <br>

		<%-- 검색 결과 테이블 : 일련번호 클릭 시 해당 동물 상세 정보 페이지로 이동 --%>
		<div class="lists">
			<table class="table searched_list">
				<tr>
					<th class="table-secondary">이름</th>
					<th class="table-secondary">종</th>
					<th class="table-secondary">성별</th>
					<th class="table-secondary">크기</th>
					<th class="table-secondary">중성화</th>
					<th class="table-secondary">예방접종</th>
					<th class="table-secondary">입양 상태</th>
					<th class="table-secondary">수정/삭제</th>
				</tr>
				<c:forEach var="dto" items="${dogList }">
					<tr>
						<td><a href="${path}/dog_view">${dto.animal_name }</a></td>
						<td>${dto.animal_species }</td>
						<td>${dto.animal_gender }</td>
						<td>${dto.animal_size }</td>
						<td>${dto.animal_neutered }</td>
						<td>${dto.animal_vaccination }</td>
						<td>${dto.animal_status }</td>
						<td>
							<button class="btn btn-primary"
								onclick="location.href='${path}/animal_update?no=${dto.animal_no }'">수정</button>
							<button class="btn btn-secondary" data-bs-toggle="modal"
								data-bs-target="#exampleModal"
								onclick="location.href='${path}/animal_delete?no=${dto.animal_no }'">삭제</button>
						</td>
					</tr>
				</c:forEach>
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
				<a class="page-link"
					href="${link_address}?page=1&${pagingTag}"
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
		<%-- 삭제 모달 --%>
		<%-- <div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div id="myInput" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">해당 데이터를 삭제하시겠습니까?</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger"
							onclick="location.href='${path}/dog_delete?no=${dto.animal_no }'">삭제</button>
					</div>
				</div>
			</div>
		</div> --%>

	</div>

</body>
<script type="text/javascript">
	$("#checkYN").change(
		function(){
			if($("#checkYN").is(":checked")){
				$("#YN").val('Y');
				console.log($("#YN").val());
			}else{
				
			}
		}
	)
</script>
</html>