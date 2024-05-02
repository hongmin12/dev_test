package com.goott.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
	
	private final SqlSessionTemplate sqlSession;
	
	
	public List<Board> list() {
		return this.sqlSession.selectList("Board.list");
	}
	
	public int add(Board dto) {
		return this.sqlSession.insert("Board.write", dto);
	}

}
