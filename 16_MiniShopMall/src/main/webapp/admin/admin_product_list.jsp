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

	<jsp:include page="../include/admin_header.jsp" />
	
	   <hr width="85%" color="blue">
	      <h3>SHOP_PRODUCTS 테이블 상품 전체 리스트 페이지</h3>
	   <hr width="85%" color="blue">
	   <br> <br>
	
	   <table border="1" width="85%">
	      <tr bgcolor="#ffcc00">
	         <th>제품 No.</th> <th>카테고리 Code</th> <th>제품명</th>
	         <th>이 미 지</th> <th>제품가격</th> <th>수 량</th>
	         <th>제 조 사</th> <th>제품등록일</th>
	         <th>수 정&nbsp;&nbsp;&nbsp;  |  &nbsp;&nbsp;&nbsp;삭 제</th>
	      </tr>
	      
	      <c:set var="list" value="${ProductList }" />
	      
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getPnum() } </td>
	               <td> ${dto.getPcategory_fk() } </td>
	               <td> ${dto.getPname() } </td>
	               <td>
	                  <img src="<%=request.getContextPath() %>/upload/${dto.getPimage() }"
	               					width="60" height="60">
	               </td>
	               <td>
	                  <fmt:formatNumber value="${dto.getPrice() }" />원
	               </td>
	               <td> ${dto.getPqty() } </td>
	               <td> ${dto.getPcompany() } </td>
	               <td> ${dto.getPinputdate().substring(0, 10) } </td>
	               <td>
	                  <a href="<%=request.getContextPath() %>/admin_product_modify.go?num=${dto.getPnum() }">수 정</a>
	                    &nbsp;&nbsp;&nbsp;  |  &nbsp;&nbsp;&nbsp;
	                  <a href="javascript:del(${dto.getPnum() })">삭 제</a>
	               </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="9" align="center">
	               <h3>제품 전체 리스트가 없습니다....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	
	<jsp:include page="../include/admin_footer.jsp" />
	
</body>
</html>












