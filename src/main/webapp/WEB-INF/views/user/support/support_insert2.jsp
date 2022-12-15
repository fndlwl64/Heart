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
		  let name2 = document.getElementById('sup_name').value;
		  let phone2 = document.getElementById('sup_phone').value;
		  let email2 = document.getElementById('sup_email').value;
		  let amount2 = document.getElementById('support').value;
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
	              opener.location.reload();
	              window.close();
	          } else {
	        	  alert('후원실패');
	          }
	      });
	    }
	
	function ajax() {
		let email2 = document.getElementById('sup_email').value;
		let code_check = document.getElementById('code_check').value;
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
	
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }		  
		  return false;
		}
	
	function checkCode(){
		  let v1 = document.getElementById('code_check').value;
		  let v2 = document.getElementById('code').value;
		  if(v1!=v2){
			   document.getElementById('checkCode').style.color = "red";
			   document.getElementById('checkCode').innerHTML = "잘못된인증번호";
             makeNull();
		  }else{
			   document.getElementById('checkCode').style.color = "blue";
			   document.getElementById('checkCode').innerHTML = "인증되었습니다."; 
			   makeReal();
		  }
		 }
	function makeReal(){
		var hiddenbutton = document.getElementById("hiddenbutton");
		hiddenbutton.type="submit";
	}
    function makeNull(){
		var hiddenbutton = document.getElementById("hiddenbutton");
		hiddenbutton.type="hidden";
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
	<div class="div_sup_insert">
		<div>
		<h2>후원정보</h2>
			<ul>
				<li class="support_li">모금상품</li>
				<li class="support_li">세계자연기금 후원(유기동물 캠페인)</li>
			</ul>
		</div>
		<div>
			<ul>
				<li class="support_li"><input id="sup_name" type="text" placeholder="이름"></li>
				<li class="support_li"><input id="sup_phone" type="text" placeholder="010-0000-0000"></li>
			</ul>
		</div>
		<%-- <form method="post" action="<%= request.getContextPath() %>/support_emailcheck"> --%>
			<div class="btn-group">
				<ul>
					<li class="support_li"><input id="sup_email" name="receiver" type="text" placeholder="이메일입력"></li>
					<li class="support_li"><input type="button" value="이메일인증" onclick="ajax()"></li>				
				</ul>
			</div>
			<div>
				<ul>
					<li class="support_li">
					<!-- <input id="sup_emailcheck" type="text" placeholder="인증번호"> -->
					<input type="text" id="code" name="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/><br>
		    		<div id="checkCode"></div>
		    		</li>
				</ul>
			</div>
			<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
		<!-- </form> -->
		<div>
			<ul>
				<li class="support_li"><input id="support" type="text" placeholder="후원금액입력" onkeypress='return checkNumber(event)'></li>
				<li class="support_li">
					<!-- <input type="button" onclick="requestPay()" value="후원하기"> -->
					<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>" />
		    		<input id="hiddenbutton" type="hidden" value='후원하기' onclick="requestPay()"/>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>