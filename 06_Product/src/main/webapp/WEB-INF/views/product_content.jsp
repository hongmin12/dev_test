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
		<c:set var="dto" value="${Content }" />
		<hr width="30%" color="red">
			<h3>PRODUCTS 테이블 ${dto.products_name } 제품 상세 정보 페이지</h3>
		<hr width="30%" color="red">
		<br> <br>
		
		<table border="1" width="400">
			<tr>
				<th>제품명</th>
				<td> ${dto.products_name } </td>
			</tr>
			
			<tr>
				<th>카테고리 Code</th>
				<td> ${dto.category_fk } </td>
			</tr>
			
			<tr>
				<th>제품 코드</th>
				<td> ${dto.ep_code_fk } </td>
			</tr>
			
			<tr>
				<th>제품 입고 가격</th>
				<td>
					<fmt:formatNumber value="${dto.input_price }" /> 원&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th>제품 출고 가격</th>
				<td>
					<fmt:formatNumber value="${dto.output_price }" /> 원&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th>제품 배송비</th>
				<td>
					<fmt:formatNumber value="${dto.trans_cost }" /> 원&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th>제품 마일리지</th>
				<td>
					<fmt:formatNumber value="${dto.mileage }" /> 마일리지&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th>제품 제조사</th>
				<td> ${dto.company } </td>
			</tr>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 제품이 없습니다.....</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>
		
		<input type="button" value="수정하기" onclick="location.href='product_update.go?pnum=${dto.pnum}'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="삭제하기" onclick="location.href='product_delete.go?pnum=${dto.pnum}'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="목록으로" onclick="location.href='product_list.go'">
	</div>
	
</body>
</html>