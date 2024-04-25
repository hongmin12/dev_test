<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_insert</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="gray">
			<h3>EMP 테이블 사원 등록 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/emp_insert_ok.go">
			<table border="1" width="450" cell-spacing="0">
				<tr>
					<th>사원 No.</th>
					<td> <input name="empno"> </td>
				</tr>
				
				<tr>
					<th>사원 이름</th>
					<td> <input name="ename"> </td>
				</tr>
				
				<tr>
					<th>담당 업무</th>
					<td>
						<c:set var="jList" value="${Job }" />
						<select name="job">
							<c:forEach items="${jList }" var="jdto">
								<option value="${jdto }">${jdto }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>담당 매니저</th>
					<td>
						<c:set var="mList" value="${Mgr }" />
						<select name="mgr">
							<c:forEach items="${mList }" var="mdto">
								<option value="${mdto.empno }">${mdto.empno }[${mdto.ename }]</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>급여</th>
					<td> <input name="sal"> </td>
				</tr>
				
				<tr>
					<th>보너스</th>
					<td> <input id="comm" name="comm"> </td>
				</tr>
				<tr>
					<th>부서 No.</th>
					<td>
						<c:set var="dList" value="${Dept }" />
						<select name="deptno">
							<c:forEach items="${dList }" var="dto">
								<option value="${dto.deptno }">${dto.deptno }[${dto.dname }]</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="사원등록">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>