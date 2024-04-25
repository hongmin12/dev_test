<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>

	<div align="center">
	   <c:set var="cont" value="${Content }" />
	   <hr width="30%" color="red">
	      <h3> ${cont.getWriter() } 님 게시글 상세 내역 페이지</h3>
	   <hr width="30%" color="red">
	   <br> <br>
	   
	   <table border="1" width="400">
	      <tr>
	         <th>글 No.</th>
	         <td> ${cont.getBno() } </td>
	      </tr>
	      
	      <tr>
	         <th>글 작성자</th>
	         <td> ${cont.getWriter() } </td>
	      </tr>
	      
	      <tr>
	         <th>글 제목</th>
	         <td> ${cont.getTitle() } </td>
	      </tr>
	      
	      <tr>
	         <th>글 내용</th>
	         <td> 
	           <textarea rows="7" cols="25" readonly>${cont.getContent() }</textarea>  
	         </td>
	      </tr>
	      
	      <tr>
	         <th>글 비밀번호</th>
	         <td>
	            <c:forEach begin="1" end="${cont.getPwd().length() }">
	                      *
	            </c:forEach>
	         </td>
	      </tr>
	      
	      <tr>
	         <th>글 작성일자</th>
	         <td> ${cont.getRegdate() } </td>
	      </tr>
	      
	      <tr>
	         <th>글 수정일자</th>
	         <c:if test="${empty cont.getRegupdate() }">
	            <td>&nbsp;&nbsp;</td>
	         </c:if>
	      
	         <c:if test="${!empty cont.getRegupdate() }">
	            <td> ${cont.getRegupdate() }</td>
	         </c:if>
	      </tr>
	      
	      <%-- 데이터가 없는 경우 --%>
	      <c:if test="${empty cont }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3> 게시물 번호에 해당하는 게시물이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	   
	   <br> <br>
	   
	   <input type="button" value="글수정"
	      onclick="location.href='tbl_modify.go?no=${cont.getBno() }'">&nbsp;&nbsp;
	   
	   <input type="button" value="글삭제"
	      onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
	   					location.href='tbl_delete.go?no=${cont.getBno() }'
	   			   }else { return; }">&nbsp;&nbsp;
	      
	   <input type="button" value="전체목록"
	      onclick="location.href='tbl_list.go'">
	      
	   <br> <br>
	   
	   <hr width="30%" color="red">
	   
	   <br> <br>
	   
	   <%-- 여기는 댓글 폼 영역입니다. --%>
	   <div>
	      <table border="1" width="400">
	         <tr>
	            <th>댓글 작성자</th>
	            <td>
	               <input type="text" name="re_writer" id="re_writer">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>댓글 내용</th>
	            <td>
	               <input type="text" name="wr_content" id="re_content">
	            </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="right">
	               <input type="button" id="replyBtn" value="댓글작성">
	            </td>
	         </tr>
	      </table>
	   </div> <%-- 댓글 폼 end --%>
	   
	   <br>
	   
	   <h3>댓글 목록</h3>
	   
	   <div>
	      <table border="1" class="replyList" width="400">
	         <tr>
	            <td colspan="2">작성자</td>
	         </tr>
	         
	         <tr>
	            <td>댓글내용</td> <td>작성일자</td>
	         </tr>
	      </table>
	   
	   </div> <%-- 댓글 목록 end --%>
	
	</div>
	
<script type="text/javascript">

	$(function() {
		
		// ajax에서 동일하게 공통적으로 사용되는 속성 설정.
		$.ajaxSetup({
			// POST 방식으로 데이터를 보낼 때에는 헤더에 데이터가 저장되어서 전송
			// 헤더의 콘텐트 타입이 form-urlencoded 임을 지정해야 함. 
			ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post"
		});
		
		
		// tbl_reply 테이블의 전체 답글을 가져오는 함수.
		function getList() {
		
			$.ajax({
				
				url : "<%=request.getContextPath() %>/reply_list.go",
				data : {rno : ${cont.getBno() }},
				dataType : "xml",
				success : function(res) {
					// 테이블 태그의 타이틀 태그를 제외한
					// 나머지 댓글 목록을 지우는 작업.
					$(".replyList tr:gt(1)").remove();
					
					let table = "";
					
					$(res).find("reply").each(function() {
						
						table += "<tr>";
						table += "<td colspan='2'>"+$(this).find("rewriter").text() +"</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td>"+$(this).find("recont").text() + "</td>";
						table += "<td>"+$(this).find("redate").text() + "</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
					});
					
					$(".replyList tr:eq(1)").after(table);
					
				},
				
				error : function() {
					alert("데이터 통신 오류입니다.~~~");
				}
				
				
			});
			
		}  // getList() 함수 end
		
		
		// 댓글 작성 버튼을 눌렀을 때 댓글 내용을 tbl_reply 테이블에 저장.
		$("#replyBtn").on("click", function() {
			
			$.ajax({
				
				url : "<%=request.getContextPath() %>/reply_insert_ok.go",
				data : {
						  writer : $("#re_writer").val(),
					      content : $("#re_content").val(),
					      bno : ${cont.getBno() }
						},
				dataType : "text",
				success : function(res) {
					
					if(res > 0) {
						alert("댓글 작성 성공!!!");
						
						// 댓글 작성 후 다시 전체 리스트를 화면에 보여주면 됨.
						getList();
						
						// input 태그에 입력된 내용을 지워주자.
						$("input[type=text]").each(function() {
							$(this).val("");
						});
					}
				},
				
				error : function() {
					alert("데이터 통신 오류입니다.~~~");
				}
				
			});
		});
		
		
		getList();
		
	});  
	
	
	
	






</script>
</body>
</html>










