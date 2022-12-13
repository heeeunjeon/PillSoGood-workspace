package com.kh.pill.order.model.service;

import java.util.ArrayList;

import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.order.model.vo.OrderCart;

public interface OrderService {
	
	// 구독회차 조회
	int selectCountByCustomerUid(String customerUid);
	
	// 주문 완료 (저장)
	// Order insert -> Cart select -> OrderCart insert -> Cart update
	int insertOrder(Order o);
	ArrayList<Cart> selectCart(int memberNo);
	int insertOrderCart(OrderCart oc);
	int deleteCart(int memberNo);
	
	// 주문 수정 (관리자만)
	int updateOrder(Order o);
	
	// 주문 취소 (삭제)
	int deleteOrder(int orderNo);
	
	
}
