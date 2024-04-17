<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="blue">
			<h3>PRODUCTS 테이블 제품 추가 폼 페이지</h3>
		<hr width="30%" color="blue">
		<br> <br>
		
		<form method="post" action="<%=request.getContextPath() %>/product_insert_ok.go">
			<table border="1" width="400">
				<c:set var="clist" value="${categoryList }" />
				<tr>
					<th>제품 카테고리</th>
					<td>
						<select name="category_fk">
							<c:if test="${empty clist }">
								<option value="">:::카테고리 코드 없음:::</option>
							</c:if>
							
							<c:if test="${!empty clist }">
								<c:forEach items="${clist }" var="dto">
									<option value="${dto.category_code }">${dto.category_code } [${dto.category_name }]</option>
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>EP 코드</th>
					<td>
						<select name="epcode">
							<option value="00001">00001</option>
							<option value="00002">00002</option>
							<option value="00003">00003</option>
							<option value="00004">00004</option>
							<option value="00005">00005</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>제품명</th>
					<td> <input name="pname"> </td>
				</tr>
				
				<tr>
					<th>제조사</th>
					<td> <input name="pcompany"> </td>
				</tr>
				
				<tr>
					<th>입고가</th>
					<td> <input name="input_price"> </td>
				</tr>
				
				<tr>
					<th>배송비</th>
					<td> <input name="trans_cost"> </td>
				</tr>
				
				<tr>
					<th>출고가</th>
					<td> <input name="output_price"> </td>
				</tr>
				
				<tr>
					<th>마일리지</th>
					<td> <input name="mileage"> </td>
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