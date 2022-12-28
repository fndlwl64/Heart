<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_Notice</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <link rel="stylesheet" href="resources/css/notice.css">
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
</head>
<style>
	.buttons{
		width: 80%;
		display: flex;
		margin-left: auto;
		margin-right: auto;
		margin-top: 1rem;
		margin-bottom: 3rem;
		justify-content: space-between;
	}
	
	.table {
		width: 80%;
	}
</style>
<body>
<c:set var="dto" value="${Cont }"/>
<div class="container" align="center" style="width: 80%;">
	<div class="sub-title"><h4>공지사항 상세 내용</h4></div>
    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-2">제목</th>
            <td style="font-weight:bold;">${dto.getNotice_title() }</td>
        </tr>

        <tr>
            <th class="table-light">내용</th>
            <td >
                <textarea class="sp_content3" cols="60" readonly>${dto.getNotice_content() }</textarea>
            </td>
        </tr>
        <tr>
            <th class="table-light">이미지</th>
            <c:if test="${!empty dto.getNotice_img1() }">
            <td><img src="resources/upload/${dto.getNotice_img1() }" style="max-height: 200px;" alt="notice_img"></td>
            </c:if>
            <c:if test="${!empty dto.getNotice_img2() }">
            <td><img src="resources/upload/${dto.getNotice_img2() }" style="max-height: 200px;" alt="notcie_img"></td>
        	</c:if>
        </tr>
    </table>

    <%-- 목록 버튼만 : 수정,삭제,등록은 list.jsp에서  --%>
    <div class="buttons">
    	<div>
    		<button type="button" id="btn_content" class="btn btn-dark btn_list" onclick="location.href='${path}/notice_list'"><i class="bi bi-card-list"></i> 목록</button>
    	</div>
    	<div>
            <button class="btn btn-danger mx-1" onclick="location.href='${path }/notice_delete?no=${dto.getNotice_no()}'"><i class="bi bi-trash3"></i> 삭제</button>
    		<button class="btn btn-success mx-1" onclick="location.href='${path}/notice_update?no=${dto.getNotice_no() }'"><i class="bi bi-eraser"></i> 수정</button>
    	</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.noticeinfo').on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		});
		$('.noticeinfo').find( 'textarea' ).keyup();
	});
</script>
</body>
</html>