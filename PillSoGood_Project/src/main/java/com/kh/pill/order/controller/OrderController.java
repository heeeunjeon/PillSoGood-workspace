package com.kh.pill.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pill.order.model.vo.Order;

@Controller
public class OrderController {

	@RequestMapping("pay.or")
	public String payment() {
		return "order/paymentPage";	
	}
	
	@RequestMapping("insert.or")
	public void insertOrder(Order o) {
		
		// CART 테이블에 loginUser 상품들 STATUS = 'N'
		// 구독 여부 체크
	}
}
