<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }"/>
<c:set var="deleteAddr" value="${ path }/admin_review_delete?review_no=${ list.review_no }" />
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_Review</title>
    <jsp:include page="../../include/admin_header.jsp"/>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <script>
        $(function() {
            let userId = '${ session_admin_id }';
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
</head>
<body>

<div class="container">

    <div class="sub-title"><h4>입양후기 상세 내용</h4></div>

    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td colspan="6" class="col-6">${ list.review_title } <span class="badge text-bg-primary" id="comment-count"></span></td>
        </tr>
        <tr>
            <th class="table-light">작성자</th>
            <td class="user col-1"><a href="${ path }/admin_user_content?user_id=${ list.review_id }">${ list.review_id }</a></td>
            <th class="table-light col-1">조회수</th>
            <td class="col-1">${ list.review_hit }</td>
            <th class="col-1">등록일시</th>
            <td colspan="2" class="col-2"><small>${ list.review_regdate }</small></td>
        </tr>
        <tr>
            <th class="table-light col-1">동물명(종)</th>
            <td class="user col-6" colspan="5">
	            <a href="${ path }/admin_animal_content?animal_id=${ list.review_animal_id }">${ list.animal_name }
	            ( <c:if test="${ list.review_animal_tag eq 'dog' }">강아지</c:if><c:if test="${ list.review_animal_tag eq 'cat' }">고양이</c:if> )</a>
            </td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td colspan="6" class="col-6">
                <textarea class="form-control-plaintext mx-3" cols="60" rows="10" readonly>${ list.review_content }</textarea>
            </td>
        </tr>
        <tr>
            <th class="table-light">이미지</th>
            <td colspan="6">
	            <c:if test="${ !empty list.review_img1 }">
	                 <p class="mt-2"><img src="${ path }${ list.review_img1 }" style="max-height: 300px;" alt="review_img" /></p>      
	            </c:if>  
	            <c:if test="${ !empty list.review_img2 }">
	                 <p class="mt-2"><img src="${ path }${ list.review_img2 }" style="max-height: 300px;" alt="review_img" /></p>      
	            </c:if> 
                <c:if test="${ !empty list.review_img3 }">
                     <p class="mt-2"><img src="${ path }${ list.review_img3 }" style="max-height: 300px;" alt="review_img" /></p>      
                </c:if> 
            </td>
        </tr>
        <tr>
            <th class="table-light">동영상</th>
            <td colspan="6">
                <c:if test="${ !empty list.review_video }">
                     <p class="mt-2"><video src="${ path }${ list.review_video }" height="300px" controls="controls" ></video></p>      
                </c:if> 
            </td>
        </tr>
    </table>    
    
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
                <button type="button" class="btn btn-outline-primary btn-sm" onclick="commentSave('${ session_admin_id }', ${ list.review_no }, '${ path }');"><i class="bi bi-reply"></i> 댓글등록</button>
            </td>
        </tr>
    </table>
    
    <%-- button  --%>
    <div class="buttons">
	    <button class="btn btn-dark mx-1" onclick="location.href='${path}/admin_review_list'"><i class="bi bi-card-list"></i> 목록</button>
        <button class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }"><i class="bi bi-eraser"></i> 삭제</button>
	    <button class="btn btn-success mx-1" onclick="location.href='${path}/admin_review_update?review_no=${ list.review_no }&animal_no=${ list.review_animal_id }'"><i class="bi bi-pencil"></i> 수정</button>
	</div>
	
	<%-- 삭제모달 --%>
	<jsp:include page="../../include/deleteModal.jsp" />
	
	<div class="space"></div>
</div>


</body>
</html>