<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="content" value="${content }"></c:set>
<c:set var="foreign" value="${foreign }"></c:set>
<c:set var="deleteAddr" value="${path }/adoptreg_cancel?animal_no=${content.adopt_reg_animalno }&adopt_reg_regno=${content.adopt_reg_regno }&user_id=${content.adopt_reg_userid }"></c:set>
<c:set var="status" value="${status }"/>
<c:if test="${status eq 'duedate'}">
	<c:set var="semiTitle" value="입양 예정일" />
</c:if>
<c:if test="${status eq 'adoptdate' }">
	<c:set var="semiTitle" value="입양 완료일" />
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_AdoptReg</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="resources/js/admin_list_view.js"></script>	
	<script type="text/javascript">
		function changeOption() {
			$('#deleteModalLabel').empty();
			$('#deleteModalLabel').append('입양 등록 취소');
			$('#deleteModalBody').empty();
			$('#deleteModalBody').append($('#user_id').val()+'님의 '+$('#animal_name').val()+' 펫 입양 신청을 취소하시겠습니까?');	
			$('#deleteFunction').empty();
			$('#deleteFunction').append('취소');
		}
	</script>
</head>

<%-- 글쓰기 --%>
<div class="container">

    <div class="sub-title"><h4>${ semiTitle } 등록하기</h4></div>

    <div>
        <form action="${path}/adoptreg_update" method="post">
        <input type="hidden" name="status" value="${status }"/>
        <input type="hidden" name="adopt_reg_animalno" value="${content.adopt_reg_animalno }" />
        <table class="table noticeinfo mt-4">
            <tr class="border-top">
                <th class="table-light col-1" height="50px">회원 아이디</th>
                <td class="col-2"><a style="text-decoration: none; color: black; font-weight: bold;" href="${ path }/user_view?user_id=${ content.adopt_reg_userid }"><span style="font-weight: bold;">${content.adopt_reg_userid }</span></a></td>           
                <th class="table-light col-1">입양 예정 동물</th>
                <td class="col-2"><a style="text-decoration: none; color: black; font-weight: bold;" href="${ path }/animal_content?no=${ foreign.animal_no }">[<c:if test="${ foreign.animal_tag eq 'dog' }">강아지</c:if><c:if test="${ foreign.animal_tag eq 'cat' }">고양이</c:if>] ${foreign.animal_name }</a></td>
                <th class="table-light col-1">입양 상태</th>
                <td class="col-2">
                <span 
                <c:if test="${foreign.animal_status eq '입양 대기' }">
                	style="color: green; font-weight: bold;"
                </c:if>
                >${foreign.animal_status }</span>
                </td>
            </tr>
            <tr>
                <th class="table-light" height="50px">입양 등록일</th>
                <td colspan="5">${content.adopt_reg_regdate.substring(0,16) }</td>
            </tr>
            <tr>
                <th class="table-light" height="50px">입양 예정일</th>
				<td colspan="5">
				<c:if test="${ status eq 'duedate' }">
					<input type="datetime-local" class="form-control" name="adopt_reg_duedate" value="${content.adopt_reg_duedate }" required="required">
				</c:if>
				<c:if test="${ status eq 'adoptdate' }">
					${content.adopt_reg_duedate.substring(0,16) }
				</c:if>
				</td>
			</tr>
			<c:if test="${status eq 'adoptdate' }">
				<tr>
					<th class="table-light" height="50px">입양 완료일</th>
					<td colspan="5">
						<input type="datetime-local" name="adopt_reg_adoptdate" class="form-control" value="${content.adopt_reg_adoptdate }">
					</td>
				</tr>
			</c:if>
        </table>
	    <div class="buttons">
            <div>
                <button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/adoptreg_list'"><i class="bi bi-card-list"></i> 목록</button>
		    </div>
		    <div>
		    	<c:if test="${empty content.adopt_reg_adoptdate }">
		    		<a class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }" onclick="changeOption()" style="color: white"><i class="bi bi-x-circle"></i> 입양 취소</a>
		    	</c:if>
		    	<button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
			    <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> 등록</button>
		    </div>
		</div>
        </form>
        <jsp:include page="../../include/deleteModal.jsp" />        
    </div>
</div>