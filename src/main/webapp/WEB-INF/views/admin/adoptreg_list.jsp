<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet</title>
<link rel="stylesheet" href="${path }/resources/css/list_view.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="startDate" value="${ startDate }" />
<c:set var="endDate" value="${ endDate }" />
<c:set var="list" value="${adoptRegList }"></c:set>
<c:set var="map" value="${animalMap }"></c:set>
<c:set var="tag" value="${tag }"></c:set>
<c:set var="sort" value="${sort }"/>
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="pagingSort"
	value="startDate=${ startDate }&endDate=${ endDate }&adopt_tag=${tag }" />
<c:set var="pagingTag"
	value="startDate=${ startDate }&endDate=${ endDate }&adopt_tag=${tag }&sort=${sort }" />
<input type="hidden" id="sortlink" value="<%=request.getContextPath() %>/adoptreg_list?page=${ paging.page }&${pagingSort}" />	
<!-- 쿼리 조인을 피하기 위한 key, value를 통한 animal테이블 데이터 참조 -->

<body>
	<div class="container">
		<br> 검색 폼
		<form class="search_form" method="post"
			action="${path }/adoptreg_list">
			<div class="form_box row">
				<div class="col">

					<select name="adopt_tag">
						<option value="adopt_reg_appdate"
							<c:if test="${tag eq 'adopt_reg_appdate'}">selected</c:if>>입소신청일</option>
						<option value="adopt_reg_regdate"
							<c:if test="${tag eq 'adopt_reg_regdate'}">selected</c:if>>입양등록일</option>
						<option value="adopt_reg_duedate"
							<c:if test="${tag eq 'adopt_reg_duedate'}">selected</c:if>>입양예정일</option>
						<option value="adopt_reg_adoptdate"
							<c:if test="${tag eq 'adopt_reg_adoptdate'}">selected</c:if>>입양완료일</option>
					</select>
				</div>
				<div class="col">
					<input type="date" name="startDate" value="${startDate }">
				</div>
				<div class="col">
					<input type="date" name="endDate" value="${endDate }">
				</div>
				<div class="col form_box_div search">
					<input class="btn btn-secondary searchbtn" type="submit" value="검색">
				</div>

			</div>
		</form>

		<%-- 검색 결과 테이블 --%>
		<div class="lists">
			<%--정렬--%>
			<div class="d-flex justify-content-end my-2">
				<div class="validation-form mx-2">
					<select class="form-select form-select-sm" name="sort" id="sort">
						<option value="">정렬</option>
						<option value="adopt_reg_appdate" <c:if test="${sort eq 'adopt_reg_appdate'}">selected</c:if> >입소신청일</option>
						<option value="adopt_reg_regdate" <c:if test="${sort eq 'adopt_reg_regdate'}">selected</c:if> >입양등록일</option>
						<option value="adopt_reg_duedate" <c:if test="${sort eq 'adopt_reg_duedate'}">selected</c:if> >입양예정일</option>
						<option value="adopt_reg_adoptdate" <c:if test="${sort eq 'adopt_reg_adoptdate'}">selected</c:if> >입양완료일</option>
					</select>
				</div>
			</div>
			<table class="table table-hover searched_list">
				<tr>
					<th class="table-light col-1">회원 아이디</th>
					<th class="table-light col-1">동물 이름</th>
					<th class="table-light col-1">입소 신청일</th>
					<th class="table-light col-1">입양 등록일</th>
					<th class="table-light col-1">입양 예정일</th>
					<th class="table-light col-1">입양 완료일</th>
					<th class="table-light col-1">입양 상태</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td class="list-title text-center">${dto.adopt_reg_userid }</td>
						<td class="list-title text-center">${map.get(dto.adopt_reg_animalno).get(0) }</td>
						<td class="list-title text-center">${dto.adopt_reg_appdate }</td>
						<td class="list-title text-center">${dto.adopt_reg_regdate }</td>
						<td class="list-title text-center">${dto.adopt_reg_duedate }</td>
						<td class="list-title text-center">${dto.adopt_reg_adoptdate }</td>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(1) ne '입양 대기'}">
							<td><a class="text-primary" data-bs-toggle="modal"
								data-bs-target="#admissionModal"
								data-id="${path }/adoptreg_admission?animal_no=${dto.adopt_reg_animalno}&animal_status=${map.get(dto.adopt_reg_animalno).get(1)}" data-value="${map.get(dto.adopt_reg_animalno).get(1)}" onclick="onclickOption(this);" >${map.get(dto.adopt_reg_animalno).get(1)}</a></td>
						</c:if>
						<%-- <c:if test="${map.get(dto.adopt_reg_animalno).get(1) eq '입양 가능'}">
							<td><a class="text-primary" data-bs-toggle="modal"
								data-bs-target="#admissionModal"
								data-id="${path }/adoptreg_admission?animal_no=${dto.adopt_reg_animalno}">${map.get(dto.adopt_reg_animalno).get(1)}</a></td>
						</c:if>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(1) eq '입양 완료'}">
							<td><a class="text-primary" data-bs-toggle="modal"
								data-bs-target="#admissionModal"
								data-id="${path }/adoptreg_admission?animal_no=${dto.adopt_reg_animalno}">${map.get(dto.adopt_reg_animalno).get(1)}</a></td>
						</c:if> --%>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(1) eq '입양 대기'}">
							<td><a
								href="<%=request.getContextPath() %>/adoptreg_update?adopt_reg_regno=${dto.getAdopt_reg_regno() }"
								data-value="${dto.adopt_reg_animalno }">${map.get(dto.adopt_reg_animalno).get(1) }</a></td>
						</c:if>
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
		<!-- Modal -->
		<div class="modal fade" id="admissionModal" tabindex="-1"
			aria-labelledby="admissionModalLabel" aria-hidden="true">
			<div id="admissionInput" class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="admissionModalLabel">입소 신청
							수락</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">입소 신청을 수락하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger"
							id="admissionFunction">수락</button>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
	function onclickOption(data) {
		let modal_text = $(data).data("value");
		$('.modal-title').empty();
		$('.modal-title').append(modal_text+' 수정');
		$('.modal-body').empty();
		$('.modal-body').append(modal_text+'을(를) 수저하시겠습니까?');
	}
	$(document).ready(function () {
		
		
	    // admissionModal
	    const admissionModal = document.getElementById('admissionModal')
	    const admissionInput = document.getElementById('admissionInput')

	    admissionModal.addEventListener('shown.bs.modal', (e) => {
	    	admissionInput.focus();
	        let dataNo = $(e.relatedTarget).data('id');
	        
	        $('#admissionFunction').on("click", function() {
	           location.href = dataNo;        
	        });
	    });
	});
	$("#sort").change(function() {
		console.log($("#sortlink").val()+'&sort='+$('select[name=sort]').val());
		location.href = $("#sortlink").val()+'&sort='+$('select[name=sort]').val();
	});
</script>
</html>