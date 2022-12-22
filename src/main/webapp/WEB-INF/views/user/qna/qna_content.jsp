<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ qnaContent }" />
<c:set var="uList" value="${ userContent }" />
<c:if test="${ not empty session_admin_id }">
    <c:set var="session_id" value="${ session_admin_id }" />
</c:if>
<c:if test="${ empty session_admin_id }">
    <c:set var="session_id" value="${ session_id }" />
</c:if>
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />

<script type="text/javascript">
$(function() {
	let userId = '${ session_id }';
	let boardNo = ${ list.board_no };
	let path = '${ path }';
	commentTable(userId, boardNo, path);	
 	commentCount(boardNo, path);
});
</script> 
<script type="text/javascript" src="${ path }/resources/js/qna_comment.js"></script>

<%-- 문의글 상세 보기 --%>
<div id="qna-contents" class="qna-contents">
        <div class="border qna-content">
            <div class="content-header">
                <div><h3>${ list.board_title }</h3></div>
                <div class="header-info">
                    <ul>
                        <li class="d-inline"><img src="${path}/resources/image/user_img/${ uList.user_image }" alt="user_image"></li>
                        <li class="d-inline">
                            <a href="${path}/user_mypage_wish_list"><span id="id">${ list.board_id }</span></a>
                            <a id="reply" href=".reply-table"><i class="bi bi-card-list"></i> 댓글 <span id="comment-count">0</span></a>
                        </li>
                        <li class="d-block">${ list.board_regdate.substring(0,10) } 조회 ${ list.board_hit }</li>
                    </ul>
                </div>
                <hr>
            </div>
            <div class="content" data-bs-spy="scroll" data-bs-target="#content-scroll">
                <div id="content-scroll">
                    <div class="content-body">
                        <c:if test="${ !empty list.board_img1 }">
                            <div class="qna-image shadow-sm my-2 bg-body rounded">
                                 <p class="mt-2"><img src="${ path }${ list.board_img1 }" class="rounded mx-auto d-block" style="max-height: 300px;" alt="board_img" /></p>      
                            </div>
                        </c:if>  
                        <c:if test="${ !empty list.board_img2 }">
                            <div class="qna-image shadow-sm my-2 bg-body rounded">
                                 <p class="mt-2"><img src="${ path }${ list.board_img2 }" class="rounded mx-auto d-block" style="max-height: 300px;" alt="board_img" /></p>      
                            </div>
                        </c:if> 
						<div class="qna-text mb-3">
						    ${ list.board_content.replace(newline, '<br/>') } 
						</div>
                    </div>
                </div>
            </div>
			
            <%-- 댓글쓰기 --%>
            <table class="table table-bordered" id="comment-table"></table>
			<table class="table table-bordered reply-table">
			    <tr class="align-middle">
			        <th class="col-1">댓글쓰기</th>
			        <td class="col-11" id="content-reply">
			            <textarea class="form-control" name="board_comment" id="comment_content" cols="30" rows="5" placeholder="댓글을 남겨보세요." required="required"></textarea>
			            <button type="button" class="btn btn-outline-primary btn-sm" onclick="commentSave('${ session_id }', ${ list.board_no }, '${ path }');"><i class="bi bi-reply"></i> 댓글등록</button>
			        </td>
			    </tr>
			</table>

            <%-- 작성자가 로그인한 아이디일 때 수정/삭제 버튼 활성화 --%>
            <div class="content-buttons d-flex">
            	<div class="left-button">
	                <button type="button" class="btn btn-dark" onclick="location.href='${ path }/user_qna_list'"><i class="bi bi-card-list"></i> 목록</button>
					<c:if test="${ list.board_id eq session_id }">
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteQna"><i class="bi bi-trash3"></i> 삭제</button>
						<button type="button" class="btn btn-success" onclick="location.href='${path}/user_qna_update?board_no=${ list.board_no }'"><i class="bi bi-eraser"></i> 수정</button>
					</c:if>
                </div>
                <div class="right-button">
                	<button type="button" class="btn btn-primary" onclick="location.href='${path}/user_qna_insert?board_parentNo=${ list.board_no }&board_group=${ list.board_group }'">
                	<i class="bi bi-arrow-return-right"></i> 답변하기</button>
                </div>
            </div>
        </div>
    </div>
   
 	<%-- delete function --%>
	<form name="pwdForm" action="${path}/user_qna_delete" method="post" >
		<input type="hidden" name="board_no" value="${ list.board_no }" />
		<div class="modal fade" id="deleteQna" tabindex="-1" aria-labelledby="deleteQnaLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="deleteQnaLabel">글 삭제하기</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<p class="mb-2 ps-1">정말 삭제하시겠습니까? <br /> 삭제 시 데이터는 복구되지 않습니다.</p>		 
		       	<p class="ps-1"><strong>글 비밀번호 </strong><input type="password" name="board_pwd" class="form-control d-inline w-75" /></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
		        <button type="reset" class="btn btn-warning">다시입력</button>		        
		        <button type="submit" class="btn btn-danger">삭제하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	
    <jsp:include page="../../include/deleteModal.jsp" />	

    <div class="space-add"></div>

<jsp:include page="../../include/user_footer.jsp" />
