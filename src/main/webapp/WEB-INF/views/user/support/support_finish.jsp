<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<script src="${path}/resources/js/support.js"></script>
<%-- 여기서부터 작성 --%>
<style>
	.div_finish {
		background-image: url("resources/image/sup_finish.png");
		height: 600px;
		width: 500px;
		background-repeat: none;
		background-position: center;
		background-size: cover;
		margin: 0 auto;
	}
	
	.sup_text {
	}
</style>
<div align="center">
<h1>후원해주셔서 감사합니다!</h1>
</div>
<div class="div_finish">
	<div align="center">
		
		<!-- <img id="sup_finish" src="resources/image/sup_finish.png"> -->
	</div>
	<div class="sup_text">
 		<h1 id="text_id">${name}</h1>
		<h1 id="text_amount">&nbsp;${amount}</h1>
	</div>
</div>


<jsp:include page="../../include/user_footer.jsp" />
