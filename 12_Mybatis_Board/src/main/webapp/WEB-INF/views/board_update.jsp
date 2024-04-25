<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_update</title>
</head>
<body>
	
	<div align="center">
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="skyblue">
			<h3>${cont.board_title } 게시글 수정 폼 페이지</h3>
		<hr width="30%" color="skyblue">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/board_update_ok.go"
			onsubmit="return check()">
			
			<input type="hidden" name="page" value="${Page }">
			
			<input type="hidden" name="board_no" value="${cont.board_no }">
			<table border="1" width="350">
				<tr>
					<th>작성자</th>
					<td> <input name="board_writer" value="${cont.board_writer }" readonly> </td>
				</tr>
				
				<tr>
					<th>글제목</th>
					<td> <input name="board_title" value="${cont.board_title }"> </td>
				</tr>
				
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="7" cols="25" name="board_cont" 
							style="resize: none;">${cont.board_cont }</textarea>
					</td>
				</tr>
			</table>
			<br> <br>
			
			<input type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
	</div>
	
	<script type="text/javascript">
	
		function check() {

			let pwd = prompt("비밀번호를 입력해 주세요.");
			let db_pwd = ${cont.board_pwd };
			let conf = false;
			
			if(pwd == db_pwd) {
				if(confirm("정말로 수정하시겠습니까?")) {
					conf = true;
				}
			}else {
				alert("비밀번호를 확인해 주세요.");
			}
			
			return conf;
		}
	
	</script>
	
</body>
</html>