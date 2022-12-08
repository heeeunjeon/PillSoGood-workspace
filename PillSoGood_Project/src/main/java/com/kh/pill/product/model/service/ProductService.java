package com.kh.pill.product.model.service;

import java.util.ArrayList;

import com.kh.pill.product.model.vo.Product;

public interface ProductService {
	
	// 상품 리스트 조회
	ArrayList<Product> selectList(String filter);
	
	// 상품 작성
	int insertProduct(Product p);
	
	// 상품 상세 조회 서비스
	// 상품 조회수 증가
	int increaseCount(int productNo);
	// 상품 상세 조회 요청
	Product selectProduct(int productNo);
	
	// 상품 삭제 서비스
	int deleteProduct(int productNo);
	
	// 상품 수정 서비스
	int updateProduct(Product p);
	
}
