<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${supportList }"/>
<jsp:include page="../include/admin_header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="resources/js/main.js"></script>
    <script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>
    <br>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="post" action="${path }/notice_update_ok">
            <div class="form_box">
                <select name="field">
                    <option value="title">글제목</option>
                    <option value="cont">내용</option>
                </select>

                <input name="keyword">

                <input class="btn btn-secondary searchbtn" type="submit" value="검색">
            </div>
        </form>

        <br>

        <button class="btn btn-success insertbtn" onclick="location.href='${path}/notice_insert'">등록</button>

        <br><br>

        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table searched_list">
                <tr>
                    <th class="table-secondary">글번호</th>
                    <th class="table-secondary">글제목</th>
                    <th class="table-secondary">조회수</th>
                    <th class="table-secondary">수정/삭제</th>
                </tr>
				<c:if test="${!empty noticeList}">
					<c:forEach items="${noticeList }" var="dto">
		                <tr>
		                    <td>${dto.getNotice_no() }111</td>
		                    <td><a href="${path }/notice_content?no=${dto.getNotice_no()}">${dto.getNotice_title() }</a></td>
		                    <td>${dto.getNotice_hit() }</td>
		                    <td>
		                        <button class="btn btn-primary" onclick="location.href='${path}/notice_update?no=${dto.getNotice_no() }'">수정</button>
		                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path }/notice_delete?no=${dto.getNotice_no()}">삭제</button>
		                    </td>
		                </tr>
                	</c:forEach>
                </c:if>
            </table>

        </div>

        <br>
        <%-- 페이징처리 --%>
   	 	<jsp:include page="../include/pagination.jsp" />

        <%-- 삭제 모달 --%>
		<jsp:include page="../include/deleteModal.jsp" />
    </div>


</body>
</html>