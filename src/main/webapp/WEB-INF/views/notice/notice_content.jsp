<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/user_header.jsp" />
<link rel="short icon" href="#" />
<link rel="stylesheet" href="${path}/resources/css/notice.css">
<c:set var="dto" value="${Cont }"/>
<div class="notice-board">
	<div align="center">
		<h2>공지사항</h2>
		<h2>${dto.getNotice_hit() }</h2>
		<div class="notice_content">
			<div>
				<p><span class="sp_content1">${dto.getNotice_title()}</span><span class="sp_content2">게시일 : ${dto.getNotice_date().substring(0,10) }</span></p>
				<hr width="95%">
				<p><span class="sp_content3">${dto.getNotice_content()}</span></p>
				<div class="notice_content_mid"> 
					<img alt="" src="${path}/resources/image/dog.png">
					<img alt="" src="${path}/resources/image/dog.png">
				</div>
				<div>
					<button onclick="location.href='${path}/user_notice'">목록으로</button><br><br>
				</div>
			</div>

		</div>
		
	</div>
</div>
<br><br><br>
<jsp:include page="../include/user_footer.jsp" />