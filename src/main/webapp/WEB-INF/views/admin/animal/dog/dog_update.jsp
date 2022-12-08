<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../../include/admin_header.jsp" />
<c:set var="dto" value="${content }" />
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<body>
	<br>
	<br>
	<div class="div1" align="center">
		<form action="<%=request.getContextPath()%>/dog_update" method="post">
			<input type="hidden" name="animal_no" value="${dto.animal_no }">
			<input type="hidden" name="animal_img1" value="${dto.animal_img1 }">
			<input type="hidden" name="animal_img2" value="${dto.animal_img2 }">
			<input type="hidden" name="animal_img3" value="${dto.animal_img3 }">
			
			<table class="table">
				<tr>
					<th class="table-secondary"><span class="sp2">이름</span></th>
					<td><input type="text" name="animal_name" class="input1" value=${dto.animal_name }></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">종류</span></th>
					<td>
						<select name="animal_species" class="input1">
							<option value="말티즈" <c:if test="${dto.animal_species eq '말티즈'}">selected</c:if>>말티즈</option>
							<option value="푸들" <c:if test="${dto.animal_species eq '푸들'}">selected</c:if>>푸들</option>
							<option value="포메라니안" <c:if test="${dto.animal_species eq '포메라니안'}">selected</c:if>>포메라니안</option>
							<option value="믹스견" <c:if test="${dto.animal_species eq '믹스견'}">selected</c:if>>믹스견</option>
							<option value="치와와" <c:if test="${dto.animal_species eq '치와와'}">selected</c:if>>치와와</option>
							<option value="시츄" <c:if test="${dto.animal_species eq '시츄'}">selected</c:if>>시츄</option>
							<option value="골든리트리버" <c:if test="${dto.animal_species eq '골든리트리버'}">selected</c:if>>골든리트리버</option>
							<option value="진돗개" <c:if test="${dto.animal_species eq '진돗개'}">selected</c:if>>진돗개</option>
						</select>	
					</td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">성별</span></th>
					<td>
						<select name="animal_gender" class="input1">
	                        <option value="male" <c:if test="${dto.animal_gender eq 'male'}">selected</c:if>>수컷</option>
	                        <option value="female" <c:if test="${dto.animal_gender eq 'female'}">selected</c:if>>암컷</option>
	                    </select>
                    </td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">중성화여부</span></th>
					<td>
						<select name="animal_neutered" class="input1">
	                        <option value="Y" <c:if test="${dto.animal_neutered eq 'Y'}">selected</c:if>>Y</option>
	                        <option value="N" <c:if test="${dto.animal_neutered eq 'N'}">selected</c:if>>N</option>
	                    </select>
					</td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">예방접종여부</span></th>
					<td>
						<select name="animal_vaccination" class="input1">
	                        <option value="Y" <c:if test="${dto.animal_vaccination eq 'Y'}">selected</c:if>>Y</option>
	                        <option value="N" <c:if test="${dto.animal_vaccination eq 'N'}">selected</c:if>>N</option>
	                    </select>
					</td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">나이</span></th>
					<td><input type="number" name="animal_age" class="input1" value=${dto.animal_age }></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">발견장소</span></th>
					<td><input type="text" name="animal_place" class="input1" value=${dto.animal_place }></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">크기</span></th>
					<td>
						<select name="animal_size" class="input1" id="size">
                    	<option value="소형" <c:if test="${dto.animal_size eq '소형'}">selected</c:if>>소형</option>
                        <option value="중형" <c:if test="${dto.animal_size eq '중형'}">selected</c:if>>중형</option>
                        <option value="대형" <c:if test="${dto.animal_size eq '대형'}">selected</c:if>>대형</option>
                    </select>
					</td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">무게</span></th>
					<td><input class="input1" name="animal_weight" type="text" value="${dto.animal_weight }"></td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">유의사항</span></th>
					<td><textarea rows="2" cols="22" name="animal_caution"><c:out value="${dto.animal_caution }"></c:out></textarea>
					</td>
				</tr>
				<tr>
					<th class="table-secondary"><span class="sp2">입양 상태</span></th>
					<td><input type="text" name="animal_status" class="input1" value="${dto.animal_status }"></td>
				</tr>
			</table>
			<br>
			<div class="div2">
				<div class="image-upload">
					<label for="file-input1"> <img id="file_change1"
						class="logo" src="image/heartpet_logo.png" />
					</label> <input class="file_input" id="file-input1" type="file"
						onchange="readURL4(this);" />
				</div>
				<div class="image-upload">
					<label for="file-input2"> <img id="file_change2"
						class="logo" src="image/heartpet_logo.png" />
					</label> <input class="file_input" id="file-input2" type="file"
						onchange="readURL5(this);" />
				</div>
				<div class="image-upload">
					<label for="file-input3"> <img id="file_change3"
						class="logo" src="image/heartpet_logo.png" />
					</label> <input class="file_input" id="file-input3" type="file"
						onchange="readURL6(this);" />
				</div>
			</div>
			<input id="update_btn" type="submit" value="변경" align="center">
		</form>
	</div>
</body>
</html>