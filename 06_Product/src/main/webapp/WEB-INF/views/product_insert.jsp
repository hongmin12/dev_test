<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_insert</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="skyblue">
			<h3>PRODUCTS 테이블 제품 등록 폼 페이지</h3>
		<hr width="30%" color="skyblue">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/product_insert_ok.go">
			<table border="1" width="400">
				<c:set var="cList" value="${CategoryList }" />
				<tr>
					<th>카테고리 Code</th>
					<td>
						<select name="category_fk">
							<c:if test="${empty cList }">
								<option value="">:::카테고리 코드 없음:::</option>
							</c:if>
							
							<c:if test="${!empty cList }">
								<c:forEach items="${cList }" var="dto">
									<option value="${dto.category_code }">${dto.category_name } [${dto.category_code }]</option>
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>제품명</th>
					<td> <input name="products_name"> </td>
				</tr>
				
				<tr>
					<th>제품 Code</th>
					<td> <input name="ep_code_fk"> </td>
				</tr>
				
				<tr>
					<th>제품 입고 가격</th>
					<td> <input name="input_price"> </td>
				</tr>
				
				<tr>
					<th>제품 출고 가격</th>
					<td> <input name="output_price"> </td>
				</tr>
				
				<tr>
					<th>제품 배송비</th>
					<td> <input name="trans_cost"> </td>
				</tr>
				
				<tr>
					<th>제품 마일리지</th>
					<td> <input name="mileage"> </td>
				</tr>
				
				<tr>
					<th>제품 제조사</th>
					<td> <input name="company"> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="제품등록">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>