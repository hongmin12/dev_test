package com.spring.mvc02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
	
	@RequestMapping("input")
	public String input() {
		
		return "insertForm";
	}
	
	@RequestMapping("inputOk")
	public String Ok(HttpServletRequest request, Model model) {
		
		String user_name = request.getParameter("name").trim();
		
		String user_age = request.getParameter("age").trim();
		
		String user_phone = request.getParameter("phone").trim();
		
		model.addAttribute("NAME", user_name)
			 .addAttribute("AGE", user_age)
			 .addAttribute("PHONE", user_phone);
		
		return "result";
		
	}
	
	@RequestMapping("login")
	public String bbb() {
		
		return "login_form";
	}
	
	@RequestMapping("login_ok")
	public String ccc(@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd,
						Model model) {
		
		model.addAttribute("id", user_id)
			 .addAttribute("pwd", user_pwd);
		
		return "login_result";
		
	}

}
