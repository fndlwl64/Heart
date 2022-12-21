<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<link rel="stylesheet" href="${path}/resources/css/support.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<jsp:include page="support_insert_js.jsp" />
</head>
<!-- 랜덤으로 임의의 숫자 ６자리르 생성 （이메일 보내는 내용에 들어갈 숫자） -->
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
	} 
%>
<body>
	<div class="div_sup_insert" align="center">
		<img class="sup_img" src="resources/image/support2.png">
		<br><br><br><br>
		<div>
		<h2>후원정보 및 금액</h2>
			<ul>
				<li class="support_li">모금상품</li>
				<li class="support_li">세계자연기금 후원(유기동물 캠페인)</li>
			</ul>
		</div>
		<div>
			<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
			<table class="sup_table">
				<tr>
					<td><input class="form-control" id="sup_name" type="text" placeholder="이름"></td>
					<td><input class="form-control" id="sup_phone" type="text" placeholder="010-0000-0000"></td>
				</tr>
				<tr>
					<td><input class="form-control" id="sup_email" name="receiver" type="text" placeholder="이메일입력"></td>
					<td><button class="btn btn-outline-success" onclick="ajax()">이메일인증</button></td>
				</tr>
				<tr>
					<td><input class="form-control" type="text" id="code" name="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/></td>
					<td><div id="checkCode"></div></td>
				</tr>
				<tr>
					<td>
						<input class="form-control" id="support" type="text" placeholder="후원금액입력" onkeypress='return checkNumber(event)'>
						<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>" />
					</td>
					<td><input class="btn btn-outline-success" id="hiddenbutton" type="hidden" value='후원하기' onclick="requestPay2()"/></td>
				</tr>
			</table>
		</div>
		
	</div>

</body>
</html>