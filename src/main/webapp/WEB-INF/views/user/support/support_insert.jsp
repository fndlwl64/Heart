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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<c:set var="dto" value="${uList }"/>
<script type="text/javascript">

	IMP.init("imp44175061");
	
	function requestPay() {
		  let amount2 = document.getElementById('support').value;
	      IMP.request_pay({ 
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: ${No}+3,//주문번호
	          name: "유기견 후원",
	          amount: amount2,// 숫자타입
	          buyer_email: "${dto.getUser_email()}",
	          buyer_name: "${dto.getUser_name()}",
	          buyer_tel: "${dto.getUser_phone()}"
	          /* buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181" */
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              alert('후원이 완료되었습니다.');
	              
	          } else {
	        	  alert('후원실패');
	          }
	      });
	    }
	
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }		  
		  return false;
		}
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
				<li class="support_li"><button>20000</button></li>
				<li class="support_li"><button>30000</button></li>
				<li class="support_li"><button>50000</button></li>
				<li class="support_li"><input id="support" type="text" placeholder="직접입력" onkeypress='return checkNumber(event)'></li>
			</ul>
		</div>
		<div>
			<ul>
				<li class="support_li"><button onclick="requestPay()">결제하기</button></li>
			</ul>
		</div>
	</div>

</body>
</html>