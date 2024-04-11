package com.spring.di02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:hello.xml");
		
		MessageImpl message = ctx.getBean("msg", MessageImpl.class);
		
		message.msg();
		
		ctx.close();
		
	}

}
