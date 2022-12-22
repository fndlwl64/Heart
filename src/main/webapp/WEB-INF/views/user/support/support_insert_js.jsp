<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		              opener.location.href="/project/user_support_finish";
		              window.close();
		          }else {
		        	  alert('후원실패');
		          }
		      });
		  }
	      
	    }
	
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
		        	  opener.location.href="/project/user_support_finish";
		              window.close();
		          } else {
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
		              opener.location.href="/project/user_support_finish";
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
	              opener.location.href="/project/user_support_finish";
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
	              opener.location.href="/project/user_support_finish";
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
	              opener.location.href="/project/user_support_finish";
	              window.close();
	          }else {
	        	  alert('후원실패');
	          }
	      });
  }
</script>
