package com.mybatis.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Product> getProductsList() {
		return this.sqlSession.selectList("list");
	}

	@Override
	public List<Category> getCategoryList() {
		return this.sqlSession.selectList("clist");
	}

	@Override
	public int insertProduct(Product dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public Product contentProduct(int no) {
		return this.sqlSession.selectOne("cont", no);
	}

	@Override
	public int updateProduct(Product dto) {
		return this.sqlSession.update("mod", dto);
	}

	@Override
	public int deleteProduct(int no) {
		return this.sqlSession.delete("del", no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("seq", no);
	}

}
