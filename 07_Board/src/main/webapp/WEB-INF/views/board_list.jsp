<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="blue">
			<h3>BOARD 테이블 게시글 전체 목록</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<table border="1" width="650">
			<tr>
				<th>게시글 No.</th> <th>작성자</th> <th>게시글 제목</th>
				<th>조회수</th> <th>작성일자</th>
			</tr>
			
			<c:set var="list" value="${List }" />
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">
						<h3>게시글 목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.board_no } </td>
						<td> ${dto.board_writer } </td>
						<td> <a href="<%=request.getContextPath() %>/board_content.go?no=${dto.board_no }">
							${dto.board_title }</a> </td>
						<td> ${dto.board_hit } </td>
						<td> ${dto.board_date.substring(0, 10) }
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br> <br>
		
		<input type="button" value="글쓰기" onclick="location.href='board_insert.go'">
	</div>
	
</body>
</html>