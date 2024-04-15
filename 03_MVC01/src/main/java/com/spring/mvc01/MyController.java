package com.spring.mvc01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	/*
	 * 스프링 MVC에서 Model(모델) 이란?
	 * - 컨트롤러에 매핑을 통해 요청 정보가 들어오면
	 *   매핑을 통해서 일치되는 매핑을 찾게 됨.
	 * - 찾고 나면 해당 메서드에서 비지니스 로직이 수행이 됨.
	 *   비지니스 로직이 수행이 되고 나면 대체적으로
	 *   view page로 보내질 정보들이 만들어짐.
	 * - 이러한 정보들을 스프링에서는 Model(모델) 이라고 함.
	 *   이 Model(모델) 정보를 view page로 보내게 됨. 
	 */
	
	@RequestMapping("info")
	public String aaa(Model model) {
		
		model.addAttribute("Name", "홍길동")
			 .addAttribute("Email", "hong@gmail.com")
			 .addAttribute("Phone", "010-1111-1234")
			 .addAttribute("Addr", "서울시 구로구");
		
		return "person";
	}
	
	
	@RequestMapping("member")
	public ModelAndView bbb() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("Name", "세종대왕")
		   .addObject("userId", "sejong")
		   .addObject("Addr", "서울시 중구");
		
		mav.setViewName("/member/memberInfo");
		
		return mav;
		
	}

}
