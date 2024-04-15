package com.spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberDAOImpl implements MemberDAO{

	private JdbcTemplate template;
	
	
	public MemberDAOImpl(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	String sql = null;
	
	
	@Override
	public List<Member> getMemberList() {
		
		List<Member> list = null;
		
		sql = "select * from member order by memno desc";
		
		return list = this.template.query(sql, new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Member dto = new Member();
				
				dto.setMemno(rs.getInt("memno"));
				dto.setMemid(rs.getString("memid"));
				dto.setMemname(rs.getString("memname"));
				dto.setMempwd(rs.getString("mempwd"));
				dto.setAge(rs.getInt("age"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setJob(rs.getString("job"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;
			}
		});
		
	}

	@Override
	public int insertMember(Member dto) {
		
		return 0;
	}

	@Override
	public Member getMember(int memno) {
		
		return null;
	}

	@Override
	public int updateMember(Member dto) {
		
		return 0;
	}

	@Override
	public int deleteMember(int memno) {
		
		return 0;
	}

	@Override
	public void updateSequence(int memno) {
		
		
	}

}
