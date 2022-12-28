<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/admin_header.jsp" />
<script src="resources/js/animal_species.js"></script><!-- 동물 종 데이터 -->
<c:set var="animalDTO" value="${content }" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<input type="hidden" id="tag" value="${animalDTO.animal_tag }"/>
<input type="hidden" id="sp" value="${animalDTO.animal_species }"/>
<body>
	<br>
	<br>
	<div class="container" align="center">
		<form action="<%=request.getContextPath()%>/animal_update"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="animal_no" value="${animalDTO.animal_no }">
			<input type="hidden" name="animal_tag" value="${animalDTO.animal_tag }">
			<input type="hidden" name="animal_img1"
				value="${animalDTO.animal_img1 }"> <input type="hidden"
				name="animal_img2" value="${animalDTO.animal_img2 }"> <input
				type="hidden" name="animal_img3" value="${animalDTO.animal_img3 }">
			<table class="table noticeinfo mt-4">
				<tr>
					<th class="table-light col-1 w-25"><span class="sp2">이름</span></th>
					<td class="col-11" colspan="8"><input type="text"
						name="animal_name" class="form-control text-center"
						value=${animalDTO.animal_name }></td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">나이</span></th>
					<td class="col-2"><input type="number" name="animal_age"
						class="form-control text-center" value=${animalDTO.animal_age }></td>
					<th class="table-light col-1"><span class="sp2">성별</span></th>
					<td class="col-2"><select name="animal_gender"
						class="form-control text-center">
							<option value="male"
								<c:if test="${animalDTO.animal_gender eq 'male'}">selected</c:if>>수컷</option>
							<option value="female"
								<c:if test="${animalDTO.animal_gender eq 'female'}">selected</c:if>>암컷</option>
					</select></td>

					<th class="table-light col-1"><span class="sp2">중성화</span></th>
					<td class="col-2"><select name="animal_neutered"
						class="form-control text-center">
							<option value="Y"
								<c:if test="${animalDTO.animal_neutered eq 'Y'}">selected</c:if>>Y</option>
							<option value="N"
								<c:if test="${animalDTO.animal_neutered eq 'N'}">selected</c:if>>N</option>
					</select></td>
					<th class="table-light col-1"><span class="sp2">예방접종</span></th>
					<td class="col-2"><select name="animal_vaccination"
						class="form-control text-center">
							<option value="Y"
								<c:if test="${animalDTO.animal_vaccination eq 'Y'}">selected</c:if>>Y</option>
							<option value="N"
								<c:if test="${animalDTO.animal_vaccination eq 'N'}">selected</c:if>>N</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">종류</span></th>
					<td colspan="3">
					<select name="animal_species"
						class="form-control text-center" id="species">
					</select></td>
					<th class="table-light col-1"><span class="sp2">크기</span></th>
					<td><select name="animal_size"
						class="form-control text-center" id="size">
							<option value="소형"
								<c:if test="${animalDTO.animal_size eq '소형'}">selected</c:if>>소형</option>
							<option value="중형"
								<c:if test="${animalDTO.animal_size eq '중형'}">selected</c:if>>중형</option>
							<option value="대형"
								<c:if test="${animalDTO.animal_size eq '대형'}">selected</c:if>>대형</option>
					</select></td>
					<th class="table-light col-1"><span class="sp2">무게</span></th>
					<td><input type="number" class="form-control text-center"
						name="animal_weight" type="text"
						value="${animalDTO.animal_weight }"></td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">입양 상태</span></th>
					<td class="col-2"><input type="text" name="animal_status"
						class="form-control text-center"
						value="${animalDTO.animal_status }"></td>
					<th class="table-light col-1"><span class="sp2">발견장소</span></th>
					<td colspan="5"><input type="text" name="animal_place"
						class="form-control text-center" value=${animalDTO.animal_place }></td>
				</tr>
				<tr class="animal_content">
					<th class="table-light col-1"><span class="sp2">유의사항</span></th>
					<td colspan="7"><textarea rows="2" cols="22"
							name="animal_caution"><c:out
								value="${animalDTO.animal_caution }"></c:out></textarea></td>
				</tr>
				<tr>
					<th rowspan="3" class="table-light">이미지</th>
					<td colspan="2">
						<div class="d-grid align-middle original-image">
							<input type="file" class="form-control" name="files"
								accept="image/gif, image/jpeg, image/png"
								onchange="readURL4(this);">
							<c:if test="${not empty animalDTO.animal_img1 }">
								<p class="mt-2">
									<img src="${ path }${animalDTO.animal_img1  }"
										id="file_change1" style="max-height: 200px;" alt="review_img" />
								</p>
							</c:if>
							<c:if test="${empty animalDTO.animal_img1 }">
								<p class="mt-2">
									<img id="file_change1" style="max-height: 200px;"
										alt="review_img"  src="resources/icon/animal_icon.png"/>
								</p>
							</c:if>
						</div>
					</td>
					<td colspan="3">
						<div class="d-grid align-middle original-image">
							<input type="file" class="form-control" name="files"
								accept="image/gif, image/jpeg, image/png"
								onchange="readURL5(this);">
							<c:if test="${not empty animalDTO.animal_img2 }">
								<p class="mt-2">
									<img src="${ path }${ animalDTO.animal_img2 }"
										id="file_change2" style="max-height: 200px;" alt="review_img" />
								</p>
							</c:if>
							<c:if test="${empty animalDTO.animal_img2 }">
								<p class="mt-2">
									<img id="file_change2" style="max-height: 200px;"
										alt="review_img" src="resources/icon/animal_icon.png"/>
								</p>
							</c:if>
						</div>
					</td>
					<td colspan="2">
						<div class="d-grid align-middle original-image">
							<input type="file" class="form-control" name="files"
								accept="image/gif, image/jpeg, image/png"
								onchange="readURL6(this);">
							<c:if test="${not empty animalDTO.animal_img3 }">
								<p class="mt-2">
									<img src="${ path }${ animalDTO.animal_img3 }"
										id="file_change3" style="max-height: 200px;" alt="review_img" />
								</p>
							</c:if>
							<c:if test="${empty animalDTO.animal_img3 }">
								<p class="mt-2">
									<img id="file_change3" style="max-height: 200px;"
										alt="review_img"  src="resources/icon/animal_icon.png"/>
								</p>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="btns">
				<div>
					<button onclick="location.href='${path}/${dto.animal_tag }_list'" class="btn btn-dark insertbtn mb-3"><i class="bi bi-card-list"></i> 목록</button>
				</div>
				<div>
					<button type="reset" class="btn btn-warning insertbtn mb-3"><i class="bi bi-pencil"></i> 리셋</button>
					<button type="submit" class="btn btn-success insertbtn mb-3"><i class="bi bi-eraser"></i> 수정</button>
				</div>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
	/*동적 동물 선택 태그*/
		console.log(dog_select);
        let result;
        let tag = $('#tag').val();

        if (tag === 'cat'){
            result = cat_select;
        }else if(tag === 'dog'){
            result = dog_select;
        }

        $('#species').empty();
        $('#species').append('<option></option>');
        for (let i=0;i<result.length ; i++){
        	if($('#sp').val() === result[i]){
        		$('#species').append('<option value="'+result[i]+'" selected>'+ result[i] + '</option>');
        	}
        	else{
        		$('#species').append('<option value="'+result[i]+'">'+ result[i] + '</option>');        	
        	}
        }

	</script>
</body>
</html>