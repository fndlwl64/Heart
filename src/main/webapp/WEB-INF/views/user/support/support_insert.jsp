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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style> @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap'); </style>
<script type="text/javascript">
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }		  
		  return false;
	}
	IMP.init("imp44175061");
	function requestPay1() {
		  let amount2 = document.getElementById('support').value;
		  if ($('#support').val() == '') {
				alert("후원금액을 입력해주세요.");
				return false;
		  }else{
			  IMP.request_pay({ 
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: ${No}+1,//주문번호
		          name: "유기견 후원",
		          amount: amount2,// 숫자타입
		          buyer_email: "${dto.getUser_email()}",
		          buyer_name: "${dto.getUser_name()}",
		          buyer_tel: "${dto.getUser_phone()}"
		          /* buyer_addr: "서울특별시 강남구 신사동",
		          buyer_postcode: "01181" */
		      }, function (rsp) { // callback
		          if (rsp.success) {
		              $.ajax({
		            	  type: "Post",
		            	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
		            	  url: "/project/support_pay",
		            	  data: {
		                        paramAmount : amount2
		                  },
	                      dataType: "text",
	                      success: function(data) {
	                    	  alert("후원성공");
	                      },
	                      error: function(e) {
		                      console.log("후원에러", e);
		                  }
		              });
		              
		              opener.location.href="/project/user_support_finish?name=${dto.getUser_name()}&amount="+amount2;
		              window.close();
		          }else {
		        	  alert('후원실패');
		          }
		      });
		  }
	}
	
	function requestPay20000() {
		  IMP.request_pay({ 
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: ${No}+1,//주문번호
	          name: "유기견 후원",
	          amount: 20000,// 숫자타입
	          buyer_email: "${dto.getUser_email()}",
	          buyer_name: "${dto.getUser_name()}",
	          buyer_tel: "${dto.getUser_phone()}"
	          /* buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181" */
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              $.ajax({
	            	  type: "Post",
	            	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	            	  url: "/project/support_pay",
	            	  data: {
	                        paramAmount : amount2
	                  },
                    dataType: "text",
                    success: function(data) {
                  	  alert("후원성공");
                    },
                    error: function(e) {
	                      console.log("후원에러", e);
	                  }
	              });
	              opener.location.href="/project/user_support_finish?name=${dto.getUser_name()}&amount="+amount2;
	              window.close();
	          }else {
	        	  alert('후원실패');
	          }
	      });
	}

	function requestPay50000() {
		  IMP.request_pay({ 
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: ${No}+1,//주문번호
	        name: "유기견 후원",
	        amount: 50000,// 숫자타입
	        buyer_email: "${dto.getUser_email()}",
	        buyer_name: "${dto.getUser_name()}",
	        buyer_tel: "${dto.getUser_phone()}"
	        /* buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181" */
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            $.ajax({
	          	  type: "Post",
	          	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	          	  url: "/project/support_pay",
	          	  data: {
	                      paramAmount : amount2
	                },
	              dataType: "text",
	              success: function(data) {
	            	  alert("후원성공");
	              },
	              error: function(e) {
	                    console.log("후원에러", e);
	                }
	            });
	            opener.location.href="/project/user_support_finish?name=${dto.getUser_name()}&amount="+amount2;
	            window.close();
	        }else {
	      	  alert('후원실패');
	        }
	    });
	}
	
	function requestPay70000() {
		  IMP.request_pay({ 
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: ${No}+1,//주문번호
	        name: "유기견 후원",
	        amount: 70000,// 숫자타입
	        buyer_email: "${dto.getUser_email()}",
	        buyer_name: "${dto.getUser_name()}",
	        buyer_tel: "${dto.getUser_phone()}"
	        /* buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181" */
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            $.ajax({
	          	  type: "Post",
	          	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	          	  url: "/project/support_pay",
	          	  data: {
	                      paramAmount : amount2
	                },
	              dataType: "text",
	              success: function(data) {
	            	  alert("후원성공");
	              },
	              error: function(e) {
	                    console.log("후원에러", e);
	                }
	            });
	            opener.location.href="/project/user_support_finish?name=${dto.getUser_name()}&amount="+amount2;
	              window.close();
	        }else {
	      	  alert('후원실패');
	        }
	    });
	}
	
	function requestPay100000() {
		  IMP.request_pay({ 
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: ${No}+1,//주문번호
	        name: "유기견 후원",
	        amount: 100000,// 숫자타입
	        buyer_email: "${dto.getUser_email()}",
	        buyer_name: "${dto.getUser_name()}",
	        buyer_tel: "${dto.getUser_phone()}"
	        /* buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181" */
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            $.ajax({
	          	  type: "Post",
	          	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	          	  url: "/project/support_pay",
	          	  data: {
	                      paramAmount : amount2
	                },
	              dataType: "text",
	              success: function(data) {
	            	  alert("후원성공");
	              },
	              error: function(e) {
	                    console.log("후원에러", e);
	                }
	            });
	            opener.location.href="/project/user_support_finish?name=${dto.getUser_name()}&amount="+amount2;
	            window.close();
	        }else {
	      	  alert('후원실패');
	        }
	    });
	}
</script>
</head>
<body>
	<div class="div_sup_insert">
		<img class="sup_img" src="resources/image/support2.png">
		<div class="support-title">
			<h2>HeartPet을 후원해주세요</h2>
			<p>하트펫은 다양한 방법으로 유기동물을 후원하고 있습니다.</p>
			<p>하트펫과 함께 유기동물을 후원해주세요.</p>
			<h6><i class="bi bi-card-checklist"></i> 현재 진행 중인 캠페인 </h6>
			<ul>
				<li class="support_li">세계자연기금 후원(유기동물 캠페인)</li>
			</ul>
		</div>
		<div class="support-body">
			<div class="btn-group">
				<h6><i class="bi bi-piggy-bank"></i> 금액 선택하기</h6>
				<div class="btn-ul">
					<ul class="support_ul">
						<li class="support_li"><button class="btn btn-outline-success btn-sm" onclick="requestPay20000()">20,000 원</button></li>
						<li class="support_li"><button class="btn btn-outline-success btn-sm" onclick="requestPay50000()">50,000 원</button></li>
						<li class="support_li"><button class="btn btn-outline-success btn-sm" onclick="requestPay70000()">70,000 원</button></li>
						<li class="support_li"><button class="btn btn-outline-success btn-sm" onclick="requestPay100000()">100,000 원</button></li>
					</ul>
				</div>
			</div>
			<div class="btn-group">
				<h6><i class="bi bi-piggy-bank-fill"></i> 금액 입력하기</h6>
				<ul class="support_ul">
					<li class="support_li money-input"><input class="form-control form-control-sm" id="support" type="text" placeholder="Money" onkeypress='return checkNumber(event)'>&nbsp;원</li>
					<li class="support_li"><button class="btn btn-outline-success btn-sm" onclick="requestPay1()">후원하기</button></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>