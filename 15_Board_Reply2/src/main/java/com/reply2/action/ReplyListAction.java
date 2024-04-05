package com.reply2.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply2.model.TblDAO;

public class ReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 글번호(원글 번호)에 해당하는 댓글 전체 리스트를
		// tbl_reply 테이블에서 조회하여 view page로
		// 이동시키는 비지니스 로직.
		int board_no = 
			Integer.parseInt(request.getParameter("rno").trim());
		
		TblDAO dao = TblDAO.getInstance();
		
		String result = dao.getReplyList(board_no);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// Ajax에 응답을 해 주면 됨.
		out.println(result);
		
		return null;
	}

}
