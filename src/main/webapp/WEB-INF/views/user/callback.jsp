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
<%
	/* //PrintWriter out = response.getWriter();
	String clientId = "fw7rzSQL46p95xisWWtm";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "icCg7tQOJD";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("/project/naver_logined", "UTF-8");
	String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
	    + "&client_id=" + clientId
	    + "&client_secret=" + clientSecret
	    + "&redirect_uri=" + redirectURI
	    + "&code=" + code
	    + "&state=" + state;
	String accessToken = "";
	String refresh_token = "";
	try {
	  URL url = new URL(apiURL);
	  HttpURLConnection con = (HttpURLConnection)url.openConnection();
	  con.setRequestMethod("GET");
	  int responseCode = con.getResponseCode();
	  BufferedReader br;
	  if (responseCode == 200) { // 정상 호출
	    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	  } else {  // 에러 발생
	    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	  }
	  String inputLine;
	  StringBuilder res = new StringBuilder();
	  while ((inputLine = br.readLine()) != null) {
	    res.append(inputLine);
	  }
	  br.close();
	  if (responseCode == 200) {
	    out.println(res.toString());
	  }
	} catch (Exception e) {
	  // Exception 로깅
	} */

%>
<script type="text/javascript">
	//접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	
	//네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	//네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	
	function naverSignInCallback() {
		console.log(naver_id_login.oauthParams.access_token);
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
		
		//location.href="project/naver_logined?id="+naver_id_login.getProfileData('email')+"&name="+naver_id_login.getProfileData('nickname');
		//opener.parent.location.reload();
		//window.close();
	}
</script>
</body>
</html>