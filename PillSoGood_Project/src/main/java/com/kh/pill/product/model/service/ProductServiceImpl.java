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
	 * 게시글 리스트 조회
	 */
	@Override
	public ArrayList<Product> selectList() {
		
		return productDao.selectList(sqlSession);
	}

	/**
	 * 게시글 작성
	 */
	@Override
	public int insertProduct(Product p) {
		
		return productDao.insertProduct(sqlSession, p);
	}

	/**
	 * 게시글 조회수 상승
	 */
	@Override
	public int increaseCount(int productNo) {
		return productDao.increaseCount(sqlSession, productNo);
	}

	/**
	 * 게시글 상세조회
	 */
	@Override
	public Product selectProduct(int productNo) {
		return productDao.selectProduct(sqlSession, productNo);
	}

	/**
	 * 게시글 삭제
	 */
	@Override
	public int deleteProduct(int productNo) {
		return productDao.deleteProduct(sqlSession, productNo);
	}

	/**
	 * 게시글 수정
	 */
	@Override
	public int updateProduct(Product p) {
		return productDao.updateProduct(sqlSession, p);
	}

}
