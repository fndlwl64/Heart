<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet_Admin_Adopt_Reg</title>
<link rel="stylesheet" href="${path }/resources/css/list_view.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<c:set var="animal_status" value="${animal_status }"></c:set>
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="startDate" value="${ startDate }" />
<c:set var="endDate" value="${ endDate }" />
<c:set var="list" value="${adoptRegList }"></c:set>
<c:set var="map" value="${animalMap }"></c:set>
<c:set var="tag" value="${tag }"></c:set>
<c:set var="sort" value="${sort }" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="pagingStatus"
	value="startDate=${ startDate }&endDate=${ endDate }&animal_status=" />
<c:set var="pagingSort"
	value="startDate=${ startDate }&endDate=${ endDate }&animal_status=${animal_status }" />
<c:set var="pagingTag"
	value="startDate=${ startDate }&endDate=${ endDate }&animal_status=${animal_status }&sort=${sort }" />
<input type="hidden" id="sortlink"
	value="<%=request.getContextPath() %>/adoptreg_list?page=${ paging.page }&${pagingSort}" />
<!-- 쿼리 조인을 피하기 위한 key, value를 통한 animal테이블 데이터 참조 -->
<body>
	<div class="container">
		<form class="search_form" method="post"
			action="${path }/adoptreg_list">
			<div class="form_box">
				<div class="search-semi-title">
					<span><i class="bi bi-check2-square"></i> 입양관리 검색</span>
				</div>
				<div class="search-table-box">
					<input type="hidden" name="animal_status" value="${animal_status }" />
					<table class="table table-sm" id="search-table">
						<tr>
							<th width="12.5%">입양 검색 항목</th>
							<td><select name="adopt_tag" class="form-select">
									<option value=""></option>
									<option value="adopt_reg_appdate"
										<c:if test="${tag eq 'adopt_reg_appdate'}">selected</c:if>>입소
										신청일</option>
									<option value="adopt_reg_regdate"
										<c:if test="${tag eq 'adopt_reg_regdate'}">selected</c:if>>입양
										등록일</option>
									<option value="adopt_reg_duedate"
										<c:if test="${tag eq 'adopt_reg_duedate'}">selected</c:if>>입양
										예정일</option>
									<option value="adopt_reg_adoptdate"
										<c:if test="${tag eq 'adopt_reg_adoptdate'}">selected</c:if>>입양
										완료일</option>
							</select></td>
							<th width="12.5%">검색 기준일</th>
							<td>
								<div class="search-date">
									<input type="date" name="startDate" value="${startDate }"
										class="form-control search-date-picker"> <input
										type="date" name="endDate" value="${endDate }"
										class="form-control search-date-picker">
								</div>
							</td>
							<td width="20%"></td>
						</tr>
					</table>
				</div>
				<div class="search-buttons">
					<button class="btn btn-light" type="button"
						onclick="location.href='${ path }/adoptreg_list'">
						<i class="bi bi-arrow-counterclockwise"></i> 리셋
					</button>
					<button type="submit" class="btn btn-dark">
						<i class="bi bi-search"></i> 검색
					</button>
				</div>
			</div>
		</form>

		<%-- 검색 결과 테이블 --%>
		<div class="lists">
			<div class="d-flex justify-content-start my-2">
				<div class="row">
					<div class="col">
						<a class="btn btn-secondary" style="color: white; width: 100px;"
							href="<%=request.getContextPath() %>/adoptreg_list?page=1&${pagingStatus }입소 신청">입소신청</a>
					</div>
					<div class="col">
						<a class="btn btn-secondary" style="color: white; width: 100px;"
							href="<%=request.getContextPath() %>/adoptreg_list?page=1&${pagingStatus }입양 가능">입양가능</a>
					</div>
					<div class="col">
						<a class="btn btn-secondary" style="color: white; width: 100px;"
							href="<%=request.getContextPath() %>/adoptreg_list?page=1&${pagingStatus }입양 대기">입양대기</a>
					</div>
					<div class="col">
						<a class="btn btn-secondary" style="color: white; width: 100px;"
							href="<%=request.getContextPath() %>/adoptreg_list?page=1&${pagingStatus }입양 완료&sort=adopt_reg_adoptdate">입양완료</a>
					</div>
				</div>
			</div>
			<%--정렬--%>
			<c:if test="${animal_status eq '입양 대기'}">
				<div class="d-flex justify-content-end my-2">
					<div class="validation-form mx-2">
						<select class="form-select form-select-sm" name="sort" id="sort">
							<option value="adopt_reg_regdate"
								<c:if test="${sort eq 'adopt_reg_regdate'}">selected</c:if>>입양등록일</option>
							<option value="adopt_reg_duedate"
								<c:if test="${sort eq 'adopt_reg_duedate'}">selected</c:if>>입양예정일</option>
						</select>
					</div>
				</div>
			</c:if>
			<div class="qna-section">
				<div class="row">
					<div class="col total-data">
						<span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물
						</span>
					</div>
				</div>
				<table class="table table-hover searched_list">
					<tr>
						<th class="table-light col-1">No</th>
						<th class="table-light col-1">회원 아이디</th>
						<th class="table-light col-1">동물 이름</th>
						<!-- <th class="table-light col-1">입소 신청일</th>
					<th class="table-light col-1">입양 등록일</th>
					<th class="table-light col-1">입양 예정일</th>
					<th class="table-light col-1">입양 완료일</th> -->

						<c:if test="${animal_status eq '입소 신청'}">
							<th class="table-light col-3" colspan="3">입소 신청일</th>
						</c:if>
						<%-- <c:if test="${animal_status eq '입양 가능'}">
						<th class="table-light col-3" colspan="3">
						입양 등록일
						</th>
					</c:if> --%>
						<c:if test="${animal_status eq '입양 대기'}">
							<th class="table-light col-2" colspan="2">입양 등록일</th>
							<th class="table-light col-2" colspan="2">입양 예정일</th>
						</c:if>
						<c:if test="${animal_status eq '입양 완료'}">
							<th class="table-light col-3" colspan="3">입양 완료일</th>
						</c:if>

						<th class="table-light col-1">입양 상태</th>
					</tr>
					<c:set var="No" value="${paging.startNo - 1 }"></c:set>
					<c:forEach var="dto" items="${list }">
						<c:set var="No" value="${No + 1 }"></c:set>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(2) eq 1}">
							<tr>
						</c:if>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(2) eq 0}">
							<tr class="table-secondary">
						</c:if>
						<td class="list-title text-center">${No }</td>
						<td class="list-title text-center">${dto.adopt_reg_userid }</td>
						<td class="list-title text-center">${map.get(dto.adopt_reg_animalno).get(0) }</td>
						<%-- <td class="list-title text-center small">${dto.adopt_reg_appdate.substring(0,16) }</td>
						<td class="list-title text-center small">${dto.adopt_reg_regdate.substring(0,16) }</td>
						<td class="list-title text-center small">${dto.adopt_reg_duedate.substring(0,16) }</td>
						<td class="list-title text-center small">${dto.adopt_reg_adoptdate.substring(0,16) }</td> --%>

						<c:if test="${animal_status eq '입소 신청' }">
							<td class="list-title text-center small" colspan="3">
								${dto.adopt_reg_appdate.substring(0,16) }</td>
						</c:if>
						<%-- <c:if test="${animal_status eq '입양 가능' }">
							<td class="list-title text-center small" colspan="3">
							${dto.adopt_reg_regdate.substring(0,16) }
							</td>
						</c:if> --%>
						<c:if test="${animal_status eq '입양 대기' }">
							<td class="list-title text-center small" colspan="2">
								${dto.adopt_reg_regdate.substring(0,16) }</td>
							<td class="list-title text-center small" colspan="2">
								${dto.adopt_reg_duedate.substring(0,16) }</td>
						</c:if>
						<c:if test="${animal_status eq '입양 완료' }">
							<td class="list-title text-center small" colspan="3">
								${dto.adopt_reg_adoptdate.substring(0,16) }</td>
						</c:if>

						<c:if test="${map.get(dto.adopt_reg_animalno).get(2) eq 1 }">
							<c:if
								test="${map.get(dto.adopt_reg_animalno).get(1) ne '입양 대기' and map.get(dto.adopt_reg_animalno).get(1) ne '입양 완료'}">
								<td><a class="text-primary" data-bs-toggle="modal"
									style="cursor: pointer" data-bs-target="#admissionModal"
									data-id="${path }/adoptreg_admission?animal_no=${dto.adopt_reg_animalno}&animal_status=${map.get(dto.adopt_reg_animalno).get(1)}"
									data-value="${map.get(dto.adopt_reg_animalno).get(1)}"
									onclick="onclickOption(this);">${map.get(dto.adopt_reg_animalno).get(1)}</a></td>
							</c:if>
							<c:if test="${map.get(dto.adopt_reg_animalno).get(1) eq '입양 대기'}">
								<td><a
									href="<%=request.getContextPath() %>/adoptreg_update?adopt_reg_regno=${dto.getAdopt_reg_regno() }"
									data-value="${dto.adopt_reg_animalno }">${map.get(dto.adopt_reg_animalno).get(1) }</a></td>
							</c:if>
							<c:if
								test="${map.get(dto.adopt_reg_animalno).get(1) eq '입양 완료' }">
								<td>${map.get(dto.adopt_reg_animalno).get(1)}</td>
							</c:if>
						</c:if>
						<c:if test="${map.get(dto.adopt_reg_animalno).get(2) eq 0}">
							<td>${map.get(dto.adopt_reg_animalno).get(1)}</td>
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
					<c:forEach begin="${ paging.startBlock }"
						end="${ paging.endBlock }" var="i">
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
		if(modal_text === '입소 신청'){
			$('.modal-title').empty();
			$('.modal-title').append(modal_text+' 수정');
			$('.modal-body').empty();
			$('.modal-body').append(modal_text+'을 입양 가능으로 변경하시겠습니까?');
		}
		if(modal_text === '입양 가능'){
			$('.modal-title').empty();
			$('.modal-title').append(modal_text+' 수정');
			$('.modal-body').empty();
			$('.modal-body').append(modal_text+'을 입소 신청으로 변경하시겠습니까?');
		}
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