<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<style type="text/css">

	a {
		text-decoration: none;
	}

</style>
</head>
<body>
	
	<div align="center">
		<hr width="30%" color="red">
			<h3>BOARD 테이블 전체 게시글 리스트 페이지</h3>
		<hr width="30%" color="red">
		<br> <br>
		
		<table border="1" width="750">
		<c:set var="list" value="${List }" />
		<c:set var="paging" value="${Paging }" />
		
			<tr>
				<td colspan="5" align="right">
					전체 게시물 수 : ${paging.totalRecord } 개
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
						<h3>전체 게시물 목록이 없습니다.....</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>
		
		<input type="button" value="글쓰기" onclick="location.href='board_write.go'">
		
		<br> <br> <br>
		
		<%-- 페이징 처리 부분 --%>
		
		<c:if test="${paging.page > paging.block }">
			<a href="<%=request.getContextPath() %>/board_list.go?page=1">[맨처음]</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.startBlock - 1 }">&nbsp;
				◀◀
			</a>
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.page - 1 }">
				◀
			</a>&nbsp;
		</c:if>
		
		<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
			<c:if test="${i == paging.page }">
				<b><a href="<%=request.getContextPath() %>/board_list.go?page=${i }">[${i }]</a></b>&nbsp;
			</c:if>
			
			<c:if test="${i != paging.page }">
				<a href="<%=request.getContextPath() %>/board_list.go?page=${i }">[${i }]</a>&nbsp;
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.endBlock < paging.allPage }">
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.page + 1}">▶</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.endBlock + 1}">▶▶</a>&nbsp;
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.allPage }">[맨마지막]</a>
		</c:if>
		<br> <br>
		<hr width="30%" color="red">
		<br> <br>
		
		<%-- 검색 폼 영역 --%>
		<form method="post" action="<%=request.getContextPath() %>/board_search.go">
			<select name="field">
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목+내용</option>
				<option value="writer">작성자</option>
			</select>
			
			<input name="keyword">&nbsp;&nbsp;&nbsp;
			<input type="submit" value="검색">
		</form>
	</div>
	
</body>
</html>