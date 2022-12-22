<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="fList" value="${ fnqList }" />
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_fnq_list" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FNQ</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/admin_list_view.js"></script>
    <script src="${path}/resources/js/admin_search.js"></script>
</head>
<body>
    <div class="container">

    <%-- 검색 폼 --%>
	<form action="${path}/admin_fnq_list" class="search_form" method="get">
	<div class="form_box">
	<div class="search-semi-title">
	    <span><i class="bi bi-check2-square"></i> 문의글관리 검색</span>
	</div>       
		<div class="search-table-box">
              <table class="table table-sm" id="search-table">
                  <tr>
                      <th width="12.5%">카테고리</th>
                      <td width="37.5%">
                      	  <div class="search-checkbox">
		                      <label><input type="radio" class="form-check-input" name="search_category" value="전체" checked="checked" <c:if test="${ search_category eq '전체' }">checked="checked"</c:if>>전체</label>
		                      <label><input type="radio" class="form-check-input" name="search_category" value="입양" <c:if test="${ search_category eq '입양' }">checked="checked"</c:if>>입양</label>
		                      <label><input type="radio" class="form-check-input" name="search_category" value="입소" <c:if test="${ search_category eq '입소' }">checked="checked"</c:if>>입소</label>
		                      <label><input type="radio" class="form-check-input" name="search_category" value="후원" <c:if test="${ search_category eq '후원' }">checked="checked"</c:if>>후원</label>
		                      <label><input type="radio" class="form-check-input" name="search_category" value="기타" <c:if test="${ search_category eq '기타' }">checked="checked"</c:if>>기타</label>
                      	  </div>
                      </td>
                      <th>질문</th>
                      <td><input type="text" class="form-control" name="search_question" value="${ search_question }" /></td>
                      <th>답변</th>
                      <td><input type="text" class="form-control" name="search_answer" value="${ search_answer }" /></td>
                  </tr>                                                           
              </table>
		</div>
		<div class="search-buttons">
		<button class="btn btn-light" type="button" onclick="location.href='${ path }/admin_qna_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
		<button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
		</div>
	</div>
	</form>
        
     <%-- 정렬 --%>
    <div class="qna-section">
        <div class="row">
            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
                <select class="form-select form-select-sm order" name="order" onchange="location.href='${ path }/admin_fnq_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
                    <option selected="selected" value="no_desc" <c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호순</option>
                    <option value="question_desc" <c:if test="${ order eq 'question_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
           </div>
       </div>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list">
                <tr>                
                    <th class="table-light" width="10%">No</th>
                    <th class="table-light" width="10%">카테고리</th>
                    <th class="table-light" width="65%">질문</th>
                    <th class="table-light" width="15%">수정 / 삭제</th>
                </tr>
				<c:forEach items="${ fList }" var="list">
                <tr>
                    <td>${ list.fnq_no }</td>
                    <td>${ list.fnq_category }</td>
                    <td class="list-title"><a href="${ path }/admin_fnq_content?fnq_no=${ list.fnq_no }"><strong>Q. </strong>${ list.fnq_question }</a></td>
                    <td>
                    	<c:set value="${ path }/admin_fnq_delete?fnq_no=${ list.fnq_no }" var="deleteAddr" />
                        <button class="btn btn-outline-success btn-sm" onclick="location.href='${path}/admin_fnq_update?fnq_no=${ list.fnq_no }'">수정</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }" >삭제</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        
        <%-- 삭제 모달 --%>
		<jsp:include page="../../include/deleteModal.jsp" />
		
		<%-- 답변 등록하기 버튼 --%>		
		<div class="insert-form">
            <button class="btn btn-primary insertbtn mb-3" onclick="location.href='${path}/admin_fnq_insert'"><i class="bi bi-pencil-fill"></i> 등록</button>
        </div>
        
        <%-- 페이징처리 --%>
		<%@ include file="../../include/pagination_update.jsp" %>
		
    </div>
</body>
</html>