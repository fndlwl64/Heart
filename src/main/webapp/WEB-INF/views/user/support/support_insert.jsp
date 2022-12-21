<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<c:set var="dto" value="${uList }"/>
<jsp:include page="support_insert_js.jsp" />
</head>
<body>
	<div class="div_sup_insert">
		<img class="sup_img" src="resources/image/support2.png">
		<div align="center">
		<br><br><br><br>
		<h2>후원금액</h2>
			<ul>
				<li class="support_li">모금상품</li>
				<li class="support_li">세계자연기금 후원(유기동물 캠페인)</li>
			</ul>
		</div>
		<div class="btn-group" align="center">
			<ul class="support_ul">
				<li class="support_li"><button class="btn btn-outline-success" onclick="requestPay20000()">20,000</button></li>
				<li class="support_li"><button class="btn btn-outline-success" onclick="requestPay50000()">50,000</button></li>
				<li class="support_li"><button class="btn btn-outline-success" onclick="requestPay70000()">70,000</button></li>
				<li class="support_li"><button class="btn btn-outline-success" onclick="requestPay100000()">100,000</button></li>
			</ul>
		</div>
		<div class="btn-group" align="center">
			<ul class="support_ul">
				<li class="support_li"><input class="form-control" id="support" type="text" placeholder="후원금액입력" onkeypress='return checkNumber(event)'></li>
				<li class="support_li"><button class="btn btn-outline-success" onclick="requestPay1()">후원하기</button></li>
			</ul>
		</div>
	</div>
</body>
</html>