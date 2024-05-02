package com.goott.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.goott.board.model.Board;
import com.goott.board.model.BoardRepository;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

/*
 * @RequiredArgsConstructor 는 초기화 되지 않은 final 필드나
 * @NotNull 이 붙은 필드에 대해 생성자를 생성해 주는 애노테이션.
 * 새로운 필드를 추가할 때 다시 생성자를 만들어서 관리해야 하는
 * 번거로움을 없애주는 애노테이션(@Autowired를 사용하지 않고 의존성 주입)
 * 스프링 부트에서 가장 권장하는 의존성 주입은 생성자 주입 방식임.
 * 즉, 클래스에 선언된 final 변수들, 필드들을 매개변수로 하는
 * 생성자를 자동으로 생성해 주는 애노테이션이라고 생각하면 됨.
 */

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardRepository repository;
	
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("board_list")
	public String list(Model model) {
		
		// 전체 게시물 목록을 조회하는 메서드 호출
		List<Board> list = this.repository.list();
		
		model.addAttribute("List", list);
		
		return "board_list";
		
	}
	
	@GetMapping("board_write")
	public String write() {
		return "board_write";
	}
	
	@PostMapping("board_write_ok")
	public void writeOk(Board dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = this.repository.add(dto);
		
		if(result > 0) {
			out.println("""
					<script>
					alert('게시글 추가 성공!!!')
					location.href='board_list'
					</script>
					""");
		}else {
			out.println("""
					<script>
					alert('게시글 추가 실패~~~')
					history.back()
					</script>
					""");
		}
		
	}
	
}
