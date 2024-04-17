package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Inject
	private ProductDAO dao;
	
	public List<Product> getList() {
		return this.dao.getProductList();
	}
	
	public int insert(Product dto) {
		return this.dao.insertProduct(dto);
	}
	
	public Product content(int pnum) {
		return this.dao.getProductCont(pnum);
	}
	
	public int update(Product dto) {
		return this.dao.updateProduct(dto);
	}
	
	public int delete(int pnum) {
		return this.dao.deleteProduct(pnum);
	}
	
	public void sequence(int pnum) {
		this.dao.updateSequence(pnum);
	}
	
	public List<Category> categoryList() {
		return this.dao.getCategoryList();
	}
	
}
