<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertForm</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="gray">
			<h3>개인 정보 입력 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/inputOk">
			<table border="1" width="350">
				<tr>
					<th>이 름</th>
					<td> <input name="name"> </td>
				</tr>
				
				<tr>
					<th>나 이</th>
					<td> <input name="age"> </td>
				</tr>
				
				<tr>
					<th>연락처</th>
					<td> <input name="phone"> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="전송">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
</body>
</html>