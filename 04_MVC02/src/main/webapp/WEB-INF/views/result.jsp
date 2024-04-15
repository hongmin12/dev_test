<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="gray">
			<h3>개인 정보 내역 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<table border="1" width="350" cell-spacing="0">
			<tr>
				<th>이 름</th> <th>나 이</th> <th>연락처</th>
			</tr>
			
			<tr>
				<td> ${NAME } </td>
				<td> ${AGE } </td>
				<td> ${PHONE } </td>
			</tr>
		</table>
	</div>
	
</body>
</html>