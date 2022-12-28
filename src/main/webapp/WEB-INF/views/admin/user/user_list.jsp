<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/admin_header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:set var="url" value="&user_id=${user_id}&user_grade=${user_grade }&user_animalexp=${user_animalexp }&order=${ order }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <script src="${path }/resources/js/admin_list_view.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/list_view.css">
</head>
<body>

<div class="container">

    <%-- 검색 폼  --%>
    <form class="search_form" action="${path }/user_list" method="get">
    	<div class="form_box">
           <%--  <select id="fieldSelect" class="form-select form-select-sm user_field" name="field">
                <option value="id"<c:if test="${field eq 'id'}">selected="selected"</c:if>>회원아이디</option>
                <option value="grade"<c:if test="${field eq 'grade'}">selected="selected"</c:if>>회원등급</option>
                <option value="animalexp"<c:if test="${field eq 'animalexp'}">selected="selected"</c:if>>반려동물경험</option>
            </select>
           
           	<div class="wrapper">
	           	<input id="keywordSearch" class="form-control form-control-sm user_search" name="keyword" value="${keyword }" size="20">	
	
	           	<div id="gradeSearch" class="radio_grade">
		    		<label><input type="radio" name="user_grade" value="1" ondblclick="this.checked=false"/> 1등급</label>
		    		<label><input type="radio" name="user_grade" value="2" ondblclick="this.checked=false"/> 2등급</label>
		    		<label><input type="radio" name="user_grade" value="3" ondblclick="this.checked=false"/> 3등급</label>
		    		<label><input type="radio" name="user_grade" value="4" ondblclick="this.checked=false"/> 4등급</label>
		    		<label><input type="radio" name="user_grade" value="5" ondblclick="this.checked=false"/> 5등급</label>
		    	</div>
		    	
		    	<div id="expSearch" class="radio_exp">
		    		<label><input type="radio" name="user_animalexp" value="Y" ondblclick="this.checked=false"/> Y</label>
		    		<label><input type="radio" name="user_animalexp" value="N" ondblclick="this.checked=false"/> N</label>
		    	</div> 
		    	
            </div> --%>
            
            <div class="search-semi-title">
                <span><i class="bi bi-check2-square"></i> 회원 검색</span>
            </div>       
            
            <div class="search-table-box">
                <table class="table table-sm" id="search-table">
                    <tr>
                    	<th width="10%">회원 등급</th>
                        <td colspan="3">
                        	<div class="search-checkbox">
	                        	<label><input type="radio" class="form-check-input" name="user_grade" value="1" ondblclick="this.checked=false" <c:if test="${user_grade eq '1' }">checked="checked"</c:if>/> 관리자</label>
					    		<label><input type="radio" class="form-check-input" name="user_grade" value="2" ondblclick="this.checked=false" <c:if test="${user_grade eq '2' }">checked="checked"</c:if>/> 입소가능회원</label>
					    		<label><input type="radio" class="form-check-input" name="user_grade" value="3" ondblclick="this.checked=false" <c:if test="${user_grade eq '3' }">checked="checked"</c:if>/> 일반회원</label>
					    		<label><input type="radio" class="form-check-input" name="user_grade" value="4" ondblclick="this.checked=false" <c:if test="${user_grade eq '4' }">checked="checked"</c:if> /> 블랙리스트</label>
					    		<label><input type="radio" class="form-check-input" name="user_grade" value="5" ondblclick="this.checked=false" <c:if test="${user_grade eq '5' }">checked="checked"</c:if> /> 탈퇴회원</label>
				    		</div>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th width="10%">회원 아이디</th>
                        <td width="20%"><input type="text" class="form-control" name="user_id" value="${ user_id }" /></td>
                        <th width="10%">회원 이름</th>
                        <td width="20%"><input type="text" class="form-control" name="user_name" value="${ user_name }" /></td>
                        <th width="10%">반려동물 경험</th>
                        <td width="15%" class=""> 
                        	<div class="search-checkbox">
	                        	<label><input type="radio" class="form-check-input" name="user_animalexp" value="Y" ondblclick="this.checked=false" <c:if test="${user_animalexp eq 'Y' }">checked="checked"</c:if> /> 있음</label>
			    				<label><input type="radio" class="form-check-input" name="user_animalexp" value="N" ondblclick="this.checked=false" <c:if test="${user_animalexp eq 'N' }">checked="checked"</c:if> /> 없음</label>
		    				</div>
                        </td>                        
                    </tr>                                                           
                </table>
			</div>
			
			<div class="search-buttons">
				<button class="btn btn-light" type="button" onclick="location.href='${ path }/user_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
	            <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
            </div>
            
	    </div> 
    </form>
    
	<%-- 정렬 & 게시물 수 --%>
    <div class="qna-section">
        <div class="row">
            <div class="col total-data"><span>총 회원 <fmt:formatNumber value="${ totalRecord }" /> 명</span>
                <select class="form-select form-select-sm order" name="order" onchange="location.href='${path}/user_list?page=${ paging.page }&user_id=${user_id }&user_grade=${user_grade }&user_animalexp=${user_animalexp }&order='+this.value;">
                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>최신가입순</option>
                    <option value="grade_desc"<c:if test="${ order eq 'grade_desc' }">selected="selected"</c:if>>등급낮은순</option>
                    <option value="grade_asc"<c:if test="${ order eq 'grade_asc' }">selected="selected"</c:if>>등급높은순</option>
                    <option value="name_asc"<c:if test="${ order eq 'name_asc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
    </div>
	
    <%-- 검색 결과 테이블 --%>
    <div class="lists">
	   
        <table class="table searched_list mb-4">
            <tr>
                <th class="table-light col-1">No</th>
                <th class="table-light col-1">아이디</th>
                <th class="table-light col-1">이름</th>
                <th class="table-light col-1">등급</th>
                <th class="table-light col-1">반려동물경험</th>
                <th class="table-light col-1">수정 / 삭제</th>
            </tr>
            
            <c:if test="${!empty list}">
            <c:forEach items="${list }" var="list">
          		<tr <c:if test="${ list.user_grade eq 5 }">style="background-color:#A8A8A8;"</c:if>>
	                <td>${list.user_no}</td>
	                <td><a href="${path}/user_view?user_id=${list.user_id}">${list.user_id}</a></td>
	                <td>${list.user_name}</td>
	                <td id="user_list_grade">
	                	<c:if test="${list.user_grade == 1}">관리자</c:if>
	                	<c:if test="${list.user_grade == 2}">입소가능회원</c:if>
	                	<c:if test="${list.user_grade == 3}">일반회원</c:if>
	                	<c:if test="${list.user_grade == 4}">블랙리스트</c:if>
	                	<c:if test="${list.user_grade == 5}">탈퇴회원</c:if>
	                </td>
	                <td>${list.user_animalexp}</td>
	                <td>
	                	<c:if test="${list.user_grade ne 5 }">
	                	<c:set value="${ path }/user_delete?user_no=${ list.user_no }" var="deleteAddr" />
	                    <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/user_update?user_id=${list.user_id }'">수정</button>
	                    <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${path}/user_delete?user_id=${list.user_id}">삭제</button>
	                    </c:if>
	                    
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
	<%@ include file="../../include/pagination_update.jsp" %>

</div>

</body>
</html>