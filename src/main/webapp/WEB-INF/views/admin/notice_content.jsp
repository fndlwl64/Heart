<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<c:set var="dto" value="${Cont }"/>
<div class="container">

    <br>
    <br><br>

    <table class="table noticeinfo">
        <tr>
            <th class="table-secondary">제목</th>
            <td colspan="5">${dto.getNotice_title() }</td>
        </tr>

        <tr>
            <th class="table-secondary">내용</th>
            <td colspan="5">
                <textarea cols="60" rows="10" readonly>${dto.getNotice_content() }</textarea>
            </td>
        </tr>

        <tr>
            <th class="table-secondary">이미지</th>
            <td colspan="2"><img src="resources/upload/${dto.getNotice_img1() }"></td>
            <td colspan="2"><img src="resources/upload/${dto.getNotice_img2() }"></td>
        </tr>

    </table>

    <br>
    <%-- 목록 버튼만 : 수정,삭제,등록은 list.jsp에서  --%>
    <button class="listbtn" onclick="location.href='${path}/notice_list'">목록</button>

</div>

</body>
</html>