package com.spring.aop02;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

// advice(공통 관심 사항) - 스프링에서 공통관심사항이 있는 코드들의 묶음.

@Component
@Aspect  // "공통관심사항이 모여 있는 클래스다" 라고 알려주는 애노테이션
public class MyAspect {
	
	@Pointcut("execution(* doSomething())")
	public void myPointCut() {	}
	
	
	@Before("myPointCut()")
	public void before() {
		
		System.out.println("학교에서 수업 후에 집에 와서 문을 열고 집에 들어갑니다.");
		
	}
	
	
	@AfterReturning("myPointCut()")
	public void after_returning() {
		
		System.out.println("잠을 잡니다.");
		
	}
	
	
	@AfterThrowing("myPointCut()")
	public void after_throwing() {
		
		System.out.println("화재 발생 : 119에 신고.");
		
	}
	
	
	@After("myPointCut()")
	public void after() {
		
		System.out.println("아침에 일어나서 문을 열고 학교에 가려고 집을 나옵니다.");
		
	}

}
