<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }" />
<c:set var="uList" value="${ userContent }" />
<c:set var="deleteAddr" value="${ path }/user_review_delete?review_no=${ list.review_no }" />
<c:if test="${ not empty session_admin_id }">
    <c:set var="session_id" value="${ session_admin_id }" />
</c:if>
<c:if test="${ empty session_admin_id }">
    <c:set var="session_id" value="${ session_id }" />
</c:if>

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/user_review.css" />
<script type="text/javascript">
	$(function() {
	    let userId = '${ session_id }';
	    let reviewNo = ${ list.review_no };
	    let path = '${ path }';
	    commentTable(userId, reviewNo, path);    
	    commentCount(reviewNo, path);
	});
</script> 
<script type="text/javascript" src="${ path }/resources/js/review_comment.js"></script>
<script type="text/javascript" src="${ path }/resources/js/admin_list_view.js"></script>

<%-- 입양후기 상세 보기 --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col title">
                <h2>입양후기 - ${ list.animal_name } </h2>
                <h6>HeartPet을 통해 가족을 찾은 ${ list.animal_name }의 이야기입니다.</h6>
            </div>
        </div>
    </div>

    <div>
        <div class="border review-content">
            <div class="content-header">
                <div><h3>${ list.review_title }</h3></div>
                <div class="header-info">
                    <ul>
                        <li class="d-inline">
                            <img src="${path}/resources/image/user_img/${ uList.user_image }" alt="user_image">
                        </li>
                        <li class="d-inline">
                            <a <c:if test="${ list.review_id eq session_id }">href="${path}/user_mypage_wish_list"</c:if>
                               <c:if test="${ list.review_id ne session_id && not empty session_admin_id }">href="${path}/user_content?user_id=${ uList.user_id }"</c:if>
                               <c:if test="${ list.review_id ne session_id && empty session_admin_id }"></c:if>>
                               <span id="id">${ list.review_id }</span></a>
                            <a id="reply" href="#comment-table"><i class="bi bi-card-list"></i> 댓글 <span id="comment-count">0</span></a>
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
	                        <div class="review-image my-2 bg-body rounded">
					             <p class="mt-2"><img src="${ path }${ list.review_img1 }" class="rounded d-block" style="max-width: 60%;" alt="review_img" /></p>      
							</div>
						</c:if>  
						<c:if test="${ !empty list.review_img2 }">
	                        <div class="review-image my-2 bg-body rounded">						
					             <p class="mt-2"><img src="${ path }${ list.review_img2 }" class="rounded d-block" style="max-width: 60%;" alt="review_img" /></p>      
	                        </div>
						</c:if>
						<c:if test="${ !empty list.review_img3 }">
	                        <div class="review-image my-2 bg-body rounded">   
					             <p class="mt-2"><img src="${ path }${ list.review_img3 }" class="rounded d-block" style="max-width: 60%;" alt="review_img" /></p>      
	                        </div>
						</c:if>
                        <c:if test="${ !empty list.review_video }">
                            <div class="review-video my-2">
                                <p class="mt-2"><video src="${ path }${ list.review_video }" width="60%" controls="controls" ></video></p>
                            </div>  
                        </c:if> 
                        <div class="review-text mb-3">
                            ${ fn:replace(list.review_content, newline, '<br/>') }
                        </div>
                    </div>
                </div>
            </div>

            <%-- 댓글쓰기 --%>
		    <table class="table caption-top" id="comment-table"></table>
		    <table class="table reply-table">
		        <tr class="align-middle">
		            <th class="col-1">댓글쓰기</th>
		            <td class="col-11" id="content-reply">
		                <textarea class="form-control" name="review_comment" id="comment_content" cols="30" rows="5" required="required"
		                <c:if test="${ not empty session_id }">placeholder="댓글을 남겨보세요."</c:if>  
		                <c:if test="${ empty session_id }">placeholder="로그인이 필요합니다."</c:if>></textarea>
		                <c:if test="${ not empty session_id }" >
		                  <button type="button" class="btn btn-outline-primary btn-sm" onclick="commentSave('${ session_id }', ${ list.review_no }, '${ path }');"><i class="bi bi-reply"></i> 댓글등록</button>
		                </c:if>
		                <c:if test="${ empty session_id }">
		                  <a class="btn btn-outline-dark mt-2 btn-sm" href="#goto-login"><i class="bi bi-box-arrow-in-right"></i> 로그인</a>
		                </c:if>
		            </td>
		        </tr>
		    </table>

            <div <c:if test="${ list.review_id eq session_id }">class="content-buttons"</c:if>
                 <c:if test="${ list.review_id ne session_id }">class="content-buttons justify-content-end"</c:if>>
                <div>
                    <button type="button" class="btn btn-dark" onclick="location.href='${path}/user_review_list'"><i class="bi bi-card-list"></i> 목록</button>
                </div>
                <c:if test="${ list.review_id eq session_id }">
                <div>
	                <button type="button" class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }"><i class="bi bi-trash3"></i> 삭제</button>
	                <button type="button" class="btn btn-success mx-1" onclick="location.href='${path}/user_review_update?review_no=${ list.review_no }&animal_no=${ list.review_animal_id }'"><i class="bi bi-eraser"></i> 수정</button>
                </div>
                </c:if>
            </div>
        </div>
    </div>
    
    <%-- delete function --%>
	<jsp:include page="../../include/deleteModal.jsp" />  
	<jsp:include page="../../include/deleteCommentModal.jsp" />
	      
</div>

<jsp:include page="../../include/user_footer.jsp" />
