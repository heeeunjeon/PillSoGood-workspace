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

}
