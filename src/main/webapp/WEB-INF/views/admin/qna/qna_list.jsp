<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="qList" value="${ qnaList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="field" value="${ field }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="cList" value="${ commentList }"/>
<c:set var="url" value="&field=${ field }&keyword=${ keyword }&order=${ order }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/admin_qna_list" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />	

<!-- modal delete Function 추가 시 data-id 검색 -> 주소값만 수정하세요....
+ admin_list_view.js include 하기 -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_QNA</title>
    <jsp:include page="../../include/admin_header.jsp" />
	<link rel="stylesheet" href="${path}/resources/css/list_view.css" />
	<script src="${path}/resources/js/admin_list_view.js"></script>

</head>
<body>
    <div class="container">

    <%-- 검색 폼 --%>
	<form action="${path}/admin_qna_list" class="search_form" method="get">
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
                      <th width="12.5%">작성기간</th>
                      <td width="37.5%">
                      	  <div class="search-date">
		                      <input type="date" class="form-control search-date-picker" name="search_date_start" value="${ search_date_start }">
		                      <input type="date" class="form-control search-date-picker" name="search_date_end" value="${ search_date_end }">
                          </div>
                      </td>
				  </tr>
				  <tr>
                      <th>작성자 아이디</th>
                      <td><input type="text" class="form-control" name="search_id" value="${ search_id }" /></td>
                      <th>문의글</th>
                      <td><input type="text" class="form-control" name="search_content" value="${ search_content }" /></td>
                  </tr>                                                           
              </table>
		</div>
		<div class="search-buttons">
		<button class="btn btn-light" type="button" onclick="location.href='${ path }/admin_review_list'"><i class="bi bi-arrow-counterclockwise"></i> 리셋</button>
		<button type="submit" class="btn btn-dark"><i class="bi bi-search"></i> 검색</button>            
		</div>
	</div>
	</form>
        
       <%-- 정렬 & 게시물 수 --%>
    <div class="qna-section">
       <div class="row">
            <div class="col total-data"><span>총 <fmt:formatNumber value="${ total }" /> 개의 게시물</span>
                <select class="form-select form-select-sm order" name="order" onchange="location.href='${ path }/user_qna_list?page=${ paging.page }&field=${ field }&keyword=${ keyword }&order='+this.value;">
                    <option selected="selected" value="no_desc"<c:if test="${ order eq 'no_desc' }">selected="selected"</c:if>>번호높은순</option>
                    <option value="date_desc"<c:if test="${ order eq 'date_desc' }">selected="selected"</c:if>>최신등록순</option>
                    <option value="hit_desc"<c:if test="${ order eq 'hit_desc' }">selected="selected"</c:if>>인기순</option>
                    <option value="title_desc"<c:if test="${ order eq 'title_desc' }">selected="selected"</c:if>>가나다순</option>
                </select>
            </div>
        </div>
    </div>
        
        <%-- 검색 결과 테이블 --%>
        <div class="lists">
            <table class="table table-hover searched_list mb-4">
                <tr>                
                    <th class="table-light" width="7.5%">No</th>
                    <th class="table-light" width="7.7%">카테고리</th>
                    <th class="table-light" width="45%">제목</th>
                    <th class="table-light" width="7.5%">작성자</th>
                    <th class="table-light" width="7.5%">조회수</th>
                    <th class="table-light" width="12.5%">작성일시</th>
                    <th class="table-light" width="12.5%">답변 / 삭제</th>
                </tr>
				<c:forEach items="${ qList }" var="list" varStatus="status">
                <tr>
                    <td>${ list.board_no }</td>
                    <td>${ list.board_category }</td>
                    <td class="list-title">
                        <a href="${ path }/admin_qna_content?board_no=${ list.board_no }&board_group=${ list.board_group }">
		                    <c:choose>
		                    	<c:when test="${ list.level > 1 }">
		                    		<c:forEach begin="1" end="${ list.level-1 }" step="1">
		                    		<span style="padding-left:20px"></span>	                    		
		                    		</c:forEach>
		                    		<span class="badge rounded-pill text-bg-light"><i class="bi bi-arrow-return-right"></i> Re</span>
		                    	</c:when>
			                </c:choose>
		                    <c:if test="${ list.board_title.length() gt 30 }">${ list.board_title.substring(0,30) }...</c:if>
							<c:if test="${ list.board_title.length() lt 30 }">${ list.board_title }</c:if>
		                    <c:if test="${ list.board_secret eq 'Y' }"><i class="bi bi-lock-fill"></i></c:if>
		                    <c:if test="${ not empty list.board_update }"><small>(edited)</small></c:if>
		                    <c:if test="${ list.board_regdate.substring(0,10) eq today }"><span class="badge rounded-pill text-bg-warning">N</span></c:if>
		                    <c:if test="${ cList[status.index] gt 0 }"><span class="comment-count">[${ cList[status.index] }]</span></c:if>
                        </a>
                    </td>
                    <td><c:if test="${ list.board_id eq 'admin' }"><span id="admin_id">관리자</span></c:if>
                    <c:if test="${ list.board_id ne 'admin' }"><span>${ list.board_id }</span></c:if></td>
                    <td>${ list.board_hit }</td>
                    <td><small>${ list.board_regdate.substring(0,10) }</small></td>
                    <td>
                    	<c:set var="deleteAddr" value="${ path }/admin_qna_delete?board_no=${ list.board_no }"/>
                    	<c:if test="${ list.board_state eq 'abled' }">
                        <button class="btn btn-outline-primary btn-sm" onclick="location.href='${path}/admin_qna_reply_insert?board_parentNo=${ list.board_no }&board_group=${ list.board_group }'">답변</button>
                        <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }">삭제</button>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>

		<jsp:include page="../../include/deleteModal.jsp" />
        
        <%-- 페이징처리 --%>
		<%@ include file="../../include/pagination_update.jsp" %>
		
    </div>
</body>
</html>