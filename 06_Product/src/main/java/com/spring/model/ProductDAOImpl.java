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

// spring에서 일반적으로 DAO 클래스에는
// @Repository 애노테이션을 붙여서 사용함.
@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private JdbcTemplate template;
	
	String sql = null;
	
	@Override
	public List<Product> getProductList() {
		
		List<Product> list = null;
		
		sql = "select * from products order by pnum desc";
		
		return list = this.template.query(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Product dto = new Product();
				
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				
				return dto;
			}
		});
	}

	@Override
	public int insertProduct(final Product dto) {
		
		sql = "select max(pnum) from products";
		
		final int count = this.template.queryForInt(sql);
		
		sql = "insert into products values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, count+1);
				ps.setString(2, dto.getCategory_fk());
				ps.setString(3, dto.getProducts_name());
				ps.setString(4, dto.getEp_code_fk());
				ps.setInt(5, dto.getInput_price());
				ps.setInt(6, dto.getOutput_price());
				ps.setInt(7, dto.getTrans_cost());
				ps.setInt(8, dto.getMileage());
				ps.setString(9, dto.getCompany());
			}
		});
		
	}

	@Override
	public Product getProductCont(int pnum) {
		
		sql = "select * from products where pnum = ?";
		
		return this.template.queryForObject(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Product dto = new Product();
				
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				
				return dto;
				
			}
		}, pnum);
		
	}

	@Override
	public int updateProduct(final Product dto) {
		
		sql = "update products set input_price = ?, output_price = ?, trans_cost = ?, mileage = ? where pnum = ?";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, dto.getInput_price());
				ps.setInt(2, dto.getOutput_price());
				ps.setInt(3, dto.getTrans_cost());
				ps.setInt(4, dto.getMileage());
				ps.setInt(5, dto.getPnum());
				
			}
		});
		
	}

	@Override
	public int deleteProduct(final int pnum) {
		
		sql = "delete from products where pnum = ?";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, pnum);
			}
		});
		
	}

	@Override
	public void updateSequence(final int pnum) {
		
		sql = "update products set pnum = pnum - 1 where pnum > ?";
		
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, pnum);
			}
		});
		
	}

	@Override
	public List<Category> getCategoryList() {
		
		List<Category> cList = null;
		
		sql = "select * from category order by cnum desc";
		
		return cList = this.template.query(sql, new RowMapper<Category>() {

			@Override
			public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Category dto = new Category();
				
				dto.setCnum(rs.getInt("cnum"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				
				return dto;
			}
		});
	}

}
