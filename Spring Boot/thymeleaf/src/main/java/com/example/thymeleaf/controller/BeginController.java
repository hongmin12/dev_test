package com.example.thymeleaf.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BeginController {

	@GetMapping("/")
	public String aaa() {
		
		return "index";		
	}
	
	@RequestMapping("/{num}")			// @RequestMapping 애노테이션도 가능함.
	public String abc(@PathVariable("num") int no, Model model) {
		
		int result = 0;
		
		for(int i=1; i<=no; i++) {
			
			result += i;
		}
		
		model.addAttribute("hap", "total >>> " + result);
		
		return "index";
	}
	
	@GetMapping("form")
	public String abc() {
		return "index_01";
	}
	
	@PostMapping("data")
	public ModelAndView bcd(ModelAndView mav, @RequestParam("txt1") String name) {
		
		mav.addObject("message", "안녕하세요!! "+name+"님!!!");
		mav.setViewName("index_01");
		
		return mav;
	}
	
	@GetMapping("date")
	public String ccc() {
		return "index_02";
	}
	
	@GetMapping("object")
	public String ddd(Model model) {
		DataObject obj = new DataObject(100, "sejong", "sejong@gmail.com");
		
		model.addAttribute("Object", obj);
		
		return "index_03";
	}
	
	@GetMapping("data/{num}")
	public String eee(@PathVariable("num") int no, Model model) {
		
		model.addAttribute("No", no)
			.addAttribute("check", no >= 0)
			.addAttribute("trueVal", "양수입니다.")
			.addAttribute("falseVal", "음수입니다.");
		
		return "index_04";
	}
	
	@GetMapping("score/{jumsu}")
	public String eee(@PathVariable("jumsu") double avg, Model model) {
		
		model.addAttribute("score", avg)
			 .addAttribute("hakjum", Math.floor(avg/10));
		
		return "index_05";
		
	}
	
	@GetMapping("each")
	public String ggg() {
		return "index_06";
	}
	
	@GetMapping("array")
	public String bcd(Model model) {
		
		List<String[]> data = new ArrayList<>();
		
		data.add(new String[] {"hong", "홍길동", "010-1111-1234", "hong@naver.com"});
		data.add(new String[] {"lee", "이순신", "010-2222-2345", "lee@daum.net"});
		data.add(new String[] {"yoo", "유관순", "010-3333-3456", "yoo@gmail.com"});
		data.add(new String[] {"sejong", "세종대왕", "010-4444-4567", "sejong@gmial.com"});
		data.add(new String[] {"shin", "신사임당", "010-5555-5678", "shin@naver.com"});
		
		model.addAttribute("List", data);
		
		return "index_07";
	}
	
	@GetMapping("array1")
	public String def(Model model) {
		
		List<DataObject> data = new ArrayList<>();
		
		data.add(new DataObject(1, "hong", "hong@naver.com"));
		data.add(new DataObject(2, "lee", "lee@daum.net"));
		data.add(new DataObject(3, "yoo", "yoo@gmail.com"));
		data.add(new DataObject(4, "sejong", "sejong@gmail.com"));
		data.add(new DataObject(5, "shin", "shin@naver.com"));
		
		model.addAttribute("Data", data);
		
		return "index_08";
		
	}
	
	@GetMapping("tax/{num}")
	public String hhh(@PathVariable("num") int tax, Model model) {
		
		model.addAttribute("tax", tax);
		
		return "index_09";
		
	}
	
	@GetMapping("href")
	public String kkk() {
		return "index_10";
	}
	
	@GetMapping("param")
	public String mmm(Model model) {
		
		model.addAttribute("name", "홍길동")
			 .addAttribute("email", "hong@naver.com");
		
		return "index_11";
		
	}
	
	@GetMapping("include")
	public String nnn() {
		return "index_12";
	}
	
}
