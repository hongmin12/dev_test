package com.mybatis.model;

import java.util.List;

public interface ProductDAO {
	
	// 전체 제품 리스트 조회 추상 메서드.
	List<Product> getProductsList();
	
	// 전체 카테고리 리스트 조회 추상 메서드.
	List<Category> getCategoryList();
	
	// 제품 등록 추상 메서드.
	int insertProduct(Product dto);
	
	// 제품 번호에 해당하는 제품의 상세 내역 조회 추상 메서드.
	Product contentProduct(int no);
	
	// 제품 정보 수정 추상 메서드.
	int updateProduct(Product dto);
	
	// 제품 삭제 추상 메서드.
	int deleteProduct(int no);
	
	// 제품 삭제 시 제품 번호 재작업 추상 메서드.
	void updateSequence(int no);

}
