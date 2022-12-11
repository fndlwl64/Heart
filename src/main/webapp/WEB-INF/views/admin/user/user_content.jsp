<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">

    <br>
    <%-- el태그로 이름 가져와 입력 --%>
    <h2>${cont.user_name}님 정보</h2>
    <br><br>

    <table class="table userinfo">
        <tr>
            <th class="table-secondary">회원번호</th>
            <td>${cont.user_no}</td>
        </tr>

        <tr>
            <th class="table-secondary">아이디</th>
            <td>${cont.user_id}</td>
        </tr>

        <tr>
            <th class="table-secondary">이름</th>
            <td>${cont.user_name}</td>
        </tr>

        <tr>
            <th class="table-secondary">회원등급</th>
            <td title="1등급 : 관리자 &#10;2등급 : 입양 등록 회원 &#10;3등급 : 일반 회원 &#10;4등급 : 블랙리스트 &#10;5등급 : 탈퇴회원">${cont.user_grade}등급</td>
        </tr>

        <tr>
            <th class="table-secondary">이메일</th>
            <td>${cont.user_email}</td>
        </tr>

        <tr>
            <th class="table-secondary">연락처</th>
            <td>${cont.user_phone}</td>
        </tr>

        <tr>
            <th class="table-secondary">주소</th>
            <td>${cont.user_addr}</td>
        </tr>

        <tr>
            <th class="table-secondary">후원총액</th>
            <td>
            	<fmt:formatNumber>${cont.user_totalprice}</fmt:formatNumber>원
            </td>
        </tr>

        <tr>
            <th class="table-secondary">반려동물경험</th>
            <td>${cont.user_animalexp }</td>
        </tr>
    </table>

    <br>
    <%-- 목록 버튼만 : 수정,삭제,등록은 list.jsp에서  --%>
    <button class="listbtn" onclick="location.href='${path}/user_list'"><i class="bi bi-card-list"></i> 목록</button>

</div>

</body>
</html>