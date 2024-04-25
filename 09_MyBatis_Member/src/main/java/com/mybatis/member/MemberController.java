package com.mybatis.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.Member;
import com.mybatis.model.MemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	
	@RequestMapping("member_list.go")
	public String list(Model model) {
		
		List<Member> list = this.dao.getMemberList();
		
		model.addAttribute("List", list);
		
		return "member_list";
	}
	
	
	@RequestMapping("member_insert.go")
	public String insert() {
		return "member_insert";
	}
	
	
	@RequestMapping("member_insert_ok.go")
	public void insertOk(Member dto,HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertMember(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 등록 성공!!!')");
			out.println("location.href='member_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("member_content.go")
	public String cont(@RequestParam("num") int no, Model model) {
		
		Member cont = this.dao.getMember(no);
		
		model.addAttribute("Content", cont);
		
		return "member_content";
		
	}
	
	
	@RequestMapping("member_update.go")
	public String modify(@RequestParam("num") int no, Model model) {
		
		Member cont = this.dao.getMember(no);
		
		model.addAttribute("Content", cont);
		
		return "member_update";
		
	}
	
	
	@RequestMapping("member_update_ok.go")
	public void modifyOk(Member dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.updateMember(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 정보 수정 성공!!!')");
			out.println("location.href='member_content.go?num="+dto.getMemno()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 정보 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("member_delete.go")
	public void delete(@RequestParam("num") int no, HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteMember(no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.dao.updateSequence(no);
			
			out.println("<script>");
			out.println("alert('회원 삭제 성공!!!')");
			out.println("location.href='member_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("member_search.go")
	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword,
			Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("Field", field);
		map.put("Keyword", keyword);
		
		List<Member> searchList = this.dao.searchMemberList(map);
		
		model.addAttribute("Search", searchList);
		model.addAttribute("key", keyword);
		
		return "member_search_list";
		
	}
	
}
