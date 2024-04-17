package com.spring.model;

import java.util.List;

public interface ProductDAO {

	List<Product> getProductList();
	
	int insertProduct(Product dto);
	
	Product getProductCont(int pnum);
	
	int updateProduct(Product dto);
	
	int deleteProduct(int pnum);
	
	void updateSequence(int pnum);
	
	List<Category> getCategoryList();

}


