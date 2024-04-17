package com.spring.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private JdbcTemplate template;
	
	String sql = "";

	@Override
	public List<Board> getBoardList() {
		
		List<Board> list = null;
		
		sql = "select * from board order by board_no desc";
		
		return list = this.template.query(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Board dto = new Board();
				
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				
				return dto;
			}
		});
		
	}

	@Override
	public int insertBoard(final Board dto) {
		
		sql = "select max(board_no) from board";
		
		final int count = this.template.queryForInt(sql);
		
		sql = "insert into board values(?, ?, ?, ?, ?, default, sysdate, '')";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, count+1);
				ps.setString(2, dto.getBoard_writer());
				ps.setString(3, dto.getBoard_title());
				ps.setString(4, dto.getBoard_cont());
				ps.setString(5, dto.getBoard_pwd());
			}
		});
	}

	@Override
	public Board getBoardCont(int board_no) {
		
		sql = "select * from board where board_no = ?";
		
		return this.template.queryForObject(sql, new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Board dto = new Board();
				
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				
				return dto;
			}
		}, board_no);
		
	}

	@Override
	public int updateBoard(final Board dto) {
		
		sql = "select board_pwd from board where board_no = ?";
		
		String db_pwd = this.template.queryForObject(sql, String.class, dto.getBoard_no());
		
		if(dto.getBoard_pwd().equals(db_pwd)) {
			
			sql = "update board set board_title = ?, board_cont = ?, board_update = sysdate where board_no = ?";
			
			return this.template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, dto.getBoard_title());
					ps.setString(2, dto.getBoard_cont());
					ps.setInt(3, dto.getBoard_no());
				}
			});
		}else {
			return -1;
		}
		
	}

	@Override
	public int deleteBoard(final int board_no, Board dto) {
		
		sql = "select board_pwd from board where board_no = ?";
		
		String db_pwd = this.template.queryForObject(sql, String.class, board_no);
		
		if(dto.getBoard_pwd().equals(db_pwd)) {
			sql = "delete from board where board_no = ?";
			
			return this.template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setInt(1, board_no);
				}
			});
		}else {
			return -1;
		}
		
	}

	@Override
	public void updateSequence(final int board_no) {
		
		sql = "update board set board_no = board_no - 1 where board_no > ?";
		
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, board_no);
			}
		});
		
	}

	@Override
	public void updateBoardHit(final int board_no) {
		
		sql = "update board set board_hit = board_hit + 1 where board_no = ?";
		
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, board_no);				
			}
		});
		
	}

}
