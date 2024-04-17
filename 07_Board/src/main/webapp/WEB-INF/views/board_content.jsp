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
		<c:set var="dto" value="${Content }" />
		<hr width="30%" color="blue">
			<h3>${dto.board_title }</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<table border="1" width="550">
			<tr>
				<th>작성자</th>
				<td> ${dto.board_writer } </td>
			</tr>
			
			<tr>
				<th>글 제목</th>
				<td> ${dto.board_title } </td>
			</tr>
			
			<tr>
				<th>글 작성일</th>
				<td> ${dto.board_date } </td>
			</tr>
			
			<tr>
				<th>최근 수정일</th>
				<c:if test="${dto.board_update == null }">
					<td> ${dto.board_date } </td>
				</c:if>
				
				<c:if test="${dto.board_update != null }">
					<td> ${dto.board_update } </td>
				</c:if>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td> ${dto.board_hit } </td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td> ${dto.board_cont } </td>
			</tr>
			
			<tr>
				<th>글 비밀번호</th>
				<td>
				<c:forEach begin="1" end="${dto.board_pwd.length() }">
				*
				</c:forEach>
				</td>
			</tr>
		</table>
		<br> <br>
		
		<input type="button" value="글 수정" onclick="location.href='board_update.go?no=${dto.board_no }'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="글 삭제" onclick="location.href='board_delete.go?no=${dto.board_no }'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="목록으로" onclick="location.href='board_list.go'">
	</div>
	
</body>
</html>