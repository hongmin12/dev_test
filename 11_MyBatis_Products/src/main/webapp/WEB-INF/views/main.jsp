<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
<title>main</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="green">
			<h3>PRODUCTS 테이블 메인 페이지</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<a href="<%=request.getContextPath() %>/products_list.go">[전체 제품 리스트]</a>
	</div>
	
</body>
</html>
