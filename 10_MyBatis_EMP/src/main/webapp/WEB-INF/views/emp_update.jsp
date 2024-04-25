<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_modify</title>
</head>
<body>
	
	<div align="center">
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="gray">
			<h3>${cont.ename } 사원 정보 수정 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/emp_update_ok.go" 
			onsubmit="if(!confirm('정보를 수정하시겠습니까?')) {return;}">
			<table border="1" width="450" cell-spacing="0">
				<tr>
					<th>사원 No.</th>
					<td> <input name="empno" value="${cont.empno }" readonly> </td>
				</tr>
				
				<tr>
					<th>사원 이름</th>
					<td> <input name="ename" value="${cont.ename }" readonly> </td>
				</tr>
				
				<tr>
					<th>담당 업무</th>
					<td>
						<c:set var="jList" value="${Job }" />
						<select name="job">
							<c:forEach items="${jList }" var="jdto">
								<c:if test="${cont.job == jdto }">
									<option value="${jdto }" selected>${jdto }</option>
								</c:if>
								
								<c:if test="${cont.job != jdto }">
									<option value="${jdto }">${jdto }</option>
								</c:if>								
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
							<c:if test="${cont.mgr == mdto.empno }">
								<option value="${mdto.empno }" selected>${mdto.empno }[${mdto.ename }]</option>
							</c:if>
							
							<c:if test="${cont.mgr == mdto.empno }">
								<option value="${mdto.empno }">${mdto.empno }[${mdto.ename }]</option>
							</c:if>								
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>급여</th>
					<td> <input name="sal" value="${cont.sal }"> </td>
				</tr>
				
				<tr>
					<th>보너스</th>
					<td> <input name="comm" value="${cont.comm }"> </td>
				</tr>
				
				<tr>
					<th>부서 No.</th>
					<td><input name="deptno" value="${cont.deptno }" readonly></td>
				</tr>
				
				<tr>
					<th>사원 등록일</th>
					<td><input name="hiredate" value="${cont.hiredate.substring(0, 10) }" readonly></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="정보수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>