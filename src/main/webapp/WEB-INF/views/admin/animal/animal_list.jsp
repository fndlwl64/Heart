<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet_Admin_Animal</title>
<link rel="stylesheet" href="${path}/resources/css/list_view.css">
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="sort" value="${sort }" />
<c:set var="animalDTO" value="${ animalDTO }" />
<c:set var="animalList" value="${ animalList }" />
<c:if test="${animalDTO.animal_tag eq 'dog'}">
	<c:set var="animal" value="강아지" />
</c:if>
<c:if test="${animalDTO.animal_tag eq 'cat'}">
	<c:set var="animal" value="고양이" />
</c:if>
<c:set var="pagingTag" value="animal_species=${ animalDTO.animal_species }&animal_neutered=${ animalDTO.animal_neutered }&animal_size=${animalDTO.animal_size }&animal_name=${animalDTO.animal_name }&animal_vaccination=${animalDTO.animal_vaccination }&animal_state=${animalDTO.animal_state }&sort=${sort }" />
<c:set var="pagingSort" value="animal_species=${ animalDTO.animal_species }&animal_neutered=${ animalDTO.animal_neutered }&animal_size=${animalDTO.animal_size }&animal_name=${animalDTO.animal_name }&animal_vaccination=${animalDTO.animal_vaccination }&animal_state=${animalDTO.animal_state }" />
</head>
<input type="hidden" id="sortlink" value="<%=request.getContextPath() %>/${animalDTO.animal_tag}_list?page=${ paging.page }&${pagingSort}" />
<body>

	<div class="container">

		<%-- 검색 폼 --%>
		<form class="search_form" action="${path}/${animalDTO.animal_tag}_list" method="post">
			<div class="form_box">
				<div class="search-semi-title">
					<span><i class="bi bi-check2-square"></i> ${ animal }관리 검색</span>
				</div>
				<div class="search-table-box">
					<table class="table table-sm" id="search-table">
						<tr>
							<th width="12.5%">${ animal } 종</th>
							<td width="20%">
								<div class="search-date">
									<select class="form-select" id="search_animal" name="animal_species">
										<jsp:include page="../../include/animal_species.jsp" /><!-- animal_species select -->
									</select>
								</div>
							</td>
							<th width="12.5%">${ animal } 크기</th>
							<td width="20%" colspan="2">
								<div class="search-checkbox">
									<label><input type="radio" name="animal_size" value="대형" class="form-check-input" <c:if test="${animalDTO.animal_size eq '대형' }">checked="checked"</c:if> /> 대형</label> <label><input type="radio" name="animal_size" value="중형" class="form-check-input" <c:if test="${animalDTO.animal_size eq '중형' }">checked="checked"</c:if> /> 중형</label> <label><input type="radio" name="animal_size" value="소형" class="form-check-input" <c:if test="${animalDTO.animal_size eq '소형' }">checked="checked"</c:if> /> 소형</label>
								</div>
							</td>
							<td colspan="2"></td>
						<tr>
							<th width="12.5%">${ animal } 이름</th>
							<td width="20%"><input type="text" class="form-control" name="animal_name" value="${animalDTO.animal_name }" /></td>
							<th width="12.5%">중성화 여부</th>
							<td width="10%">
								<div class="search-checkbox">
									<input type="hidden" id="YN" name="animal_neutered" <c:if test="${animalDTO.animal_neutered eq 'Y' }">value="Y"</c:if> /> <label><input type="checkbox" class="form-check-input" id="checkYN" <c:if test="${animalDTO.animal_neutered eq 'Y' }">checked="checked"</c:if>> Yes</label>
								</div>
							</td>
							<th width="12.5%">예방접종 여부</th>
							<td width="10%">
								<div class="search-checkbox">
									<input type="hidden" id="YNvaccin" name="animal_vaccination" <c:if test="${animalDTO.animal_vaccination eq 'Y' }">value="Y"</c:if> /> <label><input type="checkbox" class="form-check-input" id="checkYNvaccin" <c:if test="${animalDTO.animal_vaccination eq 'Y' }">checked="checked"</c:if>> Yes</label>
								</div>
							</td>
							<th width="12.5%">등록 취소 여부</th>
							<td width="10%"><select name="animal_state" class="form-select">
									<option value=0></option>
									<option value=1 <c:if test="${animalDTO.animal_state eq 1 }">selected</c:if>>등록</option>
									<option value=2 <c:if test="${animalDTO.animal_state eq 2 }">selected</c:if>>취소</option>
							</select></td>
							<%-- <th>문의글</th>
	                      <td><input type="text" class="form-control" name="search_content" value="${ search_content }" /></td> --%>
						</tr>

					</table>
					<div class="search-buttons">
						<button class="btn btn-light" type="button" onclick="location.href='${ path }/${animalDTO.animal_tag}_list'">
							<i class="bi bi-arrow-counterclockwise"></i> 리셋
						</button>
						<button type="submit" class="btn btn-dark">
							<i class="bi bi-search"></i> 검색
						</button>
					</div>
				</div>
			</div>

		</form>


		<%-- 검색 결과 테이블 : 일련번호 클릭 시 해당 동물 상세 정보 페이지로 이동 --%>
		<div class="lists">
			<div class="qna-section">
				<div class="row">
					<div class="col total-data">
						<span>총 <fmt:formatNumber value="${ total }" /> 마리
						</span>
					</div>
					<div class="col total-data justify-content-end">
						<select class="form-select form-select-sm order" name="sort" id="sort">
							<option value="">최신등록순</option>
							<option value="name" <c:if test="${sort eq 'name'}">selected</c:if>>이름</option>
							<option value="weight" <c:if test="${sort eq 'weight'}">selected</c:if>>무게</option>
							<option value="age" <c:if test="${sort eq 'age'}">selected</c:if>>나이</option>
						</select>
					</div>
				</div>
			</div>
			<c:set var="No" value="${total - paging.startNo + 2}"></c:set>
			<table class="table table-hover searched_list mb-3">
				<tr>
					<th class="table-light" width="10%">No</th>
					<th class="table-light" width="15%">종</th>
					<th class="table-light" width="12.5%">이름</th>
					<th class="table-light" width="10%">성별</th>
					<th class="table-light" width="10%">사이즈</th>
					<th class="table-light" width="10%">중성화</th>
					<th class="table-light" width="10%">예방접종</th>
					<th class="table-light" width="15%">입양 상태</th>
					<!-- <th class="table-secondary">수정/삭제</th> -->
				</tr>
				<c:if test="${total eq 0 }"><tr><td colspan="8" class="text-center">해당 데이터가 없습니다.</td></tr></c:if>
				<c:forEach var="dto" items="${animalList }">
					<c:set var="No" value="${No - 1 }" />
					<c:if test="${dto.animal_state eq 1 }">
						<tr>
					</c:if>
					<c:if test="${dto.animal_state eq 0 }">
						<tr class="table-secondary">
					</c:if>
					<td>${No }</td>
					<td>${dto.animal_species }</td>
					<c:if test="${dto.animal_state eq 1 }">
						<td><a href="${path}/animal_content?no=${dto.animal_no}">${dto.animal_name }</a></td>
					</c:if>
					<c:if test="${dto.animal_state eq 0 }">
						<td><a data-bs-toggle="modal" data-bs-target="#lockModal" style="cursor: pointer;">${dto.animal_name }</a></td>
					</c:if>
					<td>${dto.animal_gender }</td>
					<td>${dto.animal_size }</td>
					<td>${dto.animal_neutered }</td>
					<td>${dto.animal_vaccination }</td>
					<td>${dto.animal_status }</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div class="insert-form">
			<button class="btn btn-primary insertbtn mb-2" onclick="location.href='${path}/animal_insert?tag=${animalDTO.animal_tag}'">
				<i class="bi bi-pencil-fill"></i> 등록
			</button>
		</div>
		<%-- 페이징처리 --%>

		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mb-5">

				<!-- 처음으로 -->
				<c:if test="${ paging.page eq 1 }">
					<li class="page-item disabled">
				</c:if>
				<c:if test="${ paging.page gt 1 }">
					<li class="page-item">
				</c:if>
				<a class="page-link" href="${link_address}?page=1&${pagingTag}" aria-label="First"> <span aria-hidden="true">&laquo;</span>
				</a>
				</li>

				<!-- 이전으로 -->
				<c:if test="${ paging.page eq 1 }">
					<li class="page-item disabled">
				</c:if>
				<c:if test="${ paging.page gt paging.block }">
					<li class="page-item">
				</c:if>
				<a class="page-link" href="${link_address}?page=${ paging.page - 1 }&${pagingTag}" aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
				</a>
				</li>

				<!-- 페이지 중간 -->
				<c:forEach begin="${ paging.startBlock }" end="${ paging.endBlock }" var="i">
					<c:if test="${ i == paging.page }">
						<li class="page-item active"><a class="page-link" href="${link_address}?page=${ i }&${pagingTag}">${ i }</a></li>
					</c:if>
					<c:if test="${ i != paging.page }">
						<li class="page-item"><a class="page-link" href="${link_address}?page=${ i }&${pagingTag}">${ i }</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음으로 -->
				<c:if test="${ paging.endBlock lt paging.allPage }">
					<li class="page-item">
				</c:if>
				<c:if test="${ paging.endBlock eq paging.allPage }">
					<li class="page-item disabled">
				</c:if>
				<a class="page-link" href="${link_address}?page=${ paging.page + 1 }&${pagingTag}" aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
				</a>
				</li>

				<!-- 마지막으로 -->
				<c:if test="${ paging.endBlock lt paging.allPage }">
					<li class="page-item">
				</c:if>
				<c:if test="${ paging.endBlock eq paging.allPage }">
					<li class="page-item disabled">
				</c:if>
				<a class="page-link" href="${link_address}?page=${ paging.allPage }&${pagingTag}" aria-label="Last"> <span aria-hidden="true">&raquo;</span>
				</a>
				</li>
			</ul>
		</nav>
		<%-- 잠금 모달 --%>
		<!-- Modal -->
		<div class="modal fade" id="lockModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="lockModalLabel">Caution</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">이미 삭제된 데이터입니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
		} else {
			$("#YN").val('');
		}
	});
	$("#checkYNvaccin").change(function() {
		if ($("#checkYNvaccin").is(":checked")) {
			$("#YNvaccin").val('Y');
		} else {
			$("#YNvaccin").val('');
		}
	});
	//정렬 select
	$("#sort").change(
			function() {
				location.href = $("#sortlink").val() + '&sort='
						+ $('select[name=sort]').val();
			});
</script>
</html>