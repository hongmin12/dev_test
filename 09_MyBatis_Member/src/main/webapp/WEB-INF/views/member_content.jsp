<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_content</title>
</head>
<body>
	
	<div align="center">
		<c:set var="dto" value="${Content }" />
		<hr width="30%" color="green">
			<h3>${dto.memname } 회원 상세 정보 페이지</h3>
		<hr width="30%" color="green">
		<br> <br>
		
		<table border="1" width="400">
			<tr>
				<th>회원 No.</th>
				<td> ${dto.memno } </td>
			</tr>
			
			<tr>
				<th>회원 아이디</th>
				<td> ${dto.memid } </td>
			</tr>
			
			<tr>
				<th>회원 이름</th>
				<td> ${dto.memname } </td>
			</tr>
			
			<tr>
				<th>회원 비밀번호</th>
				<td>
					<c:forEach begin="1" end="${dto.mempwd.length() }">
					*
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<th>회원 나이</th>
				<td> ${dto.age } </td>
			</tr>
			
			<tr>
				<th>회원 마일리지</th>
				<td> <fmt:formatNumber value="${dto.mileage }" /> 마일리지 </td>
			</tr>
			
			<tr>
				<th>회원 직업</th>
				<td> ${dto.job } </td>
			</tr>
			
			<tr>
				<th>회원 주소</th>
				<td> ${dto.addr } </td>
			</tr>
			
			<tr>
				<th>회원 등록일</th>
				<td> ${dto.regdate.substring(0, 10) } </td>
			</tr>
		</table>
		<br> <br>
		
		<input type="button" value="정보수정" 
			onclick="location.href='member_update.go?num=${dto.memno }'">&nbsp;&nbsp;
			
		<input type="button" value="목록으로" 
			onclick="location.href='member_list.go'">&nbsp;&nbsp;
			
		<input type="button" value="회원삭제" 
			onclick="if(check()) {
				location.href='member_delete.go?num=${dto.memno }'
			}else {return; }">
	</div>
	
	<script type="text/javascript">

		function check() {
			let db_pwd = ${dto.mempwd};
			let pwd = prompt("비밀번호를 입력해 주세요.");
			let conf = false;
			
			if(pwd == db_pwd) {
				if(confirm("정말로 삭제하시겠습니까?")) {
					conf = true;
				}
			}else {
				alert("비밀번호가 틀립니다.");
			}
			
			return conf;
		}

	</script>
	
</body>
</html>