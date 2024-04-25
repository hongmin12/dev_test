package com.mybatis.model;

import java.util.List;

public interface EmpDAO {
	
	// emp 테이블의 전체 사원 목록을 조회하는 추상 메서드.
	List<Emp> getEmpList();
	
	// 사원을 추가하는 추상 메서드.
	int insertEmp(Emp dto);
	
	// 사원을 조회하는 추상 메서드.
	Emp getEmp(int no);
	
	// 사원의 정보를 수정하는 추상 메서드.
	int updateEmp(Emp dto);
	
	// 사원을 삭제하는 추상 메서드.
	int deleteEmp(int no);
	
	// emp 테이블의 담당업무를 조회하는 추상 메서드.
	List<String> getJobList();
	
	// emp 테이블의 관리자를 조회하는 추상 메서드.
	List<Emp> getMgrList();
	
	// dept 테이블의 전체 부서를 조회하는 추상 메서드.
	List<Dept> getDeptList();
	
}
