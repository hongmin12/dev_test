package com.spring.di04;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor		// 기본 생성자 애노테이션
@AllArgsConstructor		// 인자 생성자 애노테이션
public class Message {
	
	private String msg;
	
	// 비지니스 로직
	public void printMsg() {
		
		System.out.println("메세지 >>> " + this.msg);
		
	}

}
