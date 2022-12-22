<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<script src="${path}/resources/js/support.js"></script>
<%-- 여기서부터 작성 --%>
<div class="div_finish" align="center">
	<div align="center">
		<h1>후원해주셔서 감사합니다!</h1>
		<img id="sup_finish" src="resources/image/sup_finish.png">
	</div>
	<div class="sup_text">
		<h1 id="text_id">${name}</h1>
		<h1 id="text_amount">${amount}</h1>
	</div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
