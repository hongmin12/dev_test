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
		
		return this.sqlSession.insert("add", dto);
		
	}

	@Override
	public Member getMember(int num) {
		
		return this.sqlSession.selectOne("cont", num);
		
	}

	@Override
	public int updateMember(Member dto) {
		return this.sqlSession.update("upd", dto);
	}

	@Override
	public int deleteMember(int num) {
		return this.sqlSession.delete("del", num);
	}

	@Override
	public void updateSequence(int num) {
		this.sqlSession.update("seq", num);

	}

	@Override
	public List<Member> searchMemberList(String field, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
