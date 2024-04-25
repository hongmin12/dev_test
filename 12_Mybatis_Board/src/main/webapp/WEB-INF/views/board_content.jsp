<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_content</title>
</head>
<body>
	
	<div align="center">
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="green">
			<h3>${cont.board_title }</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<table border="1" width="400">
			<tr>
				<th>글 No.</th>
				<td> ${cont.board_no } </td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td> ${cont.board_writer } </td>
			</tr>
			
			<tr>
				<th>글 제목</th>
				<td> ${cont.board_title } </td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td> ${cont.board_hit } </td>
			</tr>
			
			<tr>
				<th>작성일</th>
				<td> ${cont.board_date.substring(0, 10) } </td>
			</tr>
			
			<tr>
				<th>마지막 수정일</th>
				<td> ${cont.board_update.substring(0, 10) } </td>
			</tr>
			
			<tr>
				<th>글 내용</th>
				<td>
					<textarea rows="7" cols="25" style="resize: none;">${cont.board_cont }</textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<c:forEach begin="1" end="${cont.board_pwd.length() }">
						*
					</c:forEach>
				</td>
			</tr>
		</table>
		<br> <br> <br>
		
		<input type="button" value="수정하기" 
			onclick="location.href='board_update.go?no=${cont.board_no }&page=${Page }'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="목록으로" 
			onclick="location.href='board_list.go?page=${Page}'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="삭제하기" onclick="if(delcheck()) {
										location.href='board_delete.go?no=${cont.board_no }&page=${Page }'
											}else {return; }">
	</div>

<script type="text/javascript">

	function delcheck() {
		let pwd = prompt("비밀번호를 입력해 주세요.");
		let db_pwd = ${cont.board_pwd };
		let conf = false;
		
		if(pwd == db_pwd) {
			if(confirm("정말로 삭제하시겠습니까?")) {
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