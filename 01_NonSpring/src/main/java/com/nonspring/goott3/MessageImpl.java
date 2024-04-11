package com.nonspring.goott3;

public class MessageImpl {
	
	private Message message;
	
	
	public MessageImpl() { }		// 기본 생성자
	
	public MessageImpl(Message message) { 
		
		this.message = message;
		
	}  // 인자 생성자

	
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
