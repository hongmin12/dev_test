<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	
	<a href="<%=request.getContextPath() %>/input">개인정보 입력</a>

	<a href="<%=request.getContextPath() %>/login">로그인</a>
</body>
</html>
