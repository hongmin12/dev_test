<%@page import="com.shop.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.center {
		text-align: center;
	}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

	$(() => {
		
		$("#amount").change(function() {
			
			$.ajax({
				ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post"
				url : "<%=request.getContextPath() %>/user_cart_change.go",
				data : {
						amount : $("#amount").val(),
						
						},
				dataType : "text",
				success : function(res) {
					document.getElementById("amount").val(res);
				},
				error : function() {
					alert("데이터 통신 오류입니다~~~");
				}
			});
			
		});
		
	});

</script>
</head>
<body>
	
	<jsp:include page="../include/user_header.jsp" />
		
	<table border="1" width="700" align="center">
		<tr>
			<td colspan="7" align="center">
				<h3>장바구니 내역</h3>
			</td>
		</tr>
		
		<tr>
			<th width="8%">주문No.</th>
			<th width="8%">상품No.</th>
			<th width="13%">상품명</th>
			<th width="15%">수 량</th>
			<th width="15%">단 가</th>
			<th width="15%">합계액</th>
			<th width="10%">삭 제</th>
		</tr>
		
		<c:set var="list" value="${CartList }" />
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td class="center"> ${dto.getCart_num() } </td>
					<td class="center"> ${dto.getCart_pnum() } </td>
					<td class="center">
						<img src="<%=request.getContextPath() %>/upload/${dto.getCart_pimage() }"
							width="50" height="50">
						<br>
						${dto.getCart_pname() }
					</td>
					<td class="center">
						<input type="number" id="amount" min="1" max="99" value="${dto.getCart_pqty() }">
					</td>
					<td class="center">
						<fmt:formatNumber value="${dto.getCart_price() }" /> 원
					</td>
					<td class="center">
						<c:set var="price" value="${dto.getCart_price() }" />
						<c:set var="amount" value="${dto.getCart_pqty() }" />
						<fmt:formatNumber value="${price * amount }" /> 원
					</td>
					<td class="center">
						<a href="<%=request.getContextPath() %>/user_cart_delete.go?num=${dto.getCart_num() }">
							[삭 제]
						</a>
					</td>
				</tr>
				
					<c:set var="total" value="${total + (price * amount) }" />
			</c:forEach>
			
			<tr>
				<td colspan="5" align="right">
					<b> <font color="red">장바구니 총액 : <fmt:formatNumber value="${total }" /> 원</font></b>
				</td>
				<td colspan="2" align="center">
					<a href="#">[결제하기]</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:history.go(-2);">[계속 쇼핑]</a>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${empty list }">
			<tr>
				<td colspan="7" align="center">
					<h3>장바구니가 비어 있습니다.....</h3>
				</td>
			</tr>
		</c:if>
	</table>
		
	<jsp:include page="../include/user_footer.jsp" />
	
</body>
</html>