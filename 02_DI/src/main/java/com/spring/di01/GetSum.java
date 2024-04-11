package com.spring.di01;

import lombok.Data;

@Data
public class GetSum {
	
	private int su1;
	private int su2;
	
	// 비지니스 로직
	public void hap() {
		
		System.out.println("더하기 >>> " + (su1 + su2));
		
	}
	
	

}
