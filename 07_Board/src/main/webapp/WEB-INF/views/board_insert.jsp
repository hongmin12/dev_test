<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_insert</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="blue">
			<h3>BOARD 게시판 글 등록 폼 페이지</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/board_insert_ok.go">
			<table border="1" width="550">
				<tr>
					<th>작성자</th>
					<td> <input name="board_writer"> </td>
				</tr>
				
				<tr>
					<th>글 제목</th>
					<td> <input name="board_title"> </td>
				</tr>
				
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="10" cols="25" style="resize: none;" name="board_cont"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>글 비밀번호</th>
					<td> <input type="password" name="board_pwd"> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>