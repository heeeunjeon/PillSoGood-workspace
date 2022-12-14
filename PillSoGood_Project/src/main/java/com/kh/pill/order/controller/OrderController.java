package com.kh.pill.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pill.member.model.vo.Member;
import com.kh.pill.order.model.service.OrderService;
import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.order.model.vo.OrderCart;
import com.kh.pill.product.model.service.ProductService;
import com.kh.pill.product.model.vo.Product;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("pay.or")
	public String payment(int num, HttpSession session, Model model) {
		
		// 구독 여부 num = 정기결제 1, 일반결제 2
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// memberNo 가 담은 Cart 의 상품 정보들 조회
		ArrayList<Cart> clist = orderService.selectCart(memberNo);
		
		ArrayList<Product> plist = new ArrayList<>();
		
		for(int i = 0; i < clist.size(); i++) {
			
			Product p = productService.selectProduct(clist.get(i).getProductNo());
			plist.add(p);
		}
		
		model.addAttribute("clist", clist);
		model.addAttribute("plist", plist);
		model.addAttribute("num", num);
		
		return "order/paymentPage";	
	}
	
	@RequestMapping("paid")
	public String successPage(String ono, Model model) {
		model.addAttribute("ono", ono);
		return "order/paymentSuccess";
	}
	

}
