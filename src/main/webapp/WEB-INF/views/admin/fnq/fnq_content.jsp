<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ fnqContent }"/>
<c:set value="${ path }/admin_fnq_delete?fnq_no=${ list.fnq_no }" var="deleteAddr" />
	
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FNQ</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <script src="${path}/resources/js/admin_list_view.js"></script>
</head>
<body>

<div class="container">

    <div class="sub-title"><h4>FNQ 상세 내용</h4></div>
    
    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">번호</th>
            <td class="col-3">${ list.fnq_no }</td>
            <th class="table-light col-1">분류</th>
            <td class="col-3">${ list.fnq_category }</td>
        </tr>
        <tr>
            <th class="table-light">문의</th>
            <td colspan="3" class="question col-5"><strong>Q. ${ list.fnq_question }</strong></td>
        </tr>
        <tr>
            <th class="table-light">답변</th>
            <td colspan="3" class="col-5">
            	<div class="answer"><strong>A.</strong></div>
                <textarea class="form-control-plaintext" cols="60" rows="10" readonly>${ list.fnq_answer.replace(newline, '<br/>').replace('<br/>', '') }</textarea>
            </td>
        </tr>
    </table>

    <%-- button  --%>
    <div class="buttons">
        <div>
	    <button class="btn btn-dark mx-1" onclick="location.href='${path}/admin_fnq_list'"><i class="bi bi-card-list"></i> 목록</button>
	    </div>
	    <div>
	    <button class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="${ deleteAddr }"><i class="bi bi-trash3"></i> 삭제</button>	    
	    <button class="btn btn-success mx-1" onclick="location.href='${path}/admin_fnq_update?fnq_no=${ list.fnq_no }'"><i class="bi bi-pencil-fill"></i> 수정</button>
	    </div>
	</div>
	
 	<%-- 삭제 모달 --%>
	<jsp:include page="../../include/deleteModal.jsp" />

</div>

</body>
</html>