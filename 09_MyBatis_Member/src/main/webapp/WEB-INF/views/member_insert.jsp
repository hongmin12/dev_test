<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_insert</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="gray">
			<h3>MEMBER 테이블 회원 가입 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/member_insert_ok.go">
			<table border="1" width="350">
				<tr>
					<th>회원 아이디</th>
					<td> <input name="memid"> </td>
				</tr>
				
				<tr>
					<th>회원 이름</th>
					<td> <input name="memname"> </td>
				</tr>
				
				<tr>
					<th>회원 비밀번호</th>
					<td> <input type="password" name="mempwd"> </td>
				</tr>
				
				<tr>
					<th>회원 나이</th>
					<td> <input name="age"> </td>
				</tr>
				
				<tr>
					<th>회원 마일리지</th>
					<td> <input name="mileage"> </td>
				</tr>
				
				<tr>
					<th>회원 직업</th>
					<td> <input name="job"> </td>
				</tr>
				
				<tr>
					<th>회원 주소</th>
					<td> <input name="addr"> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" height="40">
						<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>