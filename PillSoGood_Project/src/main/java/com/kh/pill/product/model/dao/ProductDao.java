package com.kh.pill.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.product.model.vo.Product;

@Repository
public class ProductDao {
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList");
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("productMapper.insertProduct", p);
	}

}
