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
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="gray">
			<h3>${cont.products_name } 제품 정보 수정 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/product_update_ok.go">
			
			<input type="hidden" name="pnum" value="${cont.pnum }">
			
			<table border="1" cell-spacing="0" width="650">
				<tr>
					<th>카테고리 Code</th>
					<td> <input name="category_fk" value="${cont.category_fk }" readonly> </td>
				</tr>
				
				<tr>
					<th>제품명</th>
					<td> <input name="products_name" value="${cont.products_name }" readonly> </td>
				</tr>
				
				<tr>
					<th>제품 Code</th>
					<td> <input name="ep_code_fk" value="${cont.ep_code_fk }" readonly> </td>
				</tr>
				
				<tr>
					<th>입고가</th>
					<td> <input name="input_price" value="${cont.input_price }"> </td>
				</tr>
				
				<tr>
					<th>출고가</th>
					<td> <input name="output_price" value="${cont.output_price }"> </td>
				</tr>
				
				<tr>
					<th>배송비</th>
					<td> <input name="trans_cost" value="${cont.trans_cost }"> </td>
				</tr>
				
				<tr>
					<th>마일리지</th>
					<td> <input name="mileage" value="${cont.mileage }"> </td>
				</tr>
				
				<tr>
					<th>제조사</th>
					<td> <input name="company" value="${cont.company }"> </td>
				</tr>
			</table>
			<br> <br> <br>
			
			<input type="submit" value="정보수정">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
	</div>

</body>
</html>