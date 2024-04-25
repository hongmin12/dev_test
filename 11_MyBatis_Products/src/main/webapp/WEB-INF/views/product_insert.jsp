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
		<hr width="30%" color="gray">
			<h3>PRODUCTS 테이블 제품 등록 폼 페이지</h3>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/products_insert_ok.go">
			<c:set var="catlist" value="${clist }" />
			
			<table border="1" width="550">
				<tr>
					<th>카테고리 Code</th>
					<td>
						<select name="category_fk">
							<c:forEach items="${catlist }" var="dto">
								<option value="${dto.category_code }">${dto.category_name } [${dto.category_code }]</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>제품명</th>
					<td> <input name="products_name"> </td>
				</tr>
				
				<tr>
					<th>제품 Code</th>
					<td> <input name="ep_code_fk" placeholder="다섯자리 숫자로 입력합니다."> </td>
				</tr>
				
				<tr>
					<th>입고가</th>
					<td> <input name="input_price"> </td>
				</tr>
				
				<tr>
					<th>출고가</th>
					<td> <input name="output_price"> </td>
				</tr>
				
				<tr>
					<th>배송비</th>
					<td> <input name="trans_cost"> </td>
				</tr>
				
				<tr>
					<th>마일리지</th>
					<td> <input name="mileage"> </td>
				</tr>
				
				<tr>
					<th>제조사</th>
					<td> <input name="company"> </td>
				</tr>
			</table>
			<br> <br>
			
			<input type="submit" value="제품등록">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		</form>
	</div>
	
</body>
</html>