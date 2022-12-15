<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/admin_header.jsp" />
<c:set var="dto" value="${content }" />
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<body>
	<br>
	<br>
	<div class="div1" align="center">

		<input type="hidden" name="animal_no" value="${dto.animal_no }">
		<input type="hidden" name="animal_img1" value="${dto.animal_img1 }">
		<input type="hidden" name="animal_img2" value="${dto.animal_img2 }">
		<input type="hidden" name="animal_img3" value="${dto.animal_img3 }">

		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">이름</span></th>
				<td>${dto.animal_name }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">종류</span></th>
				<td>${dto.animal_species }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">성별</span></th>
				<td>${dto.animal_gender }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">중성화여부</span></th>
				<td>${dto.animal_neutered }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">예방접종여부</span></th>
				<td>${dto.animal_vaccination }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">나이</span></th>
				<td>${dto.animal_age }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">발견장소</span></th>
				<td>${dto.animal_place }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">크기</span></th>
				<td>${dto.animal_size }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">무게</span></th>
				<td>${dto.animal_weight }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">유의사항</span></th>
				<td><textarea rows="2" cols="22" name="animal_caution" readonly><c:out
							value="${dto.animal_caution }"></c:out></textarea></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양 상태</span></th>
				<td>${dto.animal_status }</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="location.href='<%=request.getContextPath() %>/animal_update?no=${dto.animal_no }'">수정</button>
					<button type="button" onclick="location.href='<%=request.getContextPath() %>/animal_delete?no=${dto.animal_no }'">삭제</button>
				</td>
			</tr>
		</table>
		<br>
		<div class="div2">
			<div class="img-fluid">
				<img id="file_change1" src="resources/upload/${dto.animal_img1 } " />
			</div>
			<c:if test="${not empty dto.animal_img2}">
				<div class="img-fluid">
					<img id="file_change1" src="resources/upload/${dto.animal_img2 } " />
				</div>
			</c:if>
			<c:if test="${not empty dto.animal_img3}">
				<div class="img-fluid">
					<img id="file_change1" src="resources/upload/${dto.animal_img3 } " />
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>