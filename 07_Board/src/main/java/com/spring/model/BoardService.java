package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Inject
	private BoardDAO dao;
	
	public List<Board> getBoardList() {
		return this.dao.getBoardList();
	}
	
	public int insertBoard(Board dto) {
		return this.dao.insertBoard(dto);
	}
	
	public Board getBoardCont(int board_no) {
		return this.dao.getBoardCont(board_no);
	}
	
	public int updateBoard(Board dto) {
		return this.dao.updateBoard(dto);
	}
	
	public int deleteBoard(int board_no, Board dto) {
		return this.dao.deleteBoard(board_no, dto);
	}
	
	public void updateSequence(int board_no) {
		this.dao.updateSequence(board_no);
	}
	
	public void updateBoardHit(int board_no) {
		this.dao.updateBoardHit(board_no);
	}

}
