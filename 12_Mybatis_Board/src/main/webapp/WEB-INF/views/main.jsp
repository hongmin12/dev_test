<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="green">
			<h3>BOARD 테이블 메인 페이지</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<a href="<%=request.getContextPath() %>/board_list.go">[전체 게시글 목록]</a>
	</div>
	
</body>
</html>
