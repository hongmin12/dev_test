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
		<hr width="30%" color="gray">
			<h3>MEMBER 테이블 전체 리스트 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<c:set var="list" value="${List }" />
		<table border="1" width="450">
			<tr>
				<th>회원 No.</th> <th>회원 이름</th>
				<th>회원 직업</th> <th>회원 가입일</th> 
			</tr>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>회원이 없습니다.....</h3>
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
		
		<input type="button" value="회원등록" onclick="location.href='member_insert.go'">
		<br> <br>
		
		<%-- 검색 폼 영역 --%>
		<form method="post" action="<%=request.getContextPath() %>/member_search.go">
			<select name="field">
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="job">직업</option>
				<option value="addr">주소</option>
			</select>
			
			<input name="keyword">&nbsp;&nbsp;&nbsp;
			<input type="submit" value="검색">
			 
		</form>
	</div>
	
</body>
</html>