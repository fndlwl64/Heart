<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }"/>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_Review</title>
    <jsp:include page="../../include/admin_header.jsp"/>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <script src="${path}/resources/js/admin_list_view.js"></script>    
</head>
<body>

<div class="container">

    <div class="sub-title"><h4>입양후기 상세 내용</h4></div>

    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td colspan="6" class="col-6">${ list.review_title }</td>
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
            <td class="user col-6" colspan="5"><a href="${ path }/admin_animal_content?animal_id=${ list.review_animal_id }">
            ${ list.animal_name }
            ( <c:if test="${ list.review_animal_tag eq 'dog' }">강아지</c:if><c:if test="${ list.review_animal_tag eq 'cat' }">고양이</c:if> )</a></td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td colspan="6" class="col-6">
                <textarea class="form-control-plaintext mx-3" cols="60" rows="10" readonly>${ list.review_content }</textarea>
            </td>
        </tr>
        <tr>
            <th class="table-light">이미지</th>
            <td colspan="3"><img src="${path}/resources/image/search.png"></td>
            <td colspan="3"><img src="${path}/resources/image/search.png"></td>
        </tr>
    </table>    
    <br>
    
    <%-- button  --%>
    <div class="buttons">
	    <button class="btn btn-dark mx-1" onclick="location.href='${path}/admin_review_list'"><i class="bi bi-card-list"></i> 목록으로</button>
        <button class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="${ path }/admin_review_delete?review_no=${ list.review_no }"><i class="bi bi-eraser"></i> 삭제하기</button>
	    <button class="btn btn-success mx-1" onclick="location.href='${path}/admin_review_update?review_no=${ list.review_no }'"><i class="bi bi-pencil"></i> 수정하기</button>
	</div>
	
	  <%-- 삭제 모달 // admin_list_view.js 삽입되어 있음
	 	modal-dialog-centered 삽입됨
	  --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div id="myInput" class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        해당 데이터를 삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" id="deleteFunction">삭제</button>
                    </div>
                </div>
            </div>
        </div>
	
	<div class="space"></div>
</div>


</body>
</html>