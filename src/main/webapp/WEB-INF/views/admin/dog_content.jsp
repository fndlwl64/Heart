<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/admin_header.jsp"/>
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
    <br><br>

    <table class="table petinfo">
        <tr>
            <th class="table-secondary">일련번호</th>
            <td>1</td>
            <th class="table-secondary">종</th>
            <td colspan="3">허스키</td>
        </tr>

        <tr>
            <th class="table-secondary">성별</th>
            <td>수컷</td>
            <th class="table-secondary">중성화</th>
            <td>Yes</td>
            <th class="table-secondary">예방접종</th>
            <td>No</td>
        </tr>

        <tr>
            <th class="table-secondary">나이</th>
            <td>5살 추정</td>
            <th class="table-secondary">크기</th>
            <td>대형</td>
            <th class="table-secondary">무게</th>
            <td>10kg</td>
        </tr>

        <tr>
            <th class="table-secondary">발견장소</th>
            <td colspan="5">서울시 중구 남대문로</td>
        </tr>

        <tr>
            <th class="table-secondary">유의사항</th>
            <td colspan="5">온순하며 밥을 잘먹음</td>
        </tr>
    </table>

    <br>
    <%-- 목록 버튼만 : 수정,삭제,등록은 list.jsp에서  --%>
    <button class="listbtn" onclick="location.href='/dog_list'">목록</button>

</div>

</body>
</html>