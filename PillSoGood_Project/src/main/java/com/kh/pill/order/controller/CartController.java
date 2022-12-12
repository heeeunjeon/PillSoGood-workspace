package com.kh.pill.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pill.order.model.service.OrderService;
import com.kh.pill.product.model.vo.Product;

@Controller
public class CartController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("insert.cart")
	public void insertCart() {
		
		
	}

}
