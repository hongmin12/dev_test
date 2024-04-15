package com.spring.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Member;
import com.spring.model.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService service;
	
	
	@RequestMapping("member_list.go")
	public String list(Model model) {
		
		List<Member> memberList = this.service.list();
		
		model.addAttribute("MemberList", memberList);
		
		return "member/member_list";
		
	}
	
	

}
