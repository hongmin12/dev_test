<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="red">
			<h3>MEMBER 테이블 회원 전체 리스트 페이지</h3>
		<hr width="30%" color="red">
		<br> <br>
		
		<table border="1" width="450">
			<tr>
				<th>회원 No.</th> <th>회원 이름</th>
				<th>회원 직업</th> <th>회원 가입일</th>
			</tr>
			
			<c:set var="list" value="${MemberList }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.getMemno() } </td>
						<td> ${dto.getMemname() } </td>
						<td> ${dto.getJob() } </td>
						<td> ${dto.getRegdate().substring(0, 10) } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<td colspan="4" align="center">
					<h3>전체 회원 리스트가 없습니다.....</h3>
				</td>
			</c:if>
		</table>
	</div>
	
</body>
</html>