package com.mybatis.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("cnt");
	}

	@Override
	public List<Board> getBoardList(Page pdto) {
		return this.sqlSession.selectList("list", pdto);
	}

	@Override
	public int insertBoard(Board dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public void readCount(int no) {
		this.sqlSession.update("hit", no);
	}

	@Override
	public Board boardContent(int no) {
		return this.sqlSession.selectOne("cont", no);
	}

	@Override
	public int updateBoard(Board dto) {
		return this.sqlSession.update("update", dto);
	}

	@Override
	public int deleteBoard(int no) {
		return this.sqlSession.delete("del", no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("seq", no);
	}

	@Override
	public int searchBoardCount(Map<String, String> map) {
		return this.sqlSession.selectOne("count", map);
	}

	@Override
	public List<Board> searchBoardList(Page pdto) {
		return this.sqlSession.selectList("search", pdto);
	}

}
