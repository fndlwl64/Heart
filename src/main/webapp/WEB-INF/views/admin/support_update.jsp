<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/admin_header.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${Modify}"/>
<link rel="stylesheet" href="resources/css/support.css">
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/support_update_ok">
		<table class="table noticeinfo mt-4">
			<tr class="border-top">
				<th class="table-light col-1"><span class="sp2">후원회원</span></th>
				<td class="col-3"><input name="support_userid" class="form-control" type="text" value="${dto.getSupport_userid()}"></td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">금액</span></th>
				<td><input name="support_price" class="form-control" type="text" value="${dto.getSupport_price()}"></td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">후원일자</span></th>
				<td><input name="support_date" class="form-control" type="text" value="${dto.getSupport_date().substring(0,10)}"></td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="support_no" value="${dto.getSupport_no() }">
		<button type="button" class="btn btn-secondary mx-1" onclick="location.href='${path}/support_list'"><i class="bi bi-card-list"></i> 목록</button>
        <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
        <button id="update_btn" type="submit" class="btn btn-dark mx-1"><i class="bi bi-save"></i> 등록</button>
	</form>
</div>
</body>
</html>