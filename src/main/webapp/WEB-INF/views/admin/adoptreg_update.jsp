<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />		
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${path}/resources/css/admin_include.css">
<c:set var="content" value="${content }"></c:set>
<body>
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">입양회원</span></th>
				<td>${content.adopt_reg_userid }</td><!-- class ="input1" -->
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양된유기견</span></th>
				<td>${content.adopt_reg_animalno }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입소신청일</span></th>
				<td>${content.adopt_reg_appdate }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양등록일</span></th>
				<td>${content.adopt_reg_regdate }</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양예정일</span></th>
				<td>
					<c:if test="${empty content.adopt_reg_duedate }">
						<input type="datetime-local" name="adopt_reg_duedate">
					</c:if>
					<c:if test="${not empty content.adopt_reg_duedate }">
						${content.adopt_reg_duedate }
					</c:if>
				</td>
			</tr>
			<c:if test="${not empty content.adopt_reg_duedate }">
				<tr>
					<th class="table-secondary"><span class="sp2">입양완료일</span></th>
					<td>
						<c:if test="${empty content.adopt_reg_adoptdate }">
							<input type="datetime-local" name="adopt_reg_adoptdate">
						</c:if>
					</td>
				</tr>
			</c:if>
		</table>
		<br>
		<input id="update_btn" type="submit" value="변경" align="center">
	</form>
</div>
</body>
</html>