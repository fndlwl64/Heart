<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }" />
<c:if test="${ not empty session_admin_id }">
    <c:set var="session_id" value="${ session_admin_id }" />
</c:if>
<c:if test="${ empty session_admin_id }">
    <c:set var="session_id" value="${ session_id }" />
</c:if>
<% pageContext.setAttribute("newline", "\n"); %>
<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/user_review.css" />
<script type="text/javascript">
$(function() {
    let userId = '${ session_id }';
    let reviewNo = ${ list.review_no };
    let path = '${ path }';
    commentTable(userId, reviewNo, path);    
    commentCount(reviewNo, path);
    
    // 삭제 모달
    const deleteModal = document.getElementById('deleteModal')
    const deleteInput = document.getElementById('deleteInput')

    deleteModal.addEventListener('shown.bs.modal', (e) => {
        deleteInput.focus();
        let commentNo = $(e.relatedTarget).data('no');
        let path = $(e.relatedTarget).data('path');
        let userId = $(e.relatedTarget).data('user');
        let reviewNo = $(e.relatedTarget).data('reviewno');
        
        $('#deleteFunction').on("click", function() {
            commentDelete(commentNo, path, userId, reviewNo);
        });
    });
});
</script> 
<script type="text/javascript" src="${ path }/resources/js/review_comment.js"></script>

<%-- 입양후기 상세 보기 --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">
                <h2>입양후기 - ${ list.animal_name } </h2>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <div>
        <div class="border review-content">
            <div class="content-header">
                <div><h3>${ list.review_title }</h3></div>
                <div class="header-info">
                    <ul>
                        <li class="d-inline">
                            <img src="${path}/resources/image/heartpet_logo.png" alt="user_image">
                        </li>
                        <li class="d-inline">
                            <a href="${path}/user_mypage_wish_list"><span id="id">${ list.review_id }</span></a>
                            <a id="reply" href=".reply-table"><i class="bi bi-card-list"></i> 댓글 <span id="comment-count">0</span></a>
                        </li>
                        <li class="d-block">${ list.review_regdate } 조회 ${ list.review_hit }</li>
                    </ul>
                </div>
                <hr>
            </div>
            <div class="content" data-bs-spy="scroll" data-bs-target="#content-scroll">
                <div id="content-scroll">
                    <div class="content-body">
                        <c:if test="${ !empty list.review_img1 }">
	                        <div class="review-image shadow-sm my-2 bg-body rounded">
					             <p class="mt-2"><img src="${ path }${ list.review_img1 }" class="rounded mx-auto d-block" style="max-height: 300px;" alt="review_img" /></p>      
							</div>
						</c:if>  
						<c:if test="${ !empty list.review_img2 }">
	                        <div class="review-image shadow-sm my-2 bg-body rounded">						
					             <p class="mt-2"><img src="${ path }${ list.review_img2 }" class="rounded mx-auto d-block" style="max-height: 300px;" alt="review_img" /></p>      
	                        </div>
						</c:if>
						<c:if test="${ !empty list.review_img3 }">
	                        <div class="review-image shadow-sm my-2 bg-body rounded">   
					             <p class="mt-2"><img src="${ path }${ list.review_img3 }" class="rounded mx-auto d-block" style="max-height: 300px;" alt="review_img" /></p>      
	                        </div>
						</c:if>
                        <c:if test="${ !empty list.review_video }">
                            <div class="review-video my-2">
                                <p class="mt-2"><video src="${ path }${ list.review_video }" height="300px" controls="controls" ></video></p>
                            </div>  
                        </c:if> 
                        <div class="review-text mb-3">
                            ${ fn:replace(list.review_content, newline, '<br/>') }
                        </div>
                    </div>
                </div>
            </div>

            <%-- 댓글쓰기 --%>
		    <table class="table table-bordered" id="comment-table">
		        <thead>
		            <tr>
		                <th class="col-1">작성자</th>
		                <th class="col-5">댓글내용</th>
		                <th class="col-1">작성시간</th>
		                <th class="col-1">삭제</th>
		            </tr>
		        </thead>
		        <tbody></tbody>
		    </table>
		    <table class="table table-bordered reply-table">
		        <tr class="align-middle">
		            <th class="col-2">댓글쓰기</th>
		            <td class="col-10" id="content-reply">
		                <textarea class="form-control" name="board_comment" id="comment_content" cols="30" rows="5" placeholder="댓글을 남겨보세요." required="required"></textarea>
		                <button type="button" class="btn btn-outline-primary btn-sm" onclick="commentSave('${ session_id }', ${ list.review_no }, '${ path }');"><i class="bi bi-reply"></i> 댓글등록</button>
		            </td>
		        </tr>
		    </table>

            <div class="content-buttons">
                <c:if test="${ list.review_id eq session_id }">
                <button type="button" class="btn btn-success" onclick="location.href='${path}/user_review_update?review_no=${ list.review_no }&animal_no=${ list.review_animal_id }'"><i class="bi bi-eraser"></i> 수정</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }"><i class="bi bi-trash3"></i> 삭제</button>
                </c:if>
                <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_review_list'"><i class="bi bi-card-list"></i> 목록</button>
            </div>
        </div>
    </div>
    
    <%-- delete function --%>
	<jsp:include page="../../include/deleteModal.jsp" />  
	      
    <div class="space-add"></div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
