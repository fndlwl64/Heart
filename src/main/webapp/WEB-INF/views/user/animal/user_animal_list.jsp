<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="resources/css/user_animal_main.css">
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="div1">

	<div class="text-center main-title">
		<label>입양을 기다리는 동물들 <span class="more_info" onclick="search()">자세히 찾아보기</span></label>
	</div>
	
	<input type="hidden" id="sortlink"
		value="<%=request.getContextPath() %>/user_${animalDTO.animal_tag }_list?page=${ paging.page }&${pagingSort}" />
	
	<div id="form" class="form_search">

		<form
			action="<%=request.getContextPath() %>/user_${animalDTO.animal_tag }_list"
			class="validation-form wells" method="post">
			
			<div class="lil-title">
				<span><i class="bi bi-check2-square"></i>조건 검색</span>
			</div>
			
			<div class="row animal_row">
				<div class="col">
					<div class="input-group">
						<select name="animal_place" class="form-select form-select-sm">
							<option value=""></option>
							<option value="서울" <c:if test="${fn:contains(animalDTO.animal_place,'서울')}">selected</c:if>>서울특별시</option>
							<option value="울산" <c:if test="${fn:contains(animalDTO.animal_place,'울산')}">selected</c:if>>울산광역시</option>
							<option value="인천" <c:if test="${fn:contains(animalDTO.animal_place,'인천')}">selected</c:if>>인천광역시</option>
							<option value="부산" <c:if test="${fn:contains(animalDTO.animal_place,'부산')}">selected</c:if>>부산광역시</option>
							<option value="대전" <c:if test="${fn:contains(animalDTO.animal_place,'대전')}">selected</c:if>>대전광역시</option>
							<option value="광주" <c:if test="${fn:contains(animalDTO.animal_place,'광주')}">selected</c:if>>광주광역시</option>
							<option value="대구" <c:if test="${fn:contains(animalDTO.animal_place,'대구')}">selected</c:if>>대구광역시</option>
							<option value="세종" <c:if test="${fn:contains(animalDTO.animal_place,'세종')}">selected</c:if>>세종특별자치시</option>
							<option value="제주" <c:if test="${fn:contains(animalDTO.animal_place,'제주')}">selected</c:if>>제주도</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">장소</span>
					</div>
				</div>
	
				<div class="col animal-keyword">
					<div class="input-group">
						<input type="text" name="keyword" placeholder="상세주소 입력"
							class="form-control form-control-sm" value="${keyword }">
					</div>
				</div>
				<div class="col">
					<div class="input-group">
						<select name="animal_vaccination" class="form-select form-select-sm">
							<option value=""></option>
							<option value="Y" <c:if test="${animalDTO.animal_vaccination eq 'Y'}">selected</c:if>>Y</option>
							<option value="N" <c:if test="${animalDTO.animal_vaccination eq 'N'}">selected</c:if>>N</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">백신</span>
					</div>
				</div>
				<div class="col text-lg-end">
					<div class="input-group">
						<select name="animal_status" class="form-select form-select-sm">
							<option value=""></option>
							<option value="입소 신청" <c:if test="${animalDTO.animal_status eq '입소 신청'}">selected</c:if>>입소 신청</option>
							<option value="입양 가능" <c:if test="${animalDTO.animal_status eq '입양 가능'}">selected</c:if>>입양 가능</option>
							<option value="입양 대기" <c:if test="${animalDTO.animal_status eq '입양 대기'}">selected</c:if>>입양 대기</option>
							<option value="입양 완료" <c:if test="${animalDTO.animal_status eq '입양 완료'}">selected</c:if>>입양 완료</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">입양</span>
					</div>
				</div>
	
			</div>
			<div class="row animal_row">
	
				<div class="col">
					<div class="input-group">
						<select name="animal_gender" class="form-select form-select-sm">
							<option value=""></option>
							<option value="male" <c:if test="${animalDTO.animal_gender eq 'male'}">selected</c:if>>수컷</option>
							<option value="female" <c:if test="${animalDTO.animal_gender eq 'female'}">selected</c:if>>암컷</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">성별</span>
					</div>
				</div>
				<div class="col">
					<div class="input-group">
						<select name="animal_age" class="form-select form-select-sm">
							<option value="0"></option>
							<option value="1" <c:if test="${animalDTO.animal_age eq '1'}">selected</c:if>>0~1</option>
							<option value="2" <c:if test="${animalDTO.animal_age eq '2'}">selected</c:if>>1~2</option>
							<option value="3" <c:if test="${animalDTO.animal_age eq '3'}">selected</c:if>>2~3</option>
							<option value="4" <c:if test="${animalDTO.animal_age eq '4'}">selected</c:if>>3~4</option>
							<option value="5" <c:if test="${animalDTO.animal_age eq '5'}">selected</c:if>>4~5</option>
							<option value="6" <c:if test="${animalDTO.animal_age eq '6'}">selected</c:if>>5~</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">나이</span>
					</div>
				</div>
	
				<div class="col">
					<div class="input-group">
						<c:if test="${animalDTO.animal_tag eq 'dog'}">
							<select name="animal_species" class="form-select form-select-sm">
								<option value=""></option>
								<option value="말티즈" <c:if test="${animalDTO.animal_species eq '말티즈'}">selected</c:if>>말티즈</option>
								<option value="푸들" <c:if test="${animalDTO.animal_species eq '푸들'}">selected</c:if>>푸들</option>
								<option value="포메라니안" <c:if test="${animalDTO.animal_species eq '포메라니안'}">selected</c:if>>포메라니안</option>
								<option value="믹스견" <c:if test="${animalDTO.animal_species eq '믹스견'}">selected</c:if>>믹스견</option>
								<option value="치와와" <c:if test="${animalDTO.animal_species eq '치와와'}">selected</c:if>>치와와</option>
								<option value="시츄" <c:if test="${animalDTO.animal_species eq '시츄'}">selected</c:if>>시츄</option>
								<option value="골든리트리버" <c:if test="${animalDTO.animal_species eq '골든리트리버'}">selected</c:if>>골든리트리버</option>
								<option value="진돗개" <c:if test="${animalDTO.animal_species eq '진돗개'}">selected</c:if>>진돗개</option>
								<option value="기타" <c:if test="${animalDTO.animal_species eq '기타'}">selected</c:if>>기타</option>
							</select>
						</c:if>
						<c:if test="${animalDTO.animal_tag eq 'cat'}">
							<select name="animal_species" class="form-select form-select-sm">
								<option value=""></option>
								<option value="스코티시" <c:if test="${animalDTO.animal_species eq '스코티시'}">selected</c:if>>스코티시</option>
								<option value="폴드" <c:if test="${animalDTO.animal_species eq '폴드'}">selected</c:if>>폴드</option>
								<option value="샴" <c:if test="${animalDTO.animal_species eq '샴'}">selected</c:if>>샴</option>
								<option value="페르시안" <c:if test="${animalDTO.animal_species eq '페르시안'}">selected</c:if>>페르시안</option>
								<option value="터키시" <c:if test="${animalDTO.animal_species eq '터키시'}">selected</c:if>>터키시</option>
								<option value="앙고라" <c:if test="${animalDTO.animal_species eq '앙고라'}">selected</c:if>>앙고라</option>
								<option value="러시안 블루" <c:if test="${animalDTO.animal_species eq '러시안 블루'}">selected</c:if>>러시안 블루</option>
								<option value="벵갈" <c:if test="${animalDTO.animal_species eq '벵갈'}">selected</c:if>>벵갈</option>
								<option value="먼치킨" <c:if test="${animalDTO.animal_species eq '먼치킨'}">selected</c:if>>먼치킨</option>
								<option value="아비시니안" <c:if test="${animalDTO.animal_species eq '아비시니안'}">selected</c:if>>아비시니안</option>
								<option value="기타" <c:if test="${animalDTO.animal_species eq '기타'}">selected</c:if>>기타</option>
							</select>
						</c:if>
						<span class="btn btn-sm btn-secondary position-relative">품종</span>
					</div>
				</div>
	
				<div class="col">
					<div class="input-group">
						<select name="animal_size" class="form-select form-select-sm">
							<option value=""></option>
							<option value="소형" <c:if test="${animalDTO.animal_size eq '소형'}">selected</c:if>>소형</option>
							<option value="중형" <c:if test="${animalDTO.animal_size eq '중형'}">selected</c:if>>중형</option>
							<option value="대형" <c:if test="${animalDTO.animal_size eq '대형'}">selected</c:if>>대형</option>
						</select> <span class="btn btn-sm btn-secondary position-relative">크기</span>
					</div>
				</div>
				<div class="col text-lg-end">
					<div class="input-group">
						<input type="number" value="${animalDTO.animal_weight }" min="0" name="animal_weight"
							class="form-control form-control-sm" style="width: 70px"> <span
							class="btn btn-sm btn-secondary position-relative">무게</span>
					</div>
				</div>
			</div>
			<div class="row animal_row">
				<div class="col"></div>
				<div class="col-4"></div>
				<div class="col-4"></div>
				<div class="col text-lg-end">
					<button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>
				</div>
			</div>
		</form>
	</div>
	
	<%--정렬--%>
	<div class="order">
		<select class="form-select form-select-sm" name="sort" id="sort">
			<option value="">정렬</option>
			<option value="size"
				<c:if test="${sort eq 'size'}">selected</c:if>>크기</option>
			<option value="weight"
				<c:if test="${sort eq 'weight'}">selected</c:if>>무게</option>
			<option value="age" <c:if test="${sort eq 'age'}">selected</c:if>>나이</option>
		</select>
		<!-- <form class="validation-form mx-2" action="" method="post">
			<select class="form-select form-select-sm " name="sort">
				<option value="des">내림차순</option>
				<option value="asc">오름차순</option>
			</select>
		</form> -->
	</div>
	
	<%--메인 페이지--%>
	<div class="main_mainContents__GXYBn">
		<%--강아지 정보 폼--%>
	
		<div class="main_mainGridContainer__xl9yt">
			<c:if test="${not empty animalList}">
				<c:forEach var="dto" items="${animalList}">
					<div class="mainContent_mainContentBox__shdST">
						<!-- d-flex flex-row text-center  p-2 alert-primary alert alert-primary animal_wrap -->
						<div class="mainContent_mainImgWrapper__DJlMe">
							<%-- <input type="hidden"
								value="<%=request.getContextPath() %>/user_animal_content?no=${dto.getAnimal_no()}"> --%>
							<%-- <a
								href="<%=request.getContextPath() %>/user_animal_content?no=${dto.getAnimal_no()}"><img
								class="img-fluid rounded mx-auto img-frame"
								src="<%=request.getContextPath()%>/resources/upload/${dto.getAnimal_img1()}"></a> --%>
							<div class="mainContent_mainImgWrapper__DJlMe rounded back_image"
								style="background-image : url(<%=request.getContextPath()%>${dto.getAnimal_img1()});" data-value = "<%=request.getContextPath() %>/user_animal_content?no=${dto.getAnimal_no()}"></div>
							<div class="mainContent_mainContent__w_Buk">
								<!-- href=request.getContextPath()h() %>/user_animal_content?no=${dto.getAnimal_no()}" -->
								<div class="mainContent_mainTitle__8iW62">${dto.getAnimal_name() }</div>
								<div class="mainContent_mainAuthor__kKyGl">${dto.animal_status }</div>
							</div>
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
		$(function() {
			
			$("#form").css({
				 'display' : 'none'
			 });			
			
		});
		
		//정렬 select
		$("#sort").change(
				function() {
					location.href = $("#sortlink").val() + '&sort='
							+ $('select[name=sort]').val();
				});
		$(document).on("click", ".back_image", function() {
			location.href = $(this).data("value");
		});
		/* $(document).ready(function () {
			  $(document).on("click", ".back_image", function () {
			    location.href = $('#href').val();
			  });
			});
		 */
		 function search() {
			 
			 $("#form").toggle();
			 
			 /* $("#form").css({
				 'display' : 'block'
			 }); */
		 }
		 
	</script>
	
	<jsp:include page="../../include/user_footer.jsp" />

</div>