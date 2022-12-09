<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ fnqContent }" />
<c:set var="link_address" value="${pageContext.request.contextPath}/user_fnq_list" />

<jsp:include page="../../include/user_header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />

<%-- fnq list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">FAQ</div>
            <div class="col-3 space"></div>
        </div>
    </div>
    
    <div>
        <form action="${path}/user_fnq_update_ok" method="post" enctype="application/x-www-form-urlencoded">
        <table class="table align-middle">
            <tr class="border-top">
                <th class="table-light col-1">카테고리</th>
                <td class="col-3">
                    <select class="form-select" name="fnq_category">
                        <option value="입양" <c:if test="${ list.fnq_catergory eq '입양' }">selected="selected"</c:if>>입양</option>
                        <option value="입소" <c:if test="${ list.fnq_catergory eq '입소' }">selected="selected"</c:if>>입소</option>
                        <option value="후원" <c:if test="${ list.fnq_catergory eq '후원' }">selected="selected"</c:if>>후원</option>
                        <option value="기타" <c:if test="${ list.fnq_catergory eq '기타' }">selected="selected"</c:if>>기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="table-light">Question</th>
                <td colspan="4">
                	<input type="text" class="form-control" name="fnq_question" value="${ list.fnq_question }" required="required">
                </td>
            </tr>
            <tr>
                <th class="table-light">Answer</th>
                <td colspan="4">
                	<textarea class="form-control" name="fnq_answer" cols="30" rows="10" >${ list.fnq_answer }</textarea>
                </td>
            </tr>
        </table>
        <div class="qna-section">
            <div class="row">
                <div class="col-3 space"></div>
                <div class="col-6 title btn-insert">
                    <button type="reset" class="btn btn-warning"><i class="bi bi-pencil"></i> 다시작성</button>
                    <button type="submit" class="btn btn-dark"><i class="bi bi-save"></i> 등록하기</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${path}/user_fnq_list'"><i class="bi bi-card-list"></i> 목록으로</button>
                </div>
                <div class="col-3 space"></div>
            </div>
        </div>
        </form>
    </div>

    <div class="space-add"></div>

</div>

<jsp:include page="../../include/user_footer.jsp" />