package com.spring.di06;

import java.util.ArrayList;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Player {
	
	private String name;
	private int age;
	private ArrayList<String> position;
	private double weight;
	private double height;
	

}
