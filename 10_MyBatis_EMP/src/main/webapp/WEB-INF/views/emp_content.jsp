<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_content</title>
</head>
<body>
	
	<div align="center">
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="gray">
			<h3>${cont.ename } 사원 상세정보 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<table border="1" width="450" cell-spacing="0">
			<tr>
				<th>사원 No.</th>
				<td> ${cont.empno } </td>
			</tr>
			
			<tr>
				<th>사원 이름</th>
				<td> ${cont.ename } </td>
			</tr>
			
			<tr>
				<th>담당 업무</th>
				<td> ${cont.job } </td>
			</tr>
			
			<tr>
				<th>담당 매니저 No.</th>
				<td> ${cont.mgr } </td>
			</tr>
			
			<tr>
				<th>급여</th>
				<td>
					<fmt:formatNumber value="${cont.sal }" />
				</td>
			</tr>
			
			<tr>
				<th>보너스</th>
				<td>
					<fmt:formatNumber value="${cont.comm }" />
				</td>
			</tr>
			
			<tr>
				<th>부서 No.</th>
				<td> ${cont.deptno } </td>
			</tr>
			
			<tr>
				<th>입사일</th>
				<td> ${cont.hiredate.substring(0, 10) } </td>
			</tr>
		</table>
		<br> <br>
		
		<input type="button" value="정보수정" onclick="location.href='emp_update.go?no=${cont.empno}'">&nbsp;&nbsp;
		<input type="button" value="목록으로" onclick="location.href='emp_list.go'">&nbsp;&nbsp;
		<input type="button" value="사원삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {
														location.href='emp_delete.go?no=${cont.empno}'
													}else {return; }">
	</div>
	
</body>
</html>