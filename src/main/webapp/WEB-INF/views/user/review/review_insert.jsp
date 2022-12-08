<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="aName" value="${ animalName }" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_review.css" />

<%-- 글쓰기 --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">입양후기 작성하기</div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <div>
        <form action="${path}/" method="post">
            <input type="hidden" name="dog_name" value="${ aName }">
            <input type="hidden" name="review_id" value="${ session_id }">
            <table class="table align-middle insert-table">
                <tr class="border-top">
                    <th class="table-light col-1">입양동물번호</th>
                    <td class="col-2">
                        <input type="text" class="form-control" value="${ aName }" disabled="disabled">
                    </td>
                    <th class="table-light col-1">작성자</th>
                    <td class="col-2">
                        <input type="text" class="form-control" value="${ session_id }" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th class="table-light">제목</th>
                    <td colspan="4"><input type="text" class="form-control" name="board_title" required="required"></td>
                </tr>
                <tr>
                    <th class="table-light">내용</th>
                    <td colspan="4"><textarea name="board_content" class="form-control" cols="30" rows="10"></textarea></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="d-flex align-middle">
                            <input type="file" class="form-control" name="board_img" accept="image/gif, image/jpeg, image/png" multiple>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="review-section">
                <div class="row">
                    <div class="col-3 space"></div>
                    <div class="col-6 title btn-insert">
                        <button type="reset" class="btn btn-warning"><i class="bi bi-pencil"></i> 다시작성</button>
                        <button type="submit" class="btn btn-dark"><i class="bi bi-save"></i> 등록하기</button>
                    </div>
                    <div class="col-3 space"></div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
