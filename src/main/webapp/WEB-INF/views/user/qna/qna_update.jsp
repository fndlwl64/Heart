<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${qnaContent}" />
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />
<script src="${path}/resources/js/user_qna_insert.js"></script>

<%-- 글쓰기 --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="row">
            <div class="col title">문의글 수정하기</div>
        </div>
    </div>

    <div>
        <form class="mb-3" action="${ path }/user_qna_update_ok" method="post" enctype="multipart/form-data" >
        	<input type="hidden" name="board_no" value="${ list.board_no }" />
        	<input type="hidden" name="board_id" value="${ list.board_id }" />
            <table class="table align-middle">
                <tr class="border-top">
                    <th class="table-light col-1">카테고리</th>
                    <td class="col-2">
                        <select class="form-select" name="board_category" >
                            <option value="입양" <c:if test="${ list.board_category eq '입양' }">selected="selected"</c:if>>입양</option>
                            <option value="입소" <c:if test="${ list.board_category eq '입소' }">selected="selected"</c:if>>입소</option>
                            <option value="후원" <c:if test="${ list.board_category eq '후원' }">selected="selected"</c:if>>후원</option>
                            <option value="기타" <c:if test="${ list.board_category eq '기타' }">selected="selected"</c:if>>기타</option>
                        </select>
                    </td>
                    <th class="table-light col-1">작성자</th>                    
                    <td class="col-2"><input type="text" class="form-control" name="board_id" value="${ list.board_id }" disabled="disabled"></td>
                    <th class="table-light col-1">
                    <label><input class="form-check-input col-1" type="checkbox" name="board_secret" value="Y" <c:if test="${ list.board_secret eq 'Y' }">checked="checked"</c:if>> 비밀글</label>
                    <input type="hidden" name="board_secret" value="N" disabled="disabled" />                    
                    </th>
                </tr>
                <tr>
                    <th class="table-light">제목</th>
                    <td colspan="4"><input type="text" class="form-control" name="board_title" value="${ list.board_title }" required="required"></td>
                </tr>
                <tr>
                    <th class="table-light">내용</th>
                    <td colspan="4"><textarea name="board_content" class="form-control" cols="30" rows="10">${ list.board_content }</textarea></td>
                </tr>
                <tr>
                    <th class="table-light">글 비밀번호</th>
					<td colspan="4"><input type="password" class="form-control" name="board_pwd" required="required"></td>
				</tr>
				<tr>
					<th rowspan="2" class="table-light">이미지</th>
	                <td colspan="4">
	                    <div class="d-grid align-middle original-image">
	                        <input type="file" class="form-control" name="board_img" accept="image/gif, image/jpeg, image/png" >
	                        <c:if test="${ !empty list.board_img1 }">
	                       		<p class="mt-2"><img src="${ path }${ list.board_img1 }" style="max-height: 200px;" alt="board_img" /></p>      
			                </c:if>                  
	                    </div>
                	</td>
                </tr>
                <tr>
                	<td colspan="4">
	                    <div class="d-grid align-middle original-image">
	                        <input type="file" class="form-control" name="board_img" accept="video/mp4, video/mkv, video/x-m4v, video/*" >
	                        <c:if test="${ !empty list.board_img2 }">
	                       		<p class="mt-2"><img src="${ path }${ list.board_img2 }" style="max-height: 200px;" alt="board_img" /></p>      
			                </c:if> 
	                    </div>
                	</td>
                </tr>
            </table>
            <div class="qna-section">
                <div class="row">
                    <div class="col btn-insert d-flex justify-content-between">
                    <div>
                        <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_qna_list'"><i class="bi bi-card-list"></i> 목록</button>
                    </div>
                    <div>
                        <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
                        <button type="submit" class="btn btn-success"><i class="bi bi-eraser"></i> 수정</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
