<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ qnaContent }" />
<c:choose>
	<c:when test="${ not empty list }"> 
		<c:set var="semiTitle" value="답변" />
		<c:set var="buttonText" value="답변" />
	</c:when>
	<c:otherwise> 
		<c:set var="semiTitle" value="문의" />	
		<c:set var="buttonText" value="등록" />	
	</c:otherwise>
</c:choose>
<!-- list : 부모글 -->
<% pageContext.setAttribute("newline", "\n"); %>
<script src="${path}/resources/js/fileCount.js"></script>
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />
<script src="${path}/resources/js/user_qna_insert.js"></script>

<%-- 글쓰기 --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section mb-3">
        <div class="qna-title">
            <span>${ semiTitle }글 작성하기</span>
        </div>
    </div>

    <div>
        <form action="${path}/user_qna_insert_ok" method="post" enctype="multipart/form-data">
        <input type="hidden" name="board_id" value="${ session_id }" />
        <!-- 답변글 작성인 경우 parentNo = board_no 되도록 -->
        <c:if test="${ not empty list }">
            <c:if test="${ list.level eq 1 }"><input type="hidden" name="board_group" value="${ list.board_no }" /></c:if>
            <c:if test="${ list.level ge 2 }"><input type="hidden" name="board_group" value="${ list.board_group }" /></c:if>
       		<input type="hidden" name="board_parentNo" value="${ list.board_no }" />
        </c:if>
        <table class="table align-middle">
            <tr class="border-top">
                <th class="table-light col-1">카테고리</th>
                <td class="col-2">
                    <select class="form-select" name="board_category">
                        <option value="입양" selected="selected">입양</option>
                        <option value="입소">입소</option>
                        <option value="후원">후원</option>
                        <option value="기타">기타</option>
                    </select>
                </td>           
                <th class="table-light col-1">작성자</th>
                <td class="col-2"><input type="text" class="form-control-plaintext ms-2" value="${ session_id }" disabled="disabled"></td>
                <th class="table-light col-1">
                <label><input class="form-check-input col-1" type="checkbox" name="board_secret" value="Y"
                <c:if test="${ empty list.board_secret }">checked="checked"</c:if>
                <c:if test="${ list.board_secret eq 'Y' }">checked="checked" disabled="disabled"</c:if>
                <c:if test="${ list.board_secret eq 'N' }"></c:if>> 비밀글</label>
                <input type="hidden" name="board_secret" value="N" disabled="disabled" />
                </th>
            </tr>
            <tr>
                <th class="table-light">제목</th>
                <td colspan="4">                            
                <input type="text" class="form-control" name="board_title" value="${ list.board_title }" required="required">
                </td>
            </tr>
            <tr>
                <th class="table-light">내용</th>
                <td colspan="4">
                <textarea name="board_content" class="form-control" cols="30" rows="10">${ list.board_content.replace(newline, '<br/>').replace('<br/>', '') }<c:if test="${ not empty list.board_content }">&#10;=====================================================&#10;</c:if></textarea>
                </td>
            </tr>
            <tr>
                <th class="table-light">글 비밀번호</th>
				<td class="col-2"><input type="password" class="form-control" name="board_pwd" required="required">
				</td>
				<th class="table-light">이미지</th>
                <td colspan="2">
                    <div class="d-flex align-middle">
                        <input type="file" class="form-control" id="image" name="board_img" accept="image/gif, image/jpeg, image/png" multiple onchange="fileOption(2, this.id);">
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
	                    <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> ${ buttonText }</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
