package com.spring.di05;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Person {
	
	private String name;
	private String juminNo;
	private String gender;
	private int age;
	private String phone;

}
