package com.kh.pill.product.model.service;

import java.util.ArrayList;

import com.kh.pill.product.model.vo.Product;

public interface ProductService {
	
	// 게시글 리스트 조회
	ArrayList<Product> selectList();
	
	// 게시글 작성
	int insertProduct(Product p);

}
