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
				<div class="notice_title">
					<span class="sp_content1">${dto.getNotice_title()}</span><span class="sp_content2">게시일 : ${dto.getNotice_date().substring(0,10) }</span><br />
				</div>
				<hr width="95%">
				<div class="notice_content_mid"> 
					<c:if test="${!empty dto.getNotice_img1() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img1() }">
					</c:if>
					<c:if test="${!empty dto.getNotice_img2() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img2() }">
					</c:if>
				</div>
				<textarea class="sp_content3" rows="25" cols="100" readonly>${dto.getNotice_content()}</textarea>
				
			</div>
		</div>

		<div>
			<button type="button" id="btn_content" class="btn btn-dark btn_list" onclick="location.href='${path}/user_notice'"><i class="bi bi-card-list"></i> 목록</button>
		</div>
	</div>
</div>

<jsp:include page="../../include/user_footer.jsp" />