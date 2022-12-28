<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="content" value="${content }"></c:set>
<c:set var="foreign" value="${foreign }"></c:set>
<c:set var="deleteAddr" value="${path }/adoptreg_cancel?animal_no=${content.adopt_reg_animalno }&adopt_reg_regno=${content.adopt_reg_regno }&user_id=${content.adopt_reg_userid }"></c:set>
<c:if test="${ empty content.adopt_reg_duedate }">
	<c:set var="semiTitle" value="입양 예정일" />
</c:if>
<c:if test="${not empty content.adopt_reg_duedate }">
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
<link rel="stylesheet" href="resources/css/admin_include.css">
<link rel="stylesheet" href="resources/css/list_view.css">
<c:set var="content" value="${content }"></c:set>
<c:set var="foreign" value="${foreign }"></c:set>
<c:set var="deleteAddr" value="${path }/adoptreg_cancel?animal_no=${content.adopt_reg_animalno }&adopt_reg_regno=${content.adopt_reg_regno }&user_id=${content.adopt_reg_userid }"></c:set>
<body>
	<jsp:include page="../../include/admin_header.jsp" />
	<script src="resources/js/admin_list_view.js"></script>
	<input type="hidden" id="user_id" value="${content.adopt_reg_userid }"/>
	<input type="hidden" id="animal_name" value="${foreign.animal_name }"/>
	<div class="container" align="center">
		<div style="width: 100%;"class="sub-title"><h4>입양 상세 내용</h4></div>
		<form action="<%=request.getContextPath()%>/adoptreg_update" method="post">
			<input type="hidden" name="adopt_reg_animalno"
				value="${content.adopt_reg_animalno }" />
			<table class="table table-hover searched_list">
				<tr>
					<th class="table-light w-25"><span class="sp2">입양회원</span></th>
					<td>${content.adopt_reg_userid }</td>
					<!-- class ="input1" -->
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">동물이름</span></th>
					<td>${foreign.animal_name }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입양 상태</span></th>
					<td>${foreign.animal_status }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입소신청일</span></th>
					<td>${content.adopt_reg_appdate }</td>
				</tr>
				<tr>
					<th class="table-light "><span class="sp2">입양등록일</span></th>
					<td>${content.adopt_reg_regdate }</td>
				</tr>

				<tr>
					<th class="table-light" height="50px">입양 완료일</th>
					<td colspan="5">
						<input type="datetime-local" name="adopt_reg_adoptdate" class="form-control">
					</td>
				</tr>
			</c:if>
        </table>
	    <div class="buttons">
            <div>
                <button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/adoptreg_list'"><i class="bi bi-card-list"></i> 목록</button>
		    </div>
		    <div>
		    	<a class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }" onclick="changeOption()" style="color: white"><i class="bi bi-x-circle"></i> 입양 취소</a>
			    <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
			    <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> 등록</button>
		    </div>
		</div>
        </form>
        <jsp:include page="../../include/deleteModal.jsp" />        
    </div>
</div>
