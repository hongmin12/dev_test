<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	   <hr width="30%" color="red">
	      <h3>PRODUCTS 테이블 제품 전체 리스트 페이지</h3>
	   <hr width="30%" color="red">
	   <br> <br>
	   
	   <table border="1" width="500">
	      <tr>
	         <th>제품 No.</th> <th>제품명</th>
	      	 <th>판매 가격</th> <th>제조사</th>
	      </tr>
	      
	      <c:set var="list" value="${List }" />
	      
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.pnum } </td>
	               <td> 
	               	 <a href="<%=request.getContextPath() %>/product_content.go?pnum=${dto.pnum }">
	               	 	${dto.products_name }</a> 
	               </td>
	               <td align="right">
	                  <fmt:formatNumber value="${dto.output_price }" /> 원
	               </td>
	               <td> ${dto.company } </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="4" align="center">
	               <h3>제품 전체 목록이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	   <br> <br>
	   
	   <input type="button" value="제품등록" onclick="location.href='product_insert.go'">
	</div>
</body>
</html>




