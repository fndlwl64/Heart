<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/admin_header.jsp" />
<script src="resources/js/admin.js"></script>
<script src="resources/js/animal_species.js"></script><!-- 동물 종 데이터 -->
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/list_view.css" />
<c:set var="tag" value="${tag }"></c:set>
<c:if test="${ tag eq 'dog' }">
	<c:set var="animal" value="강아지" />
</c:if>
<c:if test="${ tag eq 'cat' }">
	<c:set var="animal" value="고양이" />
</c:if>
<body>
	<div class="container">
	<div class="sub-title"><h4>${ animal } 등록하기</h4></div>	
		<form action="<%=request.getContextPath()%>/animal_insert"
			method="post" enctype="multipart/form-data" onsubmit="return submitOption();">
			<input type="hidden" name="animal_tag" id="animal_tag" value="${tag }">
			<table class="table noticeinfo mt-4">
				<tr>
					<th class="table-light" width="10%"><span class="sp2">이름</span></th>
					<td width="90%" colspan="8"><input type="text" id="name" name="animal_name" class="form-control">
					</td>
				</tr>
				<tr>
					<th class="table-light" width="10%"><span class="sp2">나이</span></th>
					<td width="15%">
						<div class="d-flex align-items-center">
							<input type="number" name="animal_age" id="age" min="0" max="20" class="form-control">
		                    <span class="ms-2"><b>살</b></span>
	                    </div>
					</td>
					<th class="table-light" width="10%"><span class="sp2">성별</span></th>
					<td width="15%">
					<select name="animal_gender"
						class="form-control" id="gender">
							<option value=""></option>
							<option value="male">수컷</option>
							<option value="female">암컷</option>
					</select>
					</td>
					<th class="table-light" width="10%"><span class="sp2">중성화</span></th>
					<td width="15%">
						<select name="animal_neutered" class="form-control" id="neutered">
								<option value=""></option>
								<option value="Y">Y</option>
								<option value="N">N</option>
						</select>
					</td>
					<th class="table-light" width="10%"><span class="sp2">예방접종</span></th>
					<td width="15%">
					<select name="animal_vaccination"class="form-control" id="vaccination">
							<option value=""></option>
							<option value="Y">Y</option>
							<option value="N">N</option>
					</select>
					</td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">종류</span></th>
					<td colspan="3">
					<select name="animal_species" class="form-control" id="species">
					</select></td>
					<th class="table-light col-1"><span class="sp2" >크기</span></th>
					<td><select name="animal_size"class="form-control" id="size" onclick="optionChangeSize();">
							<option value=""></option>
							<option value="소형"
								<c:if test="${animalDTO.animal_size eq '소형'}">selected</c:if>>소형</option>
							<option value="중형"
								<c:if test="${animalDTO.animal_size eq '중형'}">selected</c:if>>중형</option>
							<option value="대형"
								<c:if test="${animalDTO.animal_size eq '대형'}">selected</c:if>>대형</option>
					</select></td>
					<!-- <th class="table-light col-1"><span class="sp2">무게</span></th>
					<td><input type="number" class="form-control"
						name="animal_weight" type="text" min=0 id="weight"></td> -->
	                <th>무게 <span class="table-light col-1 must-write"></span></th>
	                <td colspan="3">
	                    <div class="d-flex align-items-center">
		                    <input type="number" name="animal_weight" class="form-control" id="weight" min="0" max="40">
		                    <span class="ms-2"><b>kg</b></span>
	                    </div>
	                </td>	
				</tr>
				<tr>
					
					<th class="table-light col-1"><span class="sp2">발견장소</span></th>
					<td colspan="7"><input type="text" name="animal_place"
						class="form-control"></td>
				</tr>
				<tr class="animal_content">
					<th class="table-light col-1"><span class="sp2">유의사항</span></th>
					<td colspan="7"><textarea class="form-control" rows="6" cols="22" name="animal_caution"></textarea></td>
				</tr>
				<tr>
					<th rowspan="3" class="table-light">이미지</th>
					<td colspan="7">
						<div class="d-grid align-middle original-image">
							 <input type="text" class="form-control-plaintext py-0" style="font-size: 14px;" value="※ 사진 등록은 필수입니다(최소 1장 ~ 최대 3장)." />
							<input type="file" class="form-control" id="files" name="files"
								accept="image/gif, image/jpeg, image/png"
								onchange="readURL4(this);" multiple>						
						</div>
					</td>
				</tr>
			</table>
			
			<div class="btns">
				<div>

					<a onclick="location.href='${tag }_list'" class="btn btn-dark insertbtn mb-3" style="color:white"><i class="bi bi-card-list"></i> 목록</a>

				</div>	
				<div>
					<button type="submit" class="btn btn-warning insertbtn mx-1 mb-3"><i class="bi bi-pencil"></i> 리셋</button>
					<button type="reset" class="btn btn-primary insertbtn mb-3"><i class="bi bi-save"></i> 등록</button>
				</div>
			</div>			
			
		</form>
	</div>
</body>
	<script>
		/* 사이즈에 따른 무게 */
		function optionChangeSize(){
			if($('#size').val() === '소형'){
				$('#weight').prop("min" , '1');
				$('#weight').prop("max" , '4');
			}
			if($('#size').val() === '중형'){
				$('#weight').prop("min" , '4');
				$('#weight').prop("max" , '10');
			}
			if($('#size').val() === '대형'){
				$('#weight').prop("min" , '10');
				$('#weight').prop("max" , '40');
			}
			console.log($('#weight').val());
		}
		
		let result = [];
		if ($('#animal_tag').val() == 'cat') {
			result = cat_select;
		}
		if ($('#animal_tag').val() == 'dog') {
			result = dog_select;
		}
		$('#species').append('<option></option>');
		for (let i = 0; i < result.length; i++) {
			$('#species').append(
					'<option value='+result[i]+'>' + result[i] + '</option>');
		}

		/* 사이즈에 따른 무게 범위 */		
		function optionChangeSize() {
			if ($('#size').val() === '소형') {
				$('#weight').prop("min", '1');
				$('#weight').prop("max", '4');
			}
			if ($('#size').val() === '중형') {
				$('#weight').prop("min", '4');
				$('#weight').prop("max", '10');
			}
			if ($('#size').val() === '대형') {
				$('#weight').prop("min", '10');
				$('#weight').prop("max", '40');
			}
			console.log($('#weight').val());
		}

		
		/*파일 전송 수 제한*/
		function fileOption() {
			let files = document.getElementById("files");
			if (files.files.length > 3) {
				alert("이미지 파일은 3개 까지만 가능합니다.");
				document.getElementById("files").value = "";
				return;
			}
		}
		function submitOption() {
			if ($('#name').val() == '') {
				alert("이름을 적어주세요");
				return false;
			}
			if ($('#age').val() == '') {
				alert("나이를 적어주세요");
				return false;
			}
			if ($('#gender').val() == '') {
				alert("성별을 골라주세요");
				return false;
			}
			if ($('#neutered').val() == '') {
				alert("중성화 여부를 골라주세요");
				return false;
			}
			if ($('#vaccination').val() == '') {
				alert("백신 여부를 골라주세요");
				return false;
			}
			if ($('#species').val() == '') {
				alert("품종을 골라주세요");
				return false;
			}
			if ($('#size').val() == '') {
				alert("크기를 골라주세요");
				return false;
			}
			if ($('#place').val() == '') {
				alert("발견한 장소를 적어주세요");
				return false;
			}
			
			if ($('#weight').val() ==''){
                $('#weight').attr("value",0);
            }
			if ($('#content').val() == '') {
				alert("내용을 적어주세요");
				return false;
			}
			
			/*파일 최소 1개 이상 전송 경고*/
			let files = document.getElementById("files");
			if (files.files.length < 1) {
				alert("최소 1개 이상의 이미지를 보내주세요");
				return false;
			}

		}
	</script>
</html>