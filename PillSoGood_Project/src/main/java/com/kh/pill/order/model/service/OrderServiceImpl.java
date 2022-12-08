package com.kh.pill.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.order.model.dao.OrderDao;
import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.order.model.vo.OrderCart;
import com.kh.pill.product.model.vo.Product;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertOrder(Order o) {
		return orderDao.insertOrder(sqlSession, o);
	}

	@Override
	public ArrayList<Cart> selectCart(int memberNo) {
		return orderDao.selectCart(sqlSession, memberNo);
	}
	
	@Override
	public int insertOrderCart(OrderCart oc) {
		return orderDao.insertOrderCart(sqlSession, oc);
	}

	@Override
	public int deleteCart(int memberNo) {
		return orderDao.deleteCart(sqlSession, memberNo);
	}

	@Override
	public int updateOrder(Order o) {
		return orderDao.updateOrder(sqlSession, o);
	}

	@Override
	public int deleteOrder(int orderNo) {
		return orderDao.deleteOrder(sqlSession, orderNo);
	}



}
