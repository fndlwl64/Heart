<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../include/admin_header.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${Modify}"/>
<link rel="stylesheet" href="resources/css/support.css">
<br><br>
<div class="div1" align="center">
	<form method="post" action="${path }/support_update_ok">
		
		<div class="sub-title"><h4>후원 상세 내역</h4></div>
		
		<table class="table noticeinfo mt-4">
			<tr class="border-top">
				<th class="table-light col-1">후원번호</th>
				<td class="col-3 middle">${dto.getSupport_no()}</td>
				<th class="table-light col-1">후원일자</th>
				<td class="col-3"><input name="support_date" class="form-control" type="date" value="${dto.getSupport_date().substring(0,10)}"></td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">후원회원</span></th>
				<td colspan="3">${dto.support_userid}</td>
			</tr>
			<tr>
				<th class="table-light col-1"><span class="sp2">후원금액</span></th>
				<td colspan="3"><input name="support_price" class="form-control" type="number" value="${dto.getSupport_price()}"></td>
			</tr>
		</table>
		
		<input type="hidden" value="${dto.support_no }" />
		
		<input type="hidden" value="${dto.support_userid }" />
		
		<div class="btns">
			<div>
				<button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/support_list'"><i class="bi bi-card-list"></i> 목록</button>
			</div>
			
			<div>
		        <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
		        <button id="update_btn" type="submit" class="btn btn-success mx-1"><i class="bi bi-eraser"></i> 수정</button>
	        </div>
        </div>
	</form>
</div>
</body>
</html>