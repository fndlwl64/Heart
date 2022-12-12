<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/support.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
/* let { IMP } = window;
IMP.init('imp44175061'); */

$("#btn_payment").click(function() {
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		
	  	IMP.init('imp44175061');
	  	//결제시 전달되는 정보
		  IMP.request_pay({ // param
		    pg: "html5_inicis",
		    pay_method: "card",
		    merchant_uid: "주문번호",
		    name: "상품명",
		    amount: 100,
		    buyer_tel: "휴대폰번호",
		    confirm_url : '실제 결제 시도 전 데이터 검증을 할 url'
		  },function (rsp) {
		    if (rsp.success) {
		        // 결제 성공 시 로직,
		        
		    }else{
		        // 결제 실패 시 로직,
		    }
		  });
</script>
</head>
<body>
	<div class="div_sup_insert">
		<div>
		<h2>후원정보</h2>
			<ul>
				<li class="support_li">모금상품</li>
				<li class="support_li">세계자연기금 후원(유기동물 캠페인)</li>
			</ul>
		</div>
		<div class="btn-group">
			<ul>
				<li class="support_li">후원금액</li>
				<li class="support_li"><input type="radio" name="radio" value="A">20000</li>
				<li class="support_li"><input type="radio" name="radio" value="B">30000</li>
				<li class="support_li"><input type="radio" name="radio" value="C">50000</li>
				<li class="support_li"><input type="text" placeholder="직접입력"></li>
			</ul>
		</div>
		<button id="btn_payment">후원하기</button>
	</div>
</body>
</html>