<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	
	<P> 인사말 : ${Greeting } </P>
	
	<a href="<%=request.getContextPath() %>/info">길 동</a>
	
	<a href="<%=request.getContextPath() %>/member">세 종</a>
</body>
</html>
