<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${path}/resources/css/admin_include.css">
<c:set var="content" value="${content }"></c:set>
<c:set var="foreign" value="${foreign }"></c:set>
<body>
	<jsp:include page="../../include/admin_header.jsp" />
	<br>
	<br>
	<div class="div1" align="center" style="margin-top: 10%;">
		<form action="<%=request.getContextPath()%>/adoptreg_update" method="post">
			<input type="hidden" name="adopt_reg_animalno"
				value="${content.adopt_reg_animalno }" />
			<table class="table table-hover searched_list">
				<tr>
					<th class="table-light w-25"><span class="sp2">입양회원</span></th>
					<td>${content.adopt_reg_userid }</td>
					<!-- class ="input1" -->
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">동물이름</span></th>
					<td>${foreign.animal_name }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입양 상태</span></th>
					<td>${foreign.animal_status }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입소신청일</span></th>
					<td>${content.adopt_reg_appdate }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입양등록일</span></th>
					<td>${content.adopt_reg_regdate }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입양예정일</span></th>
					<td>
						<input type="datetime-local" name="adopt_reg_duedate" class="form-control" value="${content.adopt_reg_duedate }">
					</td>
				</tr>
				<c:if test="${not empty content.adopt_reg_duedate }">
					<tr>
						<th class="table-light "><span class="sp2">입양완료일</span></th>
						<td>
							<input type="datetime-local" name="adopt_reg_adoptdate" class="form-control">
						</td>
					</tr>
				</c:if>
			</table>
			<br>
			<div class="buttons">
				<button type="submit" class="btn btn-success mx-1"><i class="bi bi-save"></i> 수정</button>
			</div>
		</form>
	</div>
</body>
</html>