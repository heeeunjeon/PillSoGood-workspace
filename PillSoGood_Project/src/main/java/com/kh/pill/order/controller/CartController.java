package com.kh.pill.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pill.member.model.vo.Member;
import com.kh.pill.order.model.service.OrderService;
import com.kh.pill.order.model.vo.Cart;

@Controller
public class CartController {
	
	@Autowired
	private OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value="insert.cart", produces="text/html; charset=UTF-8")
	public String insertCart(Cart c, HttpSession session) {
		
		int result = 0;
		
		Member member = ((Member)session.getAttribute("loginUser"));
		
		if(member != null) {
		
			c.setMemberNo(member.getMemberNo());
			orderService.insertCart(c);
			result = 1;
		} else {
			
			result = 0;
		}
		
		return (result > 0) ? "success" : "fail";
	}
	
	@RequestMapping("list.cart")
	public String enrollForm() {
		
		return "order/cart";
	}
	
	
	

}
