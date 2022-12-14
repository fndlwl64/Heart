<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${ fnqContent }" />

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


<%-- fnq insert --%>
<div class="container">

	<div class="sub-title"><h4>FNQ 수정하기</h4></div>
    
    <div>
        <form action="${path}/user_fnq_insert_ok" method="post" enctype="application/x-www-form-urlencoded">
        
        <table class="table noticeinfo mt-4">
            <tr class="border-top">
                <th class="table-light col-1">카테고리</th>
                <td class="col-3">
                    <select class="form-select" name="fnq_category">
                        <option value="입양" <c:if test="${ list.fnq_category eq '입양' }">selected="selected"</c:if>>입양</option>
                        <option value="입소" <c:if test="${ list.fnq_category eq '입소' }">selected="selected"</c:if>>입소</option>
                        <option value="후원" <c:if test="${ list.fnq_category eq '후원' }">selected="selected"</c:if>>후원</option>
                        <option value="기타" <c:if test="${ list.fnq_category eq '기타' }">selected="selected"</c:if>>기타</option>
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
                
        <%-- button  --%>
	    <div class="buttons">
            <button type="button" class="btn btn-secondary mx-1" onclick="location.href='${path}/admin_fnq_list'"><i class="bi bi-card-list"></i> 목록으로</button>
            <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 다시작성</button>
            <button type="submit" class="btn btn-dark mx-1"><i class="bi bi-save"></i> 수정하기</button>
		</div>
        </form>        
    </div>

    <div class="space-add"></div>

</div>
