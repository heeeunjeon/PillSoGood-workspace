package com.kh.pill.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.product.model.dao.ProductDao;
import com.kh.pill.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 상품 리스트 조회
	 */
	@Override
	public ArrayList<Product> selectList(String filter) {
		
		return productDao.selectList(sqlSession, filter);
	}

	/**
	 * 상품 작성
	 */
	@Override
	public int insertProduct(Product p) {
		
		return productDao.insertProduct(sqlSession, p);
	}

	/**
	 * 상품 조회수 상승
	 */
	@Override
	public int increaseCount(int productNo) {
		return productDao.increaseCount(sqlSession, productNo);
	}

	/**
	 * 상품 상세조회
	 */
	@Override
	public Product selectProduct(int productNo) {
		return productDao.selectProduct(sqlSession, productNo);
	}

	/**
	 * 상품 삭제
	 */
	@Override
	public int deleteProduct(int productNo) {
		return productDao.deleteProduct(sqlSession, productNo);
	}

	/**
	 * 상품 수정
	 */
	@Override
	public int updateProduct(Product p) {
		return productDao.updateProduct(sqlSession, p);
	}

}
