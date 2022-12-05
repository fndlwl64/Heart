<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
      <button type="button" onclick="location.href='${pageContext.request.contextPath}/main'">더 보러가기</button>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
