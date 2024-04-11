package com.nonspring.goott;

public class Main {

	public static void main(String[] args) {
		
		// 영문으로 인사말을 출력하는 경우
		// MessageEN english = new MessageEN();
		
		// english.printMsg();
		
		// 한글로 인사말을 출력하는 내용으로 수정.
		MessageKR korean = new MessageKR();
		
		korean.printMsg();

	}

}
