<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script src="${path}/resources/js/support.js"></script>
<link rel="stylesheet" href="resources/css/support.css">
<body>
	<div class="div1" align="center">

	<div class="sub-title"><h4>후원 등록하기</h4></div> 
		<form method="post" action="${path }/support_insert_ok" onsubmit="return submitOption();">
			<table class="table noticeinfo mt-4">
				<tr class="border-top">
					<th class="table-light col-1"><span class="sp2">후원회원</span></th>
					<td class="col-3"><input id="sup_user" name="support_userid" class="form-control" type="text"></td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">금액</span></th>
					<td><input id="sup_price" name="support_price" class="form-control" type="text"></td>
				</tr>
				<tr>
					<th class="table-light col-1"><span class="sp2">후원일자</span></th>
					<td><input id="sup_date" name="support_date" class="form-control" type="date"></td>
				</tr>
			</table>
						
			<div class="btns">
				<div>
					<button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/support_list'"><i class="bi bi-card-list"></i> 목록</button>
				</div>
				
				<div>
			        <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
			        <button id="update_btn" type="submit" class="btn btn-primary mx-1"><i class="bi bi-save"></i> 등록</button>
		        </div>
	        </div>

		</form>

	</div>
</body>
</html>