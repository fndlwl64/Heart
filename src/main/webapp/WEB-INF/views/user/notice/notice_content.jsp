<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/notice.css">
<c:set var="dto" value="${Cont }"/>
<div class="notice-board">
	<div align="center">
		<h2>공지사항</h2>
		<div class="notice_content">
			<div>
				<p><span class="sp_content1">${dto.getNotice_title()}</span><span class="sp_content2">게시일 : ${dto.getNotice_date().substring(0,10) }</span></p>
				<hr width="95%">
				<p><span class="sp_content3">${dto.getNotice_content()}</span></p>
				<div class="notice_content_mid"> 
					<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img1() }">
					<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img2() }">
				</div>
			</div>
		</div>
		<br><br>
		<div>
			<button type="button" id="btn_content" class="btn btn-secondary mx-1" onclick="location.href='${path}/user_notice'"><i class="bi bi-card-list"></i> 목록</button>
		</div>
	</div>
</div>
<br><br><br>
<jsp:include page="../../include/user_footer.jsp" />