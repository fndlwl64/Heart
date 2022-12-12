<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../include/user_header.jsp" />

<div class="container">
	<div class="d-flex justify-content-start">
		<dl class="col mx-5">
			<dt>입소날짜</dt>
			<dd>2022-01-13</dd>
		</dl>
	</div>
	<div class="d-flex justify-content-end m-3">
		<div class="row row-cols-auto rounded-3 m-2"
			style="background-color: whitesmoke">
			<img class="col img-thumbnail w-50"
				src="<%=request.getContextPath()%>/resources/upload/${dto.animal_img1}">
			<div class="col-2 m-1">
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
			</div>
			<div class="col-2 m-1">
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
	<div class="d-flex justify-content-center m-3">

		<div class="form-control input-lg" readonly>${dto.animal_caution }</div>

	</div>
	<input type="hidden" id="animal_status" value="${dto.animal_status }">
	<div class="d-flex justify-content-center mx-5 px-5">
		<form action="user_get_animal" method="post" onsubmit="return submitOption();">
			<input type="hidden" name="animal_no" value="${dto.animal_no }">
			<input type="submit" class="btn btn-primary" value="입양하기">
		</form>
	</div>
</div>
<script type="text/javascript">
	function submitOption(){
		if ($('#user_grade').val() > 3){
            alert("회원의 등급이 낮아 입소 자격이 없습니다.");
            return false;
        }
		if($('#animal_status').val() == '입소 신청'){
			alert('아직 입소가 완료되지 않은 상태입니다.');
			return false;
		}
		if($('#animal_status').val() == '입양 대기'){
			alert('입양 대기 중인 상태입니다.');
			return false;
		}
		
	}
</script>


<jsp:include page="../../include/user_footer.jsp" />

