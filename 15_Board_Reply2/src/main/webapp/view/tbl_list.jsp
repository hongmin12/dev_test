<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>

	<div align="center">
	   <hr width="30%" color="red">
	      <h3>TBL_BOARD 테이블 게시판 전체 리스트 페이지</h3>
	   <hr width="30%" color="red">
	   <br> <br>
	   
	   <table class="table table-hover">
	   <c:set var="list" value="${List }" />
	      <tr>
	         <td colspan="4" align="right">
	            전체 게시물 수 : ${list.size() } 개
	         </td>
	      </tr>
	      
	      <tr>
	         <th scope="col">게시글 No.</th> <th scope="col">게시글 제목</th>
	         <th scope="col">게시글 작성자</th> <th scope="col">게시글 작성일자</th>
	      </tr>
	      
	      
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getBno() } </td>
	               <td> 
	                  <a href="<%=request.getContextPath() %>/tbl_content.go?no=${dto.getBno() }">
	               					${dto.getTitle() } </a> <b>[${dto.getRegCnt() }]</b>
	               </td>
	               <td> ${dto.getWriter() } </td>
	               <td> ${dto.getRegdate().substring(0, 10) } </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="4" align="center">
	               <h3>전체 게시물 리스트가 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	   <br> <br>
	   
	   <%-- Modal 창 만드는 버튼 --%>
	   <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#writeModal">
		  글쓰기
	   </button>
		
		<!-- Modal -->
		<div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">TBL_BOARD 테이블 게시글 등록 폼 페이지</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		         <form method="post"
		            action="<%=request.getContextPath() %>/tbl_insert_ok.go">
		            
		            <table class="table">
		                <tr>
		                  <th scope="row">
		                     <label for="writerId">작성자</label>
						  </th>
		                  <td>
		                     <div class="form-group">
							    <input type="text" class="form-control" id="writerId" name="writer">
							 </div>
		                  </td>
		               </tr>
		               
		               <tr>
		                  <th scope="row">
		                     <label for="titleId">글제목</label>
						  </th>
		                  <td>
		                     <div class="form-group">
							    <input type="text" class="form-control" id="titleId" name="title">
							 </div>
		                  </td>
		               </tr>
		               
		               <tr>
		                  <th scope="row">
		                     <label for="contentId">글내용</label>
						  </th>
		                  <td>
		                     <div class="form-group">
							    <textarea class="form-control" id="contentId" rows="3" name="cont"></textarea>
							 </div>
		                  </td>
		               </tr>
		               
		               <tr>
		                  <th scope="row">
		                     <label for="pwdId">글 비밀번호</label>
						  </th>
		                  <td>
		                     <div class="form-group">
							    <input type="password" class="form-control" id="pwdId" name="pwd">
							 </div>
		                  </td>
		               </tr>
		            </table>

					<div class="modal-footer">
				        <button type="submit" class="btn btn-primary">글쓰기</button>
				        <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>  
				     </div>
				 </form>
		     </div>
		     
		     
		    </div>
		  </div>
		</div>
	
	</div>
	
</body>
</html>







