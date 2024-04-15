package com.spring.di07;

import java.util.*;

import lombok.*;

@Data
public class MapTest {
	
	private Map<Integer, String> map;
	
	// 비지니스 로직
	void output() {
		// keySet() : Map 에 있는 키를 전부 다 가져오는 메서드.
		Set<Integer> set = map.keySet();
		
		for(Integer k : set) {
			
			System.out.println(k + ">>> " +map.get(k));
		}
		
	}

}
