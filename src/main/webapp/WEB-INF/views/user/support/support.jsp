<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<script src="${path}/resources/js/support.js"></script>
<%-- 여기서부터 작성 --%>
<div class="div1" align="center">
	<br><br><br><br><br><br>
	<h1>후원을 원하시면 아래 이미지를 눌러주세요!</h1>
	<img class="btn_support" src="resources/image/animal.png" onclick="popup('${path}')">
</div>

<jsp:include page="../../include/user_footer.jsp" />
