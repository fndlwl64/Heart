<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }" />
<% pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_Review</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/user_qna_insert.js"></script>
</head>

<%-- 리뷰 수정하기 --%>
<div class="container">

    <div class="sub-title"><h4>입양후기 수정하기</h4></div>

    <div>
        <form action="${path}/admin_review_update_ok" method="post" enctype="multipart/form-data">
        <input type="hidden" name="review_no" value="${ list.review_no }" />
        <table class="table noticeinfo mt-4">
            <tr class="border-top">
            	<th class="table-light col-1">종류</th>
                <td class="col-1">
					<input type="text" readonly="readonly" class="form-control-plaintext px-1"  
					<c:if test="${ list.review_animal_tag eq 'dog' }"> value="강아지"</c:if>
					<c:if test="${ list.review_animal_tag eq 'cat' }"> value="고양이"</c:if>/>
                </td>    
                <th class="table-light col-1">동물명</th>
                <td class="col-1">
					<input type="text" readonly="readonly" class="form-control-plaintext px-1" value="${ list.animal_name }" />
                </td>           
                <th class="table-light col-1">작성자</th>
                <td class="col-1">
                	<input type="text" readonly="readonly" class="form-control-plaintext px-1" value="${ list.review_id }" />
               	</td>
            </tr>
            <tr>
                <th class="table-light">제목</th>
                <td colspan="5">                            
                	<input type="text" class="form-control" name="review_title" value="${ list.review_title }" required="required">
                </td>
            </tr>
            <tr>
                <th class="table-light">내용</th>
                <td colspan="5">
                	<textarea name="review_content" class="form-control" cols="30" rows="10">${ list.review_content.replace(newline, '<br/>').replace('<br/>', '') }</textarea>
                </td>
            </tr>
            <tr>
				<th rowspan="3" class="table-light">이미지</th>
                <td colspan="5">
				    <div class="d-grid align-middle original-image">
				        <input type="file" class="form-control" name="review_file" accept="image/gif, image/jpeg, image/png" >
				        <c:if test="${ !empty list.review_img1 }">
				            <p class="mt-2"><img src="${ path }${ list.review_img1 }" style="max-height: 200px;" alt="review_img" /></p>      
				        </c:if>                  
				    </div>
				</td>
			</tr>
			<tr>
				<td colspan="5">
                    <div class="d-grid align-middle original-image">
                        <input type="file" class="form-control" name="review_file" accept="image/gif, image/jpeg, image/png" >
                        <c:if test="${ !empty list.review_img2 }">
                            <p class="mt-2"><img src="${ path }${ list.review_img2 }" style="max-height: 200px;" alt="review_img" /></p>      
                        </c:if>                  
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <div class="d-grid align-middle original-image">
                        <input type="file" class="form-control" name="review_file" accept="image/gif, image/jpeg, image/png" >
                        <c:if test="${ !empty list.review_img3 }">
                            <p class="mt-2"><img src="${ path }${ list.review_img3 }" style="max-height: 200px;" alt="review_img" /></p>      
                        </c:if>                  
                    </div>
                </td>
            </tr>
            <tr>
               	<th class="table-light">동영상</th>
                <td colspan="5">
                    <div class="d-grid align-middle original-image">
                        <input type="file" class="form-control" name="review_file" value="${ list.review_video }" accept="video/mp4, video/mkv, video/x-m4v, video/*">
                    </div>
                </td>
            </tr>
        </table>
	    <div class="buttons">
            <div>
                <button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/admin_review_list'"><i class="bi bi-card-list"></i> 목록</button>
		    </div>
		    <div>
			    <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
			    <button type="submit" class="btn btn-success mx-1"><i class="bi bi-eraser"></i> 수정</button>
		    </div>
		</div>
        </form>
    </div>
</div>
