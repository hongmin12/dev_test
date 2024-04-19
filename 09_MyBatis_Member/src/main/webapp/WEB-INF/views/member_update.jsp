<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_update</title>
</head>
<body>
	
	<div align="center">
		<c:set var="dto" value="${Content }" />
		<hr width="30%" color="green">
			<h3>${dto.memname } 회원 상세 정보 페이지</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/member_update_ok.go"
			onsubmit="check()">
			
			<input type="hidden" name="memno" value="${dto.memno }">
			<table border="1" width="400">
				<tr>
					<th>회원 아이디</th>
					<td> <input name="memid" value="${dto.memid }" readonly> </td>
				</tr>
				
				<tr>
					<th>회원 이름</th>
					<td> <input name="memname" value="${dto.memname }" readonly> </td>
				</tr>
				
				<tr>
					<th>회원 나이</th>
					<td> <input name="age" value="${dto.age }"> </td>
				</tr>
				
				<tr>
					<th>회원 마일리지</th>
					<td> <input name="mileage" value="${dto.mileage }"> </td>
				</tr>
				
				<tr>
					<th>회원 직업</th>
					<td> <input name="job" value="${dto.job }"> </td>
				</tr>
				
				<tr>
					<th>회원 주소</th>
					<td> <input name="addr" value="${dto.addr }"> </td>
				</tr>

				<tr>
					<td colspan="2" align="center" height="40">
						<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">

		function check() {
			let db_pwd = ${dto.mempwd};
			let pwd = prompt("비밀번호를 입력해 주세요.");
			let conf = false;
			
			if(pwd == db_pwd) {
				conf = true;
			}else {
				alert("비밀번호가 틀립니다.");
			}
			
			return conf;
		}

	</script>
</body>
</html>