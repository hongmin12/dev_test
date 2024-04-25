<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="blue">
			<h3>PRODUCTS 테이블 전체 제품 리스트 페이지</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<table border="1" cell-spacing="0" width="650">
			<tr>
				<th>제품 No.</th> <th>제품 카테고리</th> <th>제품명</th>
				<th>입고가</th> <th>출고가</th> <th>배송비</th>
			</tr>
			
			<c:set var="list" value="${List }" />
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="6" align="center">
						<h3>제품이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.pnum } </td>
						<td> ${dto.category_fk } </td>
						<td> <a href="<%=request.getContextPath() %>/products_content.go?no=${dto.pnum }">
							${dto.products_name }</a> </td>
						<td> ${dto.input_price } </td>
						<td> ${dto.output_price } </td>
						<td> ${dto.trans_cost } </td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>
		<br> <br>
		
		<input type="button" value="제품등록" onclick="location.href='products_insert.go'">
	</div>
	
</body>
</html>