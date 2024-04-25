package com.mybatis.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Emp> getEmpList() {
		return this.sqlSession.selectList("list");
	}

	@Override
	public int insertEmp(Emp dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public Emp getEmp(int no) {
		return this.sqlSession.selectOne("one", no);
	}

	@Override
	public int updateEmp(Emp dto) {
		return this.sqlSession.update("modi", dto);
	}

	@Override
	public int deleteEmp(int no) {
		return this.sqlSession.delete("del", no);
	}

	@Override
	public List<String> getJobList() {
		return this.sqlSession.selectList("jList");
	}

	@Override
	public List<Emp> getMgrList() {
		return this.sqlSession.selectList("mList");
	}

	@Override
	public List<Dept> getDeptList() {
		return this.sqlSession.selectList("dList");
	}

}
