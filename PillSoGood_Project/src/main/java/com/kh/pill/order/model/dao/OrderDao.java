package com.kh.pill.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.order.model.vo.OrderCart;

@Repository
public class OrderDao {
	
	public int selectCountByCustomerUid(SqlSessionTemplate sqlSession, String customerUid) {
		return sqlSession.selectOne("orderMapper.selectCountByCustomerUid", customerUid);
	}
	
	public int insertOrder(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("orderMapper.insertOrder", o);
	}
	
	public ArrayList<Cart> selectCart(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectCart", memberNo);
	}
	
	public int insertOrderCart(SqlSessionTemplate sqlSession, OrderCart oc) {
		return sqlSession.insert("orderMapper.insertOrderCart", oc);
	}

	public int deleteCart(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.update("orderMapper.deleteCart", memberNo);
	}

	public int updateOrder(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("orderMapper.updateOrder", o);
	}

	public int deleteOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("orderMapper.deleteOrder", orderNo);
	}
}
