package com.spring.di03;

public class OracleDAO implements DAO{

	@Override
	public void add() {

		System.out.println("OracleDAO 데이터베이스 연동입니다.~~~");
		
	}

}
