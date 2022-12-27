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
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<link rel="stylesheet" href="${path}/resources/css/support.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
	
	function ajax() {
		let email2 = document.getElementById('sup_email').value;
		let code_check = document.getElementById('code_check').value;
		if ($('#sup_name').val() == '') {
			alert("이름을 입력해주세요");
			return false;
	  	}else if ($('#sup_phone').val() == ''){
	  		alert("핸드폰번호를 입력해주세요");
			return false;
	  	}else if ($('#sup_email').val() == ''){
	  		alert("이메일을 입력해주세요");
			return false;
	  	}else {
	  		$.ajax({
	        	  type: "Post",
	        	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	        	  url: "/project/support_emailcheck",
	        	  data: {
	                    paramEmail : email2,
	                    paramCode_check : code_check,
	              },
	              dataType: "text",
	              success: function(data) {
	            	  alert("이메일전송완료");
	              },
	              error: function(e) {
	                  console.log("후원에러", e);
	              }
	          });
	  	}
	}
/* 	function makeReal(){
		var abc = document.getElementById('abc');
		abc.disabled=true;
		
	} */
	
	function checkCode(){
		  let v1 = document.getElementById('code_check').value;
		  let v2 = document.getElementById('code').value;
		  if(v1!=v2){
			   document.getElementById('checkCode').style.color = "red";
			   document.getElementById('checkCode').innerHTML = "잘못된인증번호";
		  }else{
			   document.getElementById('checkCode').style.color = "blue";
			   document.getElementById('checkCode').innerHTML = "인증되었습니다.";
			   let abc = document.getElementById('abc');
			   abc.disabled=false;
			   /* makeReal(); */
		  }
	}

  	IMP.init("imp44175061");
  	
  	function requestPay2() {
		  let name2 = document.getElementById('sup_name').value;
		  let phone2 = document.getElementById('sup_phone').value;
		  let email2 = document.getElementById('sup_email').value;
		  let amount2 = document.getElementById('support').value;
		  if ($('#support').val() == '') {
				alert("후원금액을 입력해주세요");
				return false;
		  }else{
			  IMP.request_pay({ 
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: ${No}+1,//주문번호
		          name: "유기견 후원",
		          amount: amount2,// 숫자타입
		          buyer_email: email2,
		          buyer_name: name2,
		          buyer_tel: phone2
		          /* buyer_addr: "서울특별시 강남구 신사동",
		          buyer_postcode: "01181" */
		      }, function (rsp) { // callback
		          if (rsp.success) {
		        	  $.ajax({
		            	  type: "Post",
		            	  contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
		            	  url: "/project/support_pay2",
		            	  data: {
		                        paramName : name2,
		                        paramPhone : phone2,
		                        paramEmail : email2,
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
		        	  opener.location.href="/project/user_support_finish?name="+name2+"&amount="+amount2;
		              window.close();
		              
		          } else {
		        	  alert('후원실패');
		          }
		      });
		  }
		  
	 }
</script>
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
			<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
			<table class="sup_table">
				<tr>
					<th width="20%">이름</th>
					<td width="30%"><input class="form-control" id="sup_name" type="text" placeholder="Name"></td>
					<td colspan="2"></td>
				</tr>
				<tr>					
					<th width="12.5%">전화번호</th>
					<td colspan="2" width="37.5%"><input class="form-control" id="sup_phone" type="text" placeholder="010-0000-0000"></td>
					<td></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2"><input class="form-control" id="sup_email" name="receiver" type="text" placeholder="E-mail"></td>
					<td><button class="btn btn-outline-success btn-sm" onclick="ajax()">인증하기</button></td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td><input class="form-control" type="text" id="code" name="code" onkeyup="checkCode()" placeholder="Enter the code"/></td>
					<td colspan="2"><div id="checkCode"></div></td>
				</tr>
				<tr>
					<th>후원금액</th>
					<td>
						<input class="form-control" id="support" type="text" placeholder="Money" onkeypress='return checkNumber(event)'>
						<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>" />
					</td>
<!-- 					<td><input class="btn btn-outline-success" id="hiddenbutton" type="hidden" value='후원하기' onclick="requestPay2()"/></td> -->
					<td width="20%"><button class="btn btn-outline-success btn-sm" id="abc" onclick="requestPay2()" disabled> 후원하기</button></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>