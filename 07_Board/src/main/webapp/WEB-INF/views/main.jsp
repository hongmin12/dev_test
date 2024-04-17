<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
<title>Home</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="blue">
			<h3>BOARD 테이블 메인 페이지</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<a href="<%=request.getContextPath() %>/board_list.go">[게시글 전체 목록]</a>
	</div>
	
</body>
</html>
