package com.spring.di05;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		
		// 스프링 컨테이너를 생성해야 함.
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:person.xml");
		
		// 스프링 컨테이너를 이용하여 빈을 가져와야 함.
		PersonInfo info = ctx.getBean("info", PersonInfo.class);
		
		info.getPersonInfo();
		
		// 스프링 컨테이너를 사용하고 난 후에는 닫아주자.
		ctx.close();
		
	}

}
