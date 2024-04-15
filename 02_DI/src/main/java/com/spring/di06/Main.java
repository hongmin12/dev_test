package com.spring.di06;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		
		// 스프링 컨테이너를 생성해야 함.
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:baseball.xml", 
																			"classpath:baseballTeam.xml");
		
		// 스프링 컨테이너를 이용하여 빈을 가져와야 함.
		PlayerInfo player = ctx.getBean("info", PlayerInfo.class);
		
		player.getPlayerInfo();
		
		System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;");
		
		BaseballTeam team = (BaseballTeam)ctx.getBean("team");
		
		System.out.println("::: 국가대표 야구선수단 :::");
		
		System.out.println("대표팀 감독 >>>" + team.getManager());
		System.out.println("대표팀 타격코치 >>>" + team.getBattingCoach());
		System.out.println("대표팀 투수코치 >>>" + team.getPitchingCoach());
		System.out.println("대표팀 타자 >>>" + team.getHitter());
		System.out.println("대표팀 투수 >>>" + team.getPitcher());
		
		// 스프링 컨테이너를 사용하고 난 후에는 닫아주자.
		ctx.close();
		
	}

}
