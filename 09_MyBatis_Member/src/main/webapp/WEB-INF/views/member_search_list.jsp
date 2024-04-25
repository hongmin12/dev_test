<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_search_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="green">
			<h3>[${key }] 에 대한 검색 결과</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<c:set var="list" value="${Search }" />
		<table border="1" width="450">
			<tr>
				<td colspan="4" align="right">
					총 ${list.size() } 개의 검색결과
				</td>
			</tr>
			
			<tr>
				<th>회원 No.</th> <th>회원 이름</th>
				<th>회원 직업</th> <th>회원 가입일</th> 
			</tr>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>검색결과가 없습니다.....</h3>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.memno } </td>
						<td>
							<a href="<%=request.getContextPath() %>/member_content.go?num=${dto.memno }">
								${dto.memname }
							</a>
						</td>
						<td> ${dto.job } </td>
						<td> ${dto.regdate.substring(0, 10) } </td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br> <br>
		
		<input type="button" value="목록으로" onclick="location.href='member_list.go'">
	</div>
	
</body>
</html>