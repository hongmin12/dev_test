package com.reply2.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply2.model.TblDAO;
import com.reply2.model.TblDTO;

public class TblWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 게시글 입력 폼 페이지에서 넘어온 데이터들을
		// tbl_board 테이블에 저장하는 비지니스 로직.
		
		String tbl_writer = request.getParameter("writer").trim();
		
		String tbl_title = request.getParameter("title").trim();
		
		String tbl_cont = request.getParameter("cont").trim();
		
		String tbl_pwd = request.getParameter("pwd").trim();
		
		TblDTO dto = new TblDTO();
		
		dto.setWriter(tbl_writer);
		dto.setTitle(tbl_title);
		dto.setContent(tbl_cont);
		dto.setPwd(tbl_pwd);
		
		TblDAO dao = TblDAO.getInstance();
		
		int check = dao.insertBoard(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('답변형 게시판 게시글 추가 성공!!!')");
			out.println("location.href='tbl_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('답변형 게시판 게시글 추가 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
