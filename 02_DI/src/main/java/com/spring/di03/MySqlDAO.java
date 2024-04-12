package com.spring.di03;

public class MySqlDAO implements DAO{

	@Override
	public void add() {
		
		System.out.println("MySqlDAO 데이터베이스 연동입니다.~~~");
		
	}
	
}
