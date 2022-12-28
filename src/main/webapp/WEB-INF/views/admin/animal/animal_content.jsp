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
	value="${ path }/animal_delete?no=${dto.animal_no }&animal_tag=${dto.animal_tag }" />
<c:if test="${dto.animal_tag eq 'dog' }">
	<c:set var="animal" value="강아지" />
</c:if>
<c:if test="${dto.animal_tag eq 'cat' }">
	<c:set var="animal" value="고양이" />
</c:if>
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/admin_animal.css">
<link rel="stylesheet" href="${path}/resources/css/list_view.css">
<body>

	<div class="container">
	    <div class="sub-title"><h4>${ animal } 상세 정보</h4></div>	
	    <table class="table noticeinfo mt-4">
	        <tr>
	            <th class="table-light" width="10%">${ animal } 이름</th>
	            <td class="user" width="20%">${dto.animal_name }</td>
	            <th class="table-light" width="10%">종</th>
	            <td class="user" width="25%">
	            	${ animal } [${dto.animal_species }]</td>
	        	<th class="table-light" width="10%">성별</th>
	            <td width="20%">
		            <c:if test="${ dto.animal_gender eq 'male' }">
		            	수컷 (♂)
		            </c:if>
		            <c:if test="${ dto.animal_gender eq 'female' }">
		            	암컷 (♀)
		            </c:if>
	            </td>
	        </tr>
	        <tr>
	            <th class="table-light">나이</th>
	            <td class="user">${dto.animal_age }살</td>
	            <th class="table-light">크기</th>
	            <td>${ dto.animal_size }</td>
	            <th class="table-light">무게</th>
	            <td>${ dto.animal_weight }kg</td>
	        </tr>
	        <tr>
	            <th class="table-light">입양 상태</th>
	            <td>
				<c:if test="${ dto.animal_status eq '입소 신청' }">
					<span style="color: #c82333; font-weight: bold;">${ dto.animal_status }</span>
				</c:if>
				<c:if test="${ dto.animal_status eq '입양 가능' }">
					<span style="color: #0d6efd; font-weight: bold;">${ dto.animal_status }</span>
				</c:if>				
	            <c:if test="${ dto.animal_status eq '입양 대기' }">
					<a style="text-decoration: none;" href="${ path }/adoptreg_list?animal_no=${ dto.animal_no }&animal_status=${dto.animal_status }"><span style="color: #218838; font-weight: bold;">${ dto.animal_status }</span></a>
				</c:if>
				<c:if test="${ dto.animal_status eq '입양 완료' }">
					<a style="text-decoration: none;" href="${ path }/adoptreg_list?animal_no=${ dto.animal_no }&animal_status=${dto.animal_status }"><span style="color: #6c757d; font-weight: bold;">${ dto.animal_status }</span></a>
				</c:if>
	            </td>
	            <th class="table-light">발견 장소</th>
	            <td class="user" colspan="4">${dto.animal_place }</td>
	        </tr>
	        <tr>
	            <th class="table-light">중성화 여부</th>
	            <td class="user">
	            <c:if test="${ dto.animal_neutered eq 'Y' }">유</c:if>
	            <c:if test="${ dto.animal_neutered eq 'N' }">무</c:if>
	            </td>
	            <th class="table-light">접종 여부</th>
	            <td class="">
	            <c:if test="${ dto.animal_vaccination eq 'Y' }">유</c:if>
	            <c:if test="${ dto.animal_vaccination eq 'N' }">무</c:if>
	            </td>
	            <th class="table-light">정보 수정일</th>
	            <td><small>
		            <c:if test="${empty dto.getAnimal_update() }"> - </c:if>
		            <c:if test="${!empty dto.getAnimal_update() }">${dto.getAnimal_update().substring(0,10) }</c:if>
		            </small>
	            </td>
	        </tr>
			<tr>
			   <th class="table-light">비고</th>
			   <td class="user" colspan="5">
			   	<textarea class="form-control-plaintext" cols="60" rows="10" readonly>${dto.animal_caution }</textarea>
			   </td>
			</tr>
	        <tr>
	            <th class="table-light">이미지</th>
	            <td colspan="6">
		            <div class="img-fluid">
						<img class="file_change1"
							src="${path }${dto.animal_img1 }" alt="review_img" />
					</div> <c:if test="${not empty dto.animal_img2}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="${path }${dto.animal_img2 }" alt="review_img" />
						</div>
					</c:if> <c:if test="${not empty dto.animal_img3}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="${path }${dto.animal_img3 }" alt="review_img" />
						</div>
					</c:if>
	            </td>
	        </tr>
	    </table>    
	    
	    <div class="animal_button">
			<div>
				<button class="btn btn-dark mx-1 float-right"
					onclick="location.href='${path}/${dto.animal_tag }_list'">
					<i class="bi bi-card-list"></i> 목록
				</button>
			</div>
			
			<div>		
				<button class="btn btn-success mx-1 float-right"
					onclick="location.href='${path}/animal_update?no=${ dto.animal_no }'">
					<i class="bi bi-eraser"></i> 수정
				</button>

				<button class="btn btn-danger mx-1 float-right" data-bs-toggle="modal"
					data-bs-target="#deleteModal" data-id="${ deleteAddr }">
					<i class="bi bi-trash3"></i> 삭제
				</button>
			</div>
		</div>
	    		
		<%-- 삭제모달 --%>
		<jsp:include page="../../include/deleteModal.jsp" />
		<jsp:include page="../../include/deleteCommentModal.jsp" />
		
	</div>

	<%-- <div class="div1" align="center">
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
				<td colspan="7">${dto.animal_species }</td>
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
			<tr class="animal_content">
				<th class="table-light col-1"><span class="sp2">유의사항</span></th>
				<td colspan="7">${dto.animal_caution.replace(newline,'<br>') }</td>

			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">이미지</span>
				<td colspan="7">
					<div class="img-fluid">
						<img class="file_change1"
							src="${path }${dto.animal_img1 }" alt="review_img" />
					</div> <c:if test="${not empty dto.animal_img2}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="${path }${dto.animal_img2 }" alt="review_img" />
						</div>
					</c:if> <c:if test="${not empty dto.animal_img3}">
						<br>
						<div class="img-fluid">
							<img class="file_change1"
								src="${path }${dto.animal_img3 }" alt="review_img" />
						</div>
					</c:if>
				</td>
			</tr>
		</table>
		<div class="animal_button">
			<button type="button" class="btn btn-success mx-1"
				onclick="location.href='<%=request.getContextPath() %>/animal_update?no=${dto.animal_no }'">
				<i class="bi bi-pencil"></i>수정
			</button>
			<button type="button" class="btn btn-danger" data-bs-toggle="modal"
				data-bs-target="#deleteModal" data-id="${ deleteAddr }">
				<i class="bi bi-trash3"></i> 삭제
			</button>
			<button type="button" onclick="location.href='<%=request.getContextPath() %>/animal_delete?no=${dto.animal_no }'">삭제</button>

		</div> 
		 
		<div class="animal_button ">
			<div>
				<button class="btn btn-dark mx-1 float-right"
					onclick="location.href='${path}/${dto.animal_tag }_list'">
					<i class="bi bi-card-list"></i> 목록
				</button>
			</div>
			
			<div>		
				<button class="btn btn-success mx-1 float-right"
					onclick="location.href='${path}/animal_update?no=${ dto.animal_no }'">
					<i class="bi bi-eraser"></i> 수정
				</button>

				<button class="btn btn-danger mx-1 float-right" data-bs-toggle="modal"
					data-bs-target="#deleteModal" data-id="${ deleteAddr }">
					<i class="bi bi-trash3"></i> 삭제
				</button>
			</div>
		</div>
	</div>
	<jsp:include page="../../include/deleteModal.jsp" /> --%>
	
</body>
</html>