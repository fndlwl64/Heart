<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../include/admin_header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <script src="${path }/resources/js/admin_list_view.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">

    <br>

    <%-- 검색 폼  --%>
    <form class="search_form" action="${path }/user_list" method="get">
    	<input type="hidden" name="field" />
		<table>
       		<tr>
       			<th>회원등급</th>
       			<td colspan="3">
       				<div class="radio_grade">
			    		<label><input type="radio" name="user_grade" value="1" ondblclick="this.checked=false"/> 1등급</label>
			    		<label><input type="radio" name="user_grade" value="2" ondblclick="this.checked=false"/> 2등급</label>
			    		<label><input type="radio" name="user_grade" value="3" ondblclick="this.checked=false"/> 3등급</label>
			    		<label><input type="radio" name="user_grade" value="4" ondblclick="this.checked=false"/> 4등급</label>
			    		<label><input type="radio" name="user_grade" value="5" ondblclick="this.checked=false"/> 5등급</label>
			    	</div>
       			</td>
       		</tr>
       		<tr>
       			<th>회원아이디</th>
       			<td><input class="form-control form-control-sm user_search" name="keyword" value="${keyword }" size="10"></td>
       			<th>반려동물경험</th>
       			<td>
       				<div class="radio_exp">
			    		<label><input type="radio" name="user_animalexp" value="Y" ondblclick="this.checked=false"/> Y </label>
			    		<label><input type="radio" name="user_animalexp" value="N" ondblclick="this.checked=false"/> N </label>
			    	</div>
       			</td>
       		</tr>
       	</table>
       	
       	<button class="btn searchbtn" type="submit"><i class='bi bi-search'></i> 검색</button>
    	
       <%-- <div class="form_box">
            <select class="form-select form-select-sm user_field" name="field">
                <option value="id"<c:if test="${field eq 'id'}">selected="selected"</c:if>>회원아이디</option>
                <option value="grade"<c:if test="${field eq 'grade'}">selected="selected"</c:if>>회원등급</option>
            </select>
            
            <c:if test="${field eq 'id'}">
            	<input class="form-control form-control-sm user_search" name="keyword" value="${keyword }" size="20">	
            </c:if>
            
            <c:if test="${field eq 'grade'}">
            	<div class="radio_grade">
		    		<label><input type="radio" name="user_grade" value="1" ondblclick="this.checked=false"/> 1등급</label>
		    		<label><input type="radio" name="user_grade" value="2" ondblclick="this.checked=false"/> 2등급</label>
		    		<label><input type="radio" name="user_grade" value="3" ondblclick="this.checked=false"/> 3등급</label>
		    		<label><input type="radio" name="user_grade" value="4" ondblclick="this.checked=false"/> 4등급</label>
		    		<label><input type="radio" name="user_grade" value="5" ondblclick="this.checked=false"/> 5등급</label>
		    	</div>
            </c:if>
            
			<button class="btn searchbtn" type="submit"><i class="i bi-search"></i> 검색</button>
	    </div> --%>
    </form>
	
    <%-- 검색 결과 테이블 --%>
    <div class="lists">
	    <div class="total_user">
			<label>총 회원 <span>${total}</span>명</label>
		</div>
	
        <table class="table table-hover searched_list">
            <tr>
                <th class="table-light">회원번호</th>
                <th class="table-light">회원아이디</th>
                <th class="table-light">회원이름</th>
                <th class="table-light">회원등급</th>
                <th class="table-light">반려동물경험</th>
                <th class="table-light">수정/삭제</th>
            </tr>
            
            <c:if test="${!empty list}">
            <c:forEach items="${list }" var="list">
          		<tr>
	                <td>${list.user_no}</td>
	                <td><a href="${path}/user_view?user_id=${list.user_id}">${list.user_id}</a></td>
	                <td>${list.user_name}</td>
	                <td id="user_list_grade">${list.user_grade}등급</td>
	                <td>${list.user_animalexp}</td>
	                <td>
	                	<c:set value="${ path }/user_delete?user_no=${ list.user_no }" var="deleteAddr" />
	                    <button class="btn btn-outline-success" onclick="location.href='${path}/user_update?user_id=${list.user_id }'">수정</button>
	                    <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }">삭제</button>
	                </td>
	            </tr>
            </c:forEach>            	
            </c:if>
            
            <c:if test="${empty list}">
            	<tr>
            		<td colspan="6">해당하는 회원이 없습니다.</td>
            	</tr>
            </c:if>

        </table>
    </div>
    

    <%-- 삭제 모달 --%>
    <jsp:include page="../../include/deleteModal.jsp" />
    
    <%-- 페이징처리 --%>
	<jsp:include page="../../include/pagination.jsp" />

</div>

</body>
</html>