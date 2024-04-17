<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_delete</title>
</head>
<body>
	
	<div align="center">
		<c:set var="dto" value="${Content }" />
		<hr width="30%" color="blue">
			<h3>비밀번호 입력</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/board_delete_ok.go?no=${dto.board_no }">
			
			<table border="1" width="550">
				<tr>
					<th>글 비밀번호</th>
					<td> <input type="password" name="board_pwd"> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>