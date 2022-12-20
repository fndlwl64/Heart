<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
pageContext.setAttribute("newline", "\n");
%>
<jsp:include page="../../include/admin_header.jsp" />
<c:set var="dto" value="${content }" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/resources/js/admin_list_view.js"></script>
<c:set var="deleteAddr"
	value="${ path }/animal_delete?no=${dto.animal_no }" />
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/admin_animal.css">
<body>
	<br>
	<br>
	<div class="div1" align="center">

		<input type="hidden" name="animal_no" value="${dto.animal_no }">
		<input type="hidden" name="animal_img1" value="${dto.animal_img1 }">
		<input type="hidden" name="animal_img2" value="${dto.animal_img2 }">
		<input type="hidden" name="animal_img3" value="${dto.animal_img3 }">

		<table class="table noticeinfo mt-4 animal_table">
			<tr>
				<th class="table-light col-1 w-25">이름</th>
				<td class="col-11" colspan="8">${dto.animal_name }</td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">나이</span></th>
				<td class="col-2">${dto.animal_age }</td>
				<th class="table-light col-1"><span class="sp2">성별</span></th>
				<td class="col-2">${dto.animal_gender }</td>
				<th class="table-light col-1"><span class="sp2">중성화</span></th>
				<td class="col-2">${dto.animal_neutered }</td>
				<th class="table-light col-1"><span class="sp2">예방접종</span></th>
				<td class="col-2">${dto.animal_vaccination }</td>
			<tr>
				<th class="table-light col-1"><span class="sp2">종류</span></th>
				<td colspan="3">${dto.animal_species }</td>
				<th class="table-light col-1"><span class="sp2">크기</span></th>
				<td class="col-1">${dto.animal_size }</td>
				<th class="table-light col-1"><span class="sp2">무게</span></th>
				<td>${dto.animal_weight }(kg)</td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">입양 상태</span></th>
				<td class="col-2">${dto.animal_status }</td>
				<th class="table-light col-1"><span class="sp2">발견장소</span></th>
				<td colspan="5">${dto.animal_place }</td>

			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">유의사항</span></th>
				<td colspan="3">${dto.animal_caution.replace(newline,'<br>') }</td>

			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">이미지</span>
				<td colspan="7">
					<div class="img-fluid">
						<img class="file_change1"
							src="resources/upload/${dto.animal_img1 }" alt="review_img" />
					</div> <c:if test="${not empty dto.animal_img2}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="resources/upload/${dto.animal_img2 }" alt="review_img" />
						</div>
					</c:if> <c:if test="${not empty dto.animal_img3}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="resources/upload/${dto.animal_img3 }" alt="review_img" />
						</div>
					</c:if>
				</td>
			</tr>
		</table>
		<div>
			<button type="button" class="btn btn-success mx-1"
				onclick="location.href='<%=request.getContextPath() %>/animal_update?no=${dto.animal_no }'">
				<i class="bi bi-pencil"></i>수정
			</button>
			<button type="button" class="btn btn-danger" data-bs-toggle="modal"
				data-bs-target="#deleteModal" data-id="${ deleteAddr }">
				<i class="bi bi-trash3"></i> 삭제
			</button>
			<%-- <button type="button" onclick="location.href='<%=request.getContextPath() %>/animal_delete?no=${dto.animal_no }'">삭제</button> --%>

		</div>



	</div>
	<jsp:include page="../../include/deleteModal.jsp" />
</body>
</html>