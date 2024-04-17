package com.spring.model;

import java.util.List;

public interface BoardDAO {
	
	List<Board> getBoardList();
	
	int insertBoard(Board dto);
	
	Board getBoardCont(int board_no);
	
	int updateBoard(Board dto);
	
	int deleteBoard(int board_no, Board dto);
	
	void updateSequence(int board_no);
	
	void updateBoardHit(int board_no);

}
