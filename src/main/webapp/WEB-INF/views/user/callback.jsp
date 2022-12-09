<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

	console.log('callback.jsp 시작');
	//접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	
	//네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	//네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	
	function naverSignInCallback() {
		console.log(naver_id_login.oauthParams.access_token);
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		//alert(naver_id_login.getProfileData('age'));
		
		location.href="project/naver_logined?id="+naver_id_login.getProfileData('email')+"&name="+naver_id_login.getProfileData('nickname');
		opener.parent.location.reload();
		window.close();
	}
</script>
</body>
</html>