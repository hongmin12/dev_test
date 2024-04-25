<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_content</title>
</head>
<body>
	
	<div align="center">
		<c:set var="cont" value="${Cont }" />
		<hr width="30%" color="gray">
			<h3>${cont.products_name } 제품 상세 정보</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<table border="1" cell-spacing="0" width="650">
			<tr>
				<th>제품 No.</th>
				<td> ${cont.pnum } </td>
			</tr>
			
			<tr>
				<th>카테고리 Code</th>
				<td> ${cont.category_fk } </td>
			</tr>
			
			<tr>
				<th>제품명</th>
				<td> ${cont.products_name } </td>
			</tr>
			
			<tr>
				<th>제품 Code</th>
				<td> ${cont.ep_code_fk } </td>
			</tr>
			
			<tr>
				<th>입고가</th>
				<td> ${cont.input_price } </td>
			</tr>
			
			<tr>
				<th>출고가</th>
				<td> ${cont.output_price } </td>
			</tr>
			
			<tr>
				<th>배송비</th>
				<td> ${cont.trans_cost } </td>
			</tr>
			
			<tr>
				<th>마일리지</th>
				<td> ${cont.mileage } </td>
			</tr>
			
			<tr>
				<th>제조사</th>
				<td> ${cont.company } </td>
			</tr>
		</table>
		<br> <br>
		
		<input type="button" value="정보수정" 
			onclick="location.href='products_update.go?no=${cont.pnum }'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="목록으로"
			onclick="location.href='products_list.go'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="제품삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {
												location.href='products_delete.go?no=${cont.pnum }'
											}else {return; }">
	</div>
	
</body>
</html>