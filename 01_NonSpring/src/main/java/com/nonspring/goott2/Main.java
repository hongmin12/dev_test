package com.nonspring.goott2;

public class Main {
	
	public static void main(String[] args) {
		
		// 영문으로 인사말을 전하고 싶은 경우
		// Message msg = new MessageEN();
		
		// 한글로 인사말을 전하고 싶은 경우
		Message msg = new MessageKR();
		
		msg.printMsg();
		
	}

}
