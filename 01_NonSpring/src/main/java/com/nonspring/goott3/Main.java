package com.nonspring.goott3;

public class Main {
	
	public static void main(String[] args) {
		
		// 영문으로 인사말을 전하고 싶은 경우
		// 1. 인자 생성자를 이용하여 객체를 주입.
		// Message msg = new MessageEN();
		
		// MessageImpl impl = new MessageImpl(new MessageEN());
		
		// impl.msg();
		
		// 한글로 인사말을 전하고 싶은 경우
		// 2. setter() 메서드를 이용하여 주입.
		MessageImpl impl2 = new MessageImpl();
		
		impl2.setMessage(new MessageKR());
		
		impl2.msg();
		
	}

}
