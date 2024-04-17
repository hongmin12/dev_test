package com.spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
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
	public int insertProduct(Product dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product getProductCont(int pnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProduct(Product dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int pnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int pnum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Category> getCategoryList() {
		
		List<Category> clist = null;
		
		sql = "select * from category";
		
		return clist = this.template.query(sql, new RowMapper<Category>() {

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
