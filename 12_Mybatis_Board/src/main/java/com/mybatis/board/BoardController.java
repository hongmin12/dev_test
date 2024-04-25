package com.mybatis.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.Board;
import com.mybatis.model.BoardDAO;
import com.mybatis.model.Page;

@Controller
public class BoardController {
	
	@Inject
	private BoardDAO dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 3;
	
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	
	@RequestMapping("board_list.go")
	public String list(HttpServletRequest request, Model model) {
		
		int page;		// 현재 페이지 변수
		
		// 페이징 처리 작업
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			// 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
			page = 1;
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출.
		totalRecord = this.dao.getListCount();
		
		Page pdto = new Page(page, rowsize, totalRecord);
		
		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<Board> list = this.dao.getBoardList(pdto);
		
		model.addAttribute("List", list);
		model.addAttribute("Paging", pdto);
		
		return "board_list";
		
	}
	
	
	@RequestMapping("board_write.go")
	public String write() {
		return "board_write";
	}
	
	
	@RequestMapping("board_write_ok.go")
	public void writeOk(Board dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertBoard(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 등록 성공!!!')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("board_content.go")
	public String content(@RequestParam("no") int no, @RequestParam("page") int page, Model model) {
		
		this.dao.readCount(no);
		
		Board cont = this.dao.boardContent(no);
		
		model.addAttribute("Cont", cont);
		model.addAttribute("Page", page);
		
		return "board_content";
		
	}
	
	
	@RequestMapping("board_update.go")
	public String update(@RequestParam("no") int no, @RequestParam("page") int page, Model model) {
		
		Board cont = this.dao.boardContent(no);
		
		model.addAttribute("Cont", cont);
		model.addAttribute("Page", page);
		
		return "board_update";
		
	}
	
	
	@RequestMapping("board_update_ok.go")
	public void updateOk(Board dto, HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
		
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateBoard(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 수정 성공!!!')");
			out.println("location.href='board_content.go?no="+dto.getBoard_no()+"&page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}		
		
	}
	
	
	@RequestMapping("board_delete.go")
	public void delete(@RequestParam("no") int no, @RequestParam("page") int page, 
				HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteBoard(no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.dao.updateSequence(no);
			
			out.println("<script>");
			out.println("alert('게시글 삭제 성공!!!')");
			out.println("location.href='board_list.go?page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	@RequestMapping("board_search.go")
	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword,
					HttpServletRequest request, Model model) {
		
		// 검색 페이징 처리 작업
		int page;				// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// "검색" 버튼을 클릭한 경우 - 검색을 요청한 경우
			page = 1;
		}
		
		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업.
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("Field", field);
		map.put("Keyword", keyword);
		
		totalRecord = this.dao.searchBoardCount(map);
		
		Page pDto = new Page(page, rowsize, totalRecord, field, keyword);
		
		// 검색 시 한 페이지당 보여질 게시물의 수만큼
		// 검색한 게시물을 List로 가져오는 메서드 호출.
		List<Board> searchList = this.dao.searchBoardList(pDto);
		
		model.addAttribute("searchPageList", searchList);
		model.addAttribute("Paging", pDto);
		
		return "board_search_list";
		
	}

}
