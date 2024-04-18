package com.mybatis.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> getMemberList() {
		
		return this.sqlSession.selectList("all");
		
	}

	@Override
	public int insertMember(Member dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member getMember(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int num) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Member> searchMemberList(String field, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
