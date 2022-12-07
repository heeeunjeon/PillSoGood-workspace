package com.kh.pill.product.model.service;

import java.util.ArrayList;

import com.kh.pill.product.model.vo.Product;

public interface ProductService {
	
	// 게시글 리스트 조회
	ArrayList<Product> selectList();
	
	// 게시글 작성
	int insertProduct(Product p);
	
	// 게시글 상세 조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int productNo);
	// 게시글 상세 조회 요청
	Product selectProduct(int productNo);
	
	// 게시글 삭제 서비스
	int deleteProduct(int productNo);
	
	// 게시글 수정 서비스
	int updateProduct(Product p);
}
