<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니 쇼핑몰 사용자 로그인 페이지</title>
</head>
<body>

	<div align="center">
	   <hr width="65%" color="marmoon">
	      <h3>미니 쇼핑몰 사용자 로그인 페이지</h3>
	   <hr width="65%" color="marmoon">
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/user_login_ok.go">
	   
	      <table border="1" width="350">
	         <tr>
	            <th>사용자 아이디</th>
	            <td> <input name="user_id"> </td>
	         </tr>
	         
	         <tr>
	            <th>사용자 비밀번호</th>
	            <td> <input type="password" name="user_pwd"> </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="로그인">&nbsp;&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   </form>
	   
	</div>
	
</body>
</html>




