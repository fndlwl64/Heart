<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_review.css" />

<%-- 글쓰기 --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">입양후기 수정하기</div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <div>
        <form action="${path}/" method="post">
            <input type="hidden" name="dog_name" value="${ dog_name }">
            <input type="hidden" name="board_id" value="${ board_id }">
            <table class="table align-middle insert-table">
                <tr class="border-top">
                    <th class="table-light col-1">입양동물번호</th>
                    <td class="col-2"><%-- db 확인 필요 --%>
                        <input type="text" class="form-control" value="${ dog_name }" disabled="disabled">
                    </td>
                    <th class="table-light col-1">작성자</th>
                    <td class="col-2">
                        <input type="text" class="form-control" value="${ board_id }" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th class="table-light">제목</th>
                    <td colspan="4"><input type="text" class="form-control" name="board_title" value="${ board_title }" required="required"></td>
                </tr>
                <tr>
                    <th class="table-light">내용</th>
                    <td colspan="4"><textarea name="board_content" class="form-control" cols="30" rows="10">${ board_content }</textarea></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="d-flex align-middle">
                            <input type="file" class="form-control" name="board_img" value="${ board_img }" accept="image/gif, image/jpeg, image/png" multiple>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="review-section">
                <div class="row">
                    <div class="col-3 space"></div>
                    <div class="col-6 title btn-insert">
                        <button type="reset" class="btn btn-warning"><i class="bi bi-pencil"></i> 다시작성</button>
                        <button type="submit" class="btn btn-dark"><i class="bi bi-eraser"></i> 수정하기</button>
                    </div>
                    <div class="col-3 space"></div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
