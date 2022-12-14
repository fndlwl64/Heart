<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ fnqContent }"/>
<% pageContext.setAttribute("newline", "\n"); %>
	
<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FNQ</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">

    <div class="sub-title"><h4>문의글 상세 내용</h4></div>
    
    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">번호</th>
            <td class="col-2">${ list.fnq_no }</td>
            <th class="table-light col-1">분류</th>
            <td class="col-2">${ list.fnq_category }</td>
        </tr>
        <tr>
            <th class="table-light">문의</th>
            <td colspan="3" class="question col-5"><strong>Q. ${ list.fnq_question }</strong></td>
        </tr>
        <tr>
            <th class="table-light">답변</th>
            <td colspan="3" class="col-5">
            	<div class="answer"><strong>A.</strong></div>
                <textarea class="form-control-plaintext px-3" cols="60" rows="10" readonly>${ list.fnq_answer.replace(newline, '<br/>') }</textarea>
            </td>
        </tr>
    </table>

    <%-- button  --%>
    <div class="buttons">
	    <button class="btn btn-dark mx-1" onclick="location.href='${path}/admin_fnq_list'"><i class="bi bi-card-list"></i> 목록으로</button>
	    <button class="btn btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-trash3"></i> 삭제하기</button>
	    <button class="btn btn-primary mx-1" onclick="location.href='${path}/admin_fnq_update?fnq_no=${ list.fnq_no }'"><i class="bi bi-pencil-fill"></i> 수정하기</button>
	</div>
	
	  <%-- 삭제 모달 // admin_list_view.js 삽입되어 있음
	 	modal-dialog-centered 삽입됨
	  --%>
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div id="myInput" class="modal-dialog modal-dialog-centered">
             <div class="modal-content">
                 <div class="modal-header">
                     <h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body">
                     해당 데이터를 삭제하시겠습니까?
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-danger" onclick="location.href='${path}/admin_fnq_delete?fnq_no=${ list.fnq_no }'">삭제</button>
                 </div>
             </div>
         </div>
     </div>
	
	<div class="space"></div>
</div>


</body>
</html>