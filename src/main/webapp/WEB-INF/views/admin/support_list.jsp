<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${supportList }"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>

<div class="container">

    <br>
    <%-- 검색 폼 --%>
    <form class="search_form" method="post" action="${path }/support_insert_ok">
        <div class="form_box">
            <select name="field">
                <option value="id">회원아이디</option>
                <option value="grade">후원금액</option>
            </select>

            <input name="keyword">

            <input class="btn btn-secondary searchbtn" type="submit" value="검색">
        </div>
    </form>

    <br>

    <button class="btn btn-success insertbtn" onclick="location.href='${path }/support_insert'">등록</button>

    <br><br>
    <%-- 검색 결과 테이블 --%>
    <div class="lists">
		
        <table class="table searched_list">
            <tr>
                <th class="table-secondary">후원번호</th>
                <th class="table-secondary">회원아이디</th>
                <th class="table-secondary">후원금액</th>
                <th class="table-secondary">후원날짜</th>
                <th class="table-secondary">수정/삭제</th>
            </tr>
            <c:if test="${!empty supportList }">
				<c:forEach items="${supportList }" var="dto">
	            <tr>
	                <td>${dto.getSupport_no() }</td>
	                <td>${dto.getSupport_userid() }</td>
	                <td>${dto.getSupport_price() }원</td>
	                <td>${dto.getSupport_date().substring(0,10) }</td>
	                <td>
	                    <button class="btn btn-primary" onclick="location.href='${path }/support_update?no=${dto.getSupport_no()}'">수정</button>
	                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path }/support_delete?no=${dto.getSupport_no()}">삭제</button>
	                </td>
	            </tr>
	            </c:forEach>
            </c:if>
        </table>

    </div>

    <br>

    <%-- 삭제 모달 --%>
    <jsp:include page="../include/deleteModal.jsp" />
    
    <%-- 페이징처리 --%>
    <jsp:include page="../include/pagination.jsp" />
    <!-- <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav> -->
    

</div>


</body>
</html>