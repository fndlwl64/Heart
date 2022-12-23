<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/admin_header.jsp" />
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/list_view.css" />
<c:set var="tag" value="${tag }"></c:set>
<body>
	<div class="d-flex justify-content-center">
		<form action="<%=request.getContextPath()%>/animal_insert"
			method="post" enctype="multipart/form-data"
			onsubmit="return submitOption();">
			<input type="hidden" name="animal_tag" value="${tag }"
				id="animal_tag">
			<table class="table">
				<tr>
					<th class="table-light">품종</th>
					<td><c:if test="${tag eq 'dog' }">
							<select class="form-select" name="animal_species">
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
						</c:if> <c:if test="${tag eq 'cat' }">
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
						</c:if></td>
				</tr>
				<tr>
					<th class="table-light">이름</th>
					<td><input type="text" name="animal_name" class="form-control"
						id="name"></td>
				</tr>
				<tr>
					<th class="table-light">성별</th>
					<td><select name="animal_gender" class="form-control"
						id="gender">
							<option value=""></option>
							<option value="male">수컷</option>
							<option value="female">암컷</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">중성화</th>
					<td><select name="animal_neutered" class="form-control"
						id="neutered">
							<option value=""></option>
							<option value="Y">O</option>
							<option value="N">X</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">예방 접종</th>
					<td><select name="animal_vaccination" class="form-control"
						id="vaccination">
							<option value=""></option>
							<option value="Y">O</option>
							<option value="N">X</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">나이</th>
					<td><input type="number" name="animal_age" min=0
						class="form-control" id="age"></td>
				</tr>
				<tr>
					<th class="table-light">발견 장소</th>
					<td><input type="text" name="animal_place"
						class="form-control" id="place"></td>
				</tr>
				<tr>
					<th class="table-light">크기</th>
					<td><select name="animal_size" class="form-control" id="size" onclick="optionChangeSize()">
							<option value=""></option>
							<option value="소형">소형</option>
							<option value="중형">중형</option>
							<option value="대형">대형</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">무게</th>
					<td><input type="number" name="animal_weight" min=0
						class="form-control" id="weight"></td>
				</tr>
				<tr>
					<th class="table-light">상세 내용</th>
					<td><textarea name="animal_caution" class="form-control"
							id="content"></textarea></td>
				</tr>
				<tr>
					<th class="table-light">첨부 이미지</th>
					<td><input type="file" name="files" id="files"
						class="form-control" accept="image/gif, image/jpeg, image/png"
						onchange="fileOption();" multiple></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><input type="submit"
						value="입양 등록" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		
		let dog_select = [ "말티즈", "푸들", "포메라니안", "믹스견", "치와와", "시츄", "골든리트리버",
				"진돗개", "기타" ];
		let cat_select = [ "스코티시", "폴드", "샴", "페르시안", "터키시", "앙고라", "러시안 블루",
				"벵갈", "먼치킨", "아비시니안", "기타" ];
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
			if ($('#species').val() == '') {
				alert("품종을 골라주세요");
				return false;
			}
			if ($('#name').val() == '') {
				alert("이름을 적어주세요");
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
			if ($('#age').val() == '') {
				alert("나이를 적어주세요");
				return false;
			}
			if ($('#place').val() == '') {
				alert("발견한 장소를 적어주세요");
				return false;
			}
			if ($('#size').val() == '') {
				alert("크기를 골라주세요");
				return false;
			}
			if ($('#weight').val() == ''){
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
</body>
<!-- <body>
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">종류</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">성별</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">중성화여부</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">예방접종여부</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">나이</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">발견장소</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">크기</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">무게</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">유의사항</span></th>
				<td><textarea rows="2" cols="22"></textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양상태</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
		</table>
		<br>
		<div class="div2">
			<div>
				<input type="file" onchange="readURL1(this);">
				<input type="file" onchange="readURL2(this);">
				<input type="file" onchange="readURL3(this);">
			</div>
			<div>
				<img class="preview" id="preview1"/>
				<img class="preview" id="preview2"/>
				<img class="preview" id="preview3"/>
			</div>
		</div>
		<br><br>
		<input id="update_btn" type="submit" value="등록" align="center">
	</form>
</div>
</body> -->
</html>