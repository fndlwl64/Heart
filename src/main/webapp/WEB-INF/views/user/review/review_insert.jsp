<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="animal_info" value="${ animal_info }" />
<c:set var="animal_no" value="${ animal_no }" />
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
        <form action="${path}/user_review_insert_ok" method="post">
            <input type="hidden" name="review_id" value="${ session_id }">
            <input type="hidden" name="review_animal_id" value="${ animal_no }">
            <input type="hidden" name="review_animal_tag" value="${ animal_info.animal_tag }">
            <table class="table align-middle insert-table">
                <tr class="border-top">
                    <th class="table-light col-1">종류</th>
                    <td class="col-1">
                        <input type="text" class="form-control-plaintext px-1" 
                        <c:if test="${ animal_info.animal_tag eq 'dog' }">value="강아지 [${ animal_info.animal_species }]"</c:if>
                        <c:if test="${ animal_info.animal_tag eq 'cat' }">value="고양이 [${ animal_info.animal_species }]"</c:if>
                         readonly="readonly">
                    </td>                  
                    <th class="table-light col-1">반려동물명</th>
                    <td class="col-1">
                        <input type="text" class="form-control-plaintext px-1" value="${ animal_info.animal_name }" readonly="readonly">
                    </td>                  
                    <th class="table-light col-1">작성자</th>
                    <td class="col-1">
                        <input type="text" class="form-control-plaintext px-1" value="${ session_id }" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th class="table-light">제목</th>
                    <td colspan="5"><input type="text" class="form-control" name="review_title" required="required"></td>
                </tr>
                <tr>
                    <th class="table-light">내용</th>
                    <td colspan="5"><textarea name="review_content" class="form-control" cols="30" rows="10"></textarea></td>
                </tr>
                <tr>
                	<th class="table-light">이미지</th>                	
                    <td colspan="5">
                        <div class="d-flex align-middle">
                            <input type="file" class="form-control" name="review_img" accept="image/gif, image/jpeg, image/png" multiple>
                        </div>
                    </td>
                </tr>
                <tr>
                	<th class="table-light">동영상</th>                	
                    <td colspan="5">
                        <div class="d-flex align-middle">
                            <input type="file" class="form-control" name="review_video" accept="image/gif, image/jpeg, image/png" multiple>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="review-section">
                <div class="row">
                    <div class="col-3 space"></div>
                    <div class="col-6 title btn-insert">
                        <button type="button" class="btn btn-dark" onclick="history.back()"><i class="bi bi-card-list"></i> 뒤로가기</button>
                        <button type="reset" class="btn btn-warning"><i class="bi bi-pencil"></i> 다시작성</button>
                        <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> 등록하기</button>
                    </div>
                    <div class="col-3 space"></div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
