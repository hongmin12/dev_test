package com.spring.di03;

import lombok.Data;

@Data
public class DAOImpl {
	
	private DAO dao;
	
	// 비지니스 로직
	public void connect() {
		
		this.dao.add();
		
	}

}
