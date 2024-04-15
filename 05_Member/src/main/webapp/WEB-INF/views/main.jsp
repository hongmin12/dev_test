<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
<title>main</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="gray">
			<h3>MEMBER 테이블 메인 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<a href="<%=request.getContextPath() %>/member_list.go">[회원 전체 목록]</a>
	</div>
	
</body>
</html>
