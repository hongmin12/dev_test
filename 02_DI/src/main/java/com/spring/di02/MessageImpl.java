package com.spring.di02;

public class MessageImpl {
	
	private Message message;

	
	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	// 비지니스 로직
	public void msg() {
		
		message.printMsg();
		
	}
	
	

}
