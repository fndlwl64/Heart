<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ reviewContent }" />
<c:set var="animal_info" value="${ animal_info }" />
<c:set var="animal_no" value="${ animal_no }" />
<jsp:include page="../../include/user_header.jsp" />
<% pageContext.setAttribute("newline", "\n"); %>
<link rel="stylesheet" href="${path}/resources/css/user_review.css" />

<%-- 글쓰기 --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col title">입양후기 수정하기</div>
        </div>
    </div>

    <div>
        <form action="${path}/user_review_update_ok" method="post" enctype="multipart/form-data">
            <input type="hidden" name="review_no" value="${ list.review_no }">
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
	                <td class="col-1"><input type="text" readonly="readonly" class="form-control-plaintext px-1" value="${ list.review_id }" /></td>
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
                    	<textarea name="review_content" class="form-control" cols="30" rows="10">${ list.review_content }</textarea>
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
                	<!-- 수정 예정 -->
                	<th class="table-light">동영상</th>
                    <td colspan="5">
                        <div class="d-flex align-middle">
                            <input type="file" class="form-control" name="review_file" value="${ review_video }" accept="video/mp4, video/mkv, video/x-m4v, video/*">
                        </div>
                    </td>
                </tr>
            </table>

            <div class="review-section">
                <div class="row">
                    <div class="col title btn-insert">
					    <div>
                            <button type="button" class="btn btn-dark" onclick="location.href='${ path }/user_review_list'"><i class="bi bi-card-list"></i> 목록</button>
					    </div>
					    <div>
						    <button type="reset" class="btn btn-warning"><i class="bi bi-pencil"></i> 리셋</button>
						    <button type="submit" class="btn btn-success"><i class="bi bi-eraser"></i> 수정</button>
					    </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />
