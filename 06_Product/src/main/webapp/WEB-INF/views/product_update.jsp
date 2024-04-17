<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_update</title>
</head>
<body>
	
	<div align="center">
		<c:set var="dto" value="${Content }"></c:set>
		<hr width="30%" color="gray">
			<h3>${dto.products_name } 제품 정보 수정 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/product_update_ok.go">
			<input type="hidden" name="pnum" value="${dto.pnum }">
			<table border="1" width="400">
				<tr>
					<th>카테고리 Code</th>
					<td> <input name="category_fk" value="${dto.category_fk }" readonly> </td>
				</tr>
				
				<tr>
					<th>제품명</th>
					<td> <input name="products_name" value="${dto.products_name }" readonly> </td>
				</tr>
				
				<tr>
					<th>제품 코드</th>
					<td> <input name="ep_code_fk" value="${dto.ep_code_fk }" readonly> </td>
				</tr>
				
				<tr>
					<th>제품 입고 가격</th>
					<td> <input name="input_price" value="${dto.input_price }"> </td>
				</tr>
				
				<tr>
					<th>제품 출고 가격</th>
					<td> <input name="output_price" value="${dto.output_price }"> </td>
				</tr>
				
				<tr>
					<th>제품 배송비</th>
					<td> <input name="trans_cost" value="${dto.trans_cost }"> </td>
				</tr>
				
				<tr>
					<th>제품 마일리지</th>
					<td> <input name="mileage" value="${dto.mileage }"> </td>
				</tr>
				
				<tr>
					<th>제품 제조사</th>
					<td> <input name="company" value="${dto.company }" readonly> </td>
				</tr>
			</table>
			<br>
			
			<input type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
	</div>
	
</body>
</html>