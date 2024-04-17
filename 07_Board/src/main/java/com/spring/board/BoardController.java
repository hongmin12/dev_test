package com.spring.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Board;
import com.spring.model.BoardService;

@Controller
public class BoardController {
	
	@Inject
	private BoardService service;
	
	
	@RequestMapping("board_list.go")
	public ModelAndView getBoardList() {
		
		List<Board> list = this.service.getBoardList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("List", list);
		mav.setViewName("board_list");
		
		return mav;
		
	}
	
	
	@RequestMapping("board_insert.go")
	public String insert() {
		return "board_insert";
	}
	
	
	@RequestMapping("board_insert_ok.go")
	public void insertBoard(Board dto, HttpServletResponse response) throws IOException {
		
		int check = this.service.insertBoard(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글이 등록되었습니다.')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 등록에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("board_content.go")
	public ModelAndView content(@RequestParam("no") int no) {
		
		ModelAndView mav = new ModelAndView();
		
		this.service.updateBoardHit(no);
		Board cont = this.service.getBoardCont(no);
		
		mav.addObject("Content", cont);
		mav.setViewName("board_content");
		
		return mav;
		
	}
	
	
	@RequestMapping("board_update.go")
	public ModelAndView update(@RequestParam("no") int no) {
		
		ModelAndView mav = new ModelAndView();
		
		Board cont = this.service.getBoardCont(no);
		
		mav.addObject("Content", cont);
		mav.setViewName("board_update");
		
		return mav;		
	}
	
	
	@RequestMapping("board_update_ok.go")
	public void updateOk(Board dto, HttpServletResponse response) throws IOException {
		
		int check = this.service.updateBoard(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글이 수정되었습니다.')");
			out.println("location.href='board_content.go?no="+dto.getBoard_no()+"'");
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("board_delete.go")
	public ModelAndView delete(@RequestParam("no") int no) {
		
		ModelAndView mav = new ModelAndView();
		
		Board cont = this.service.getBoardCont(no);
		
		mav.addObject("Content", cont);
		mav.setViewName("board_delete");
		
		return mav;
	}
	
	
	@RequestMapping("board_delete_ok.go")
	public void deleteOk(@RequestParam("no") int no, HttpServletResponse response, Board dto) throws IOException {
		
		int check = this.service.deleteBoard(no, dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.service.updateSequence(no);
			
			out.println("<script>");
			out.println("alert('게시글이 삭제되었습니다.')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
