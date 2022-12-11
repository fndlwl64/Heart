<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">

	console.log('callback.jsp 시작');
	var naver_id_login = new naver_id_login("fw7rzSQL46p95xisWWtm", "http://localhost:8081/project/naver_login");
	//접근 토큰 값 출력
	//alert(naver_id_login.oauthParams.access_token);
	console.log(naver_id_login.oauthParams.access_token);
	
	//네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	//네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		
		var id = naver_id_login.getProfileData('id').substr(0,9);
		var email = naver_id_login.getProfileData('email');
		var name = naver_id_login.getProfileData('nickname');
		
		if(name === 'undefined') {
			name = "네이버계정";
		}
		
		//alert(id+"/"+email+"/"+name);
		console.log(id+"/"+email+"/"+name);
		
		location.href="/project/naver_logined?id="+id+"&name="+name+"&email="+email;
		opener.parent.location.reload();
		window.close();
		console.log(id+"/"+email+"/"+name);
		
	}
</script>
</body>
</html>