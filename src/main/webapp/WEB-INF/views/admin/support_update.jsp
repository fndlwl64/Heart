<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/admin_header.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${Modify}"/>
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/support_update_ok">
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">후원회원</span></th>
				<td><input name="support_userid" class ="input1" type="text" value="${dto.getSupport_userid()}" readonly></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">금액</span></th>
				<td><input name="support_price" class ="input1" type="text" value="${dto.getSupport_price()}"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">후원일자</span></th>
				<td><input name="support_date" class ="input1" type="text" value="${dto.getSupport_date().substring(0,10)}"></td>
			</tr>
		</table>
		<br>
		<input type="hidden" name="support_no" value="${dto.getSupport_no() }">
		<input id="update_btn" type="submit" value="변경">
	</form>
</div>
</body>
</html>