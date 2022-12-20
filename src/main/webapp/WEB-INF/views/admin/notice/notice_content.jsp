<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>
<c:set var="dto" value="${Cont }"/>
<div class="container">

    <br>
    <br><br>

    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td class="col-1" colspan="5">${dto.getNotice_title() }</td>
        </tr>

        <tr>
            <th class="table-light">내용</th>
            <td class="col-1"colspan="5">
                <textarea class="form-control" cols="60" rows="10" readonly>${dto.getNotice_content() }</textarea>
            </td>
        </tr>

        <tr>
            <th class="table-light">이미지</th>
            <td class="col-1" colspan="2"><img class="list_img" src="resources/upload/${dto.getNotice_img1() }"></td>
            <td class="col-1" colspan="2"><img class="list_img" src="resources/upload/${dto.getNotice_img2() }"></td>
        </tr>

    </table>

    <br>
    <%-- 목록 버튼만 : 수정,삭제,등록은 list.jsp에서  --%>
    <button type="button" id="btn_content" class="btn btn-secondary mx-1" onclick="location.href='${path}/notice_list'"><i class="bi bi-card-list"></i> 목록</button>

</div>

</body>
</html>