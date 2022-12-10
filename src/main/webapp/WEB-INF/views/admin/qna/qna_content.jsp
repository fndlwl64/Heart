<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ qnaContent }"/>
	
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_QNA</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">

    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td colspan="6" class="col-6">${ list.board_title } 
	            <c:if test="${ list.board_secret eq 'Y' }"><i class="bi bi-lock-fill"></i></c:if>
				<c:if test="${ not empty list.board_update }"><small>(edited)</small></c:if>
			</td>
        </tr>
        <tr>
            <th class="table-light">작성자</th>
            <td class="user col-1"><a href="${ path }/admin_user_content?user_id=${ list.board_id }">${ list.board_id }</a></td>
            <th class="table-light col-1">조회수</th>
            <td class="col-1">${ list.board_hit }</td>
            <th class="col-1">
            	<c:if test="${ not empty list.board_update }">수정일시</c:if>
            	<c:if test="${ empty list.board_update }">등록일시</c:if>
        	</th>
            <td colspan="2" class="col-2">
                <c:if test="${ not empty list.board_update }"><small>${ list.board_update }</small></c:if>
            	<c:if test="${ empty list.board_update }"><small>${ list.board_regdate }</small></c:if>
            </td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td colspan="6" class="col-6">
                <textarea class="form-control-plaintext" cols="60" rows="10" readonly>${ list.board_content }</textarea>
            </td>
        </tr>

        <tr>
            <th class="table-light">이미지</th>
            <td colspan="3"><img src="${path}/resources/image/search.png"></td>
            <td colspan="3"><img src="${path}/resources/image/search.png"></td>
        </tr>

    </table>

    <br>
    <%-- button  --%>
    <button class="listbtn" onclick="location.href='${path}/admin_qna_list'"><i class="bi bi-card-list"></i> 목록으로</button>

</div>

</body>
</html>