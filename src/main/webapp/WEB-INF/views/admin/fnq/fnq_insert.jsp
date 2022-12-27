<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="../../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet_Admin_FAQ</title>
    <link rel="stylesheet" href="${path}/resources/css/list_view.css">
</head>
<body>


<%-- fnq insert --%>
<div class="container">
	<div class="sub-title"><h4>FAQ 등록하기</h4></div>    
    <div>
        <form action="${path}/admin_fnq_insert_ok" method="post" enctype="application/x-www-form-urlencoded">
        <table class="table noticeinfo mt-4">
            <tr class="border-top">
                <th class="table-light col-1">카테고리</th>
                <td class="col-5">
                    <select class="form-select" name="fnq_category">
                        <option value="입양" selected="selected">입양</option>
                        <option value="입소">입소</option>
                        <option value="후원">후원</option>
                        <option value="기타">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="table-light">Question</th>
                <td colspan="4">
                	<input type="text" class="form-control" name="fnq_question" required="required">
                </td>
            </tr>
            <tr>
                <th class="table-light">Answer</th>
                <td colspan="4">
                	<textarea class="form-control" name="fnq_answer" cols="30" rows="10" ></textarea>
                </td>
            </tr>
        </table>
                
        <%-- button  --%>
	    <div class="buttons">
            <div>
                <button type="button" class="btn btn-dark mx-1" onclick="location.href='${path}/admin_fnq_list'"><i class="bi bi-card-list"></i> 목록</button>
            </div>
            <div>
	            <button type="reset" class="btn btn-warning mx-1"><i class="bi bi-pencil"></i> 리셋</button>
	            <button type="submit" class="btn btn-primary mx-1"><i class="bi bi-save"></i> 등록</button>
            </div>
		</div>
        </form>        
    </div>

</div>
