package com.reply2.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply2.model.TblDAO;
import com.reply2.model.TblDTO;

public class TblContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 글번호에 해당하는 게시글을
		// tbl_board 테이블에서 조회하여 해당 게시글의 상세내역을
		// view page로 이동시키는 비지니스 로직.
		int board_no = 
			Integer.parseInt(request.getParameter("no").trim());
		
		TblDAO dao = TblDAO.getInstance();
		
		TblDTO content = dao.getBoardContent(board_no);
		
		request.setAttribute("Content", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/tbl_content.jsp");
		
		
		return forward;
		
	}

}




