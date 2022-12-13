<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<script>
function popup(){
	  let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=900, height=900, top=100,left=400";

	  window.open("<%=request.getContextPath() %>/user_support_insert","_blank", options);
	}
</script>
<%-- 여기서부터 작성 --%>

<div align="center">
	<button class="btn_support" type="button" onclick="popup()"></button>
</div>

<jsp:include page="../../include/user_footer.jsp" />
