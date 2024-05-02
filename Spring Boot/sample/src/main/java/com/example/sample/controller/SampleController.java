package com.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/*
 * 우선은 패키지를 만들 때 주의해야 하는 내용이 있음.
 * - 스프링 부트에서는 @Controller 애노테이션에서 지정한 url을
 *   찾지 못하는 경우가 있음.
 * - 그 이유는 해당 @Controller 애노테이션이 붙어 있는 컨트롤러
 *   클래스는 메인 클래스(xxxApplication.class)가 위치한 패키지의
 *   하위에 위치해야 함.
 * - 스프링 부트는 시작점인 메인 클래스가 위치한 하위 패키지에 있는
 *   클래스들을 검색하여 Bean으로 등록을 하기 때문에 하위 패키지에
 *   속하지 않는다면 스프링 부트 컨테이너는 해당 클래스를 Bean으로
 *   등록을 하지 않게 됨.
 */

@Controller
public class SampleController {
	
	@GetMapping("/")
	public String main() {
		
		return "main";
	}
	
	@GetMapping("/{num}")
	public String aaa(@PathVariable("num") int no, Model model) {
		
		model.addAttribute("No", no);
		
		return "index";
	}
	
	

}
