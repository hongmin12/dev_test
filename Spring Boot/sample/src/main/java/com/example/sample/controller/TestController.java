package com.example.sample.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/*
 * - RestController 란 'REST' 를 위한 전용 컨트롤러임.
 * - REST는 'REpresentive State Transfer'의 약자로 분산 시스템을
 *   위한 아키텍쳐임. 네트워크를 경유해서 외부 서버에 접속하거나 필요한
 *   정보를 불러오기 위한 구조라고 생각하면 됨.
 * - 이 개념을 바탕으로 설계된 시스템이 'RESTFul' 이라는 시스템임.
 * - 이런 RESTFul 한 웹 서비스를 구축하기 위해 사용하는 것이 
 *   RestController 임.
 * - RestController 는 웹 애플리케이션의 일반적인 페이지(HTML 페이지)에
 *   비해 구조가 간단함. 대부분은 HTML 을 사용하지 않고 단순한 텍스트로
 *   정보를 전송함.
 * - 따라서 HTML 기반의 웹 페이지 보다도 사용 방법이 간단함.
 */

@RestController
public class TestController {
	
	@GetMapping("/hello")
	public String hello() {
		
		return "Hello, Spring Boot!!!";
	}
	
	String[] names = {"hong", "sejong", "yoo", "lee", "shin"};
	String[] emails = {"hong@naver.com", "sejong@gmail.com", "yoo@gmail.com", "lee@daum.net", "shin@naver.com"};
	
	
	@GetMapping("info")
	public List<DataObject> aaa() {
		
		List<DataObject> dList = new ArrayList<>();
		
		for(int i=0; i<names.length; i++) {
			
			DataObject e = new DataObject(i, names[i], emails[i]);
			
			dList.add(e);
		}
		
		return dList;
		
	}
	
	@GetMapping("info/{no}")
	public DataObject bbb(@PathVariable("no") int num) {
		
		return new DataObject(num, names[num], emails[num]);
	}

}
