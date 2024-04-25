<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="marmoon">
			<h3>EMP 테이블 전체 사원 목록 페이지</h3>
		<hr width="30%" color="marmoon">
		<br> <br>
		
		<table border="1" width="400">
			<tr>
				<th>사원 No.</th> <th>사원 이름</th>
				<th>담당 업무</th> <th>입사 일자</th>
			</tr>
			
			<c:set var="list" value="${EmpList }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.empno } </td>
						<td>
							<a href="<%=request.getContextPath() %>/emp_content.go?no=${dto.empno }">
								${dto.ename }
							</a>
						</td>
						<td> ${dto.job } </td>
						<td> ${dto.hiredate.substring(0, 10) } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 사원 목록이 없습니다.....</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>
		
		<input type="button" value="사원등록" onclick="location.href='emp_insert.go'">
	</div>
	
</body>
</html>