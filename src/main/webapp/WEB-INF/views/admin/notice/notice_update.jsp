<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	.table-light {
		vertical-align: middle;
	}
</style>
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<!-- <link rel="stylesheet" href="resources/css/support.css"> -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${Cont }" />
<body>
<jsp:include page="../../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">

	<form method="post" action="${path }/notice_update_ok" enctype="multipart/form-data">
		<input type="hidden" name="notice_img1" value="${dto.getNotice_img1() }">
		<input type="hidden" name="notice_img2" value="${dto.getNotice_img2() }">
		<table class="table noticeinfo mt-4">
			<tr>
				<th class="table-light col-1"><span class="sp2">공지제목</span></th>
				<td><input class="form-control" type="text" name="notice_title" value="${dto.getNotice_title() }"></td>
			</tr>
			<tr>
				<th class="table-light"><span class="sp2">글내용</span></th>
				<td><textarea rows="8" cols="22" class="form-control" name="notice_content">${dto.getNotice_content() }</textarea> </td>
			</tr>
			<tr>
				<th class="table-light"><span class="sp2">조회수</span></th>
				<td><input class="form-control" type="text" name="notice_hit" value="${dto.getNotice_hit() }"></td>
			</tr>
			<tr>
				<th class="table-light" rowspan="2"><span class="sp2">이미지</span></th>
				<td>
					<div class="d-grid align-middle original-image">
						<input class="file_input btn" id="file-input2" type="file" name="files" accept="image/gif, image/jpeg, image/png">
						<c:if test="${!empty dto.getNotice_img1()}">
						<p class="image-update"><img id="file_change2" class="logo" src="resources/upload/${dto.getNotice_img1() }" style="max-height: 200px;" alt="notice_img"/></p>
						<p class="delete-checkbox">
                            <label><input type="checkbox" class="form-check-input" name="notice_image1_delete" value="Y" /> 선택한 파일 삭제</label>
                        </p>
                        </c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="d-grid align-middle original-image">
						<input class="file_input btn" id="file-input2" type="file" name="files" accept="image/gif, image/jpeg, image/png">
						<c:if test="${!empty dto.getNotice_img2()}">
						<p class="image-update"><img id="file_change2" class="logo" src="resources/upload/${dto.getNotice_img2() }" style="max-height: 200px;" alt="notice_img"/></p>
						<p class="delete-checkbox">
                            <label><input type="checkbox" class="form-check-input" name="notice_image2_delete" value="Y" /> 선택한 파일 삭제</label>
                        </p>
                        </c:if>
					</div>
				</td>
			</tr>
		</table>
		<input type="hidden" name="notice_no" value="${dto.getNotice_no() }">
		<div class="btns">
			<div>
				<button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/notice_list'"><i class="bi bi-card-list"></i> 목록</button>
	        </div>
	        <div>
	        	<button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 취소</button>
	        	<button id="update_btn" type="submit" class="btn btn-success mx-1"><i class="bi bi-eraser"></i> 수정</button>
	        </div>
		</div>		
	</form>
	
</div>
</body>
</html>