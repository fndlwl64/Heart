<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ qnaContent }"/>
<c:set var="deleteAddr" value="${ path }/admin_qna_delete?board_no=${ list.board_no }"/>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_QNA</title>
    <jsp:include page="../../include/admin_header.jsp"/>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <script>
	    $(function() {
	        let userId = '${ session_admin_id }';
	        let boardNo = ${ list.board_no };
	        let path = '${ path }';
	        commentTable(userId, boardNo, path);    
	        commentCount(boardNo, path);	
	    });
    </script>
    <script type="text/javascript" src="${ path }/resources/js/qna_comment.js"></script>
    <script src="${path}/resources/js/admin_list_view.js"></script> 
</head>
<body>

<div class="container">

    <div class="sub-title"><h4>게시글 상세 내용</h4></div>

    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td colspan="6" class="col-6">${ list.board_title } 
	            <c:if test="${ list.board_secret eq 'Y' }"><i class="bi bi-lock-fill"></i></c:if>
				<c:if test="${ not empty list.board_update }"><small>(edited)</small></c:if>
				<span class="badge text-bg-primary" id="comment-count"></span>
			</td>
        </tr>
        <tr>
            <th class="table-light">작성자</th>
            <td class="user col-1"><a href="${ path }/user_content?user_id=${ list.board_id }">${ list.board_id }</a></td>
            <th class="table-light col-1">조회수</th>
            <td class="col-1">${ list.board_hit }</td>
            <th class="col-1">
            	<c:if test="${ not empty list.board_update }">수정일시</c:if>
            	<c:if test="${ empty list.board_update }">등록일시</c:if>
        	</th>
            <td colspan="2" class="col-2">
                <c:if test="${ not empty list.board_update }"><small>${ list.board_update }</small></c:if>
            	<c:if test="${ empty list.board_update }"><small>${ list.board_regdate }</small></c:if>
            </td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td colspan="6" class="col-6">
                <textarea class="form-control-plaintext" cols="60" rows="10" readonly>${ list.board_content }</textarea>
            </td>
        </tr>
        <tr>
            <th class="table-light">이미지</th>
            <td colspan="6">
            <c:if test="${ !empty list.board_img1 }">
	             <p class="mt-2"><img src="${ path }${ list.board_img1 }" style="max-height: 300px;" alt="board_img" /></p>      
			</c:if>  
			<c:if test="${ !empty list.board_img2 }">
	             <p class="mt-2"><img src="${ path }${ list.board_img2 }" style="max-height: 300px;" alt="board_img" /></p>      
			</c:if> 
            </td>
        </tr>
    </table>
    
    <table class="table caption-top" id="comment-table">
    </table>
    <c:if test="${ list.board_state ne 'disabled' }">
    <table class="table reply-table">
        <tr class="align-middle">
            <th class="col-1">댓글쓰기</th>
            <td class="col-11" id="content-reply">
                <textarea class="form-control" name="board_comment" id="comment_content" cols="30" rows="5" placeholder="댓글을 남겨보세요." required="required"></textarea>
                <button type="button" class="btn btn-outline-primary btn-sm" onclick="commentSave('${ session_admin_id }', ${ list.board_no }, '${ path }');"><i class="bi bi-reply"></i> 댓글등록</button>
            </td>
        </tr>
    </table>
    </c:if>
    <%-- button  --%>
    <div class="buttons">
        <div>
	       <button class="btn btn-dark mx-1" onclick="location.href='${path}/admin_qna_list'"><i class="bi bi-card-list"></i> 목록</button>
	    </div>
	    <div>
		    <button class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }"><i class="bi bi-trash3"></i> 삭제</button>
		    <button class="btn btn-success mx-1" onclick="location.href='${path}/admin_qna_update?board_no=${ list.board_no }'"><i class="bi bi-eraser"></i> 수정</button>
		    <button class="btn btn-primary mx-1" onclick="location.href='${path}/admin_qna_reply_insert?board_parentNo=${ list.board_no }'"><i class="bi bi-reply"></i> 답변</button>
	    </div>
	</div>

    <%-- 삭제모달 --%>
    <jsp:include page="../../include/deleteModal.jsp" />
    <jsp:include page="../../include/deleteCommentModal.jsp" />

</div>

</body>
</html>