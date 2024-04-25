<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_search_list</title>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="red">
			<h3>BOARD 테이블 게시글 검색 리스트 페이지</h3>
		<hr width="30%" color="red">
		<br> <br>
		
		<table border="1" width="750">
		<c:set var="list" value="${searchPageList }" />
		<c:set var="paging" value="${Paging }" />
		
			<tr>
				<td colspan="5" align="right">
					전체 검색 게시물 수 : ${paging.totalRecord } 개
				</td>
			</tr>
			
			<tr>
				<th>게시글 No.</th> <th>게시글 제목</th>
				<th>게시글 작성자</th> <th>게시글 조회수</th> <th>게시글 작성일자</th>
			</tr>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.board_no } </td>
						<td>
							<a href="<%=request.getContextPath() %>/board_content.go?
								no=${dto.board_no }&page=${paging.page }">
								${dto.board_title }</a>
						</td>
						<td> ${dto.board_writer } </td>
						<td> ${dto.board_hit } </td>
						<td> ${dto.board_date.substring(0, 10) } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">
						<h3>검색 게시물 목록이 없습니다.....</h3>
					</td>
				</tr>
			</c:if>
		</table>
		
		<br> <br> <br>
		
		<%-- 페이징 처리 부분 --%>
		
		<c:if test="${paging.page > paging.block }">
			<a href="<%=request.getContextPath() %>/board_search.go?page=1&field=${paging.field }&keyword=${paging.keyword }">[맨처음]</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_search.go?page=${paging.startBlock - 1 }&field=${paging.field }&keyword=${paging.keyword }">&nbsp;
				◀◀
			</a>
			<a href="<%=request.getContextPath() %>/board_search.go?page=${paging.page - 1 }&field=${paging.field }&keyword=${paging.keyword }">
				◀
			</a>&nbsp;
		</c:if>
		
		<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
			<c:if test="${i == paging.page }">
				<b><a href="<%=request.getContextPath() %>/board_search.go?page=${i }&field=${paging.field }&keyword=${paging.keyword }">[${i }]</a></b>&nbsp;
			</c:if>
			
			<c:if test="${i != paging.page }">
				<a href="<%=request.getContextPath() %>/board_search.go?page=${i }&field=${paging.field }&keyword=${paging.keyword }">[${i }]</a>&nbsp;
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.endBlock < paging.allPage }">
			<a href="<%=request.getContextPath() %>/board_search.go?page=${paging.page + 1}&field=${paging.field }&keyword=${paging.keyword }">▶</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_search.go?page=${paging.endBlock + 1}&field=${paging.field }&keyword=${paging.keyword }">▶▶</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_search.go?page=${paging.allPage }&field=${paging.field }&keyword=${paging.keyword }">[맨마지막]</a>
		</c:if>
		<br> <br>
		<hr width="30%" color="red">
		<br> <br> <br>
		
		<input type="button" value="전체게시물" onclick="location.href='board_list.go'">
	</div>
	
</body>
</html>