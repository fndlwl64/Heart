<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="include/user_header.jsp" />

<body>
<c:forEach var="dto" items="${list}">
    <p>${dto.toString()}</p>
</c:forEach>
</body>
</html>