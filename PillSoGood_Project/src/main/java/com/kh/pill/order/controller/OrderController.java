package com.kh.pill.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String payment(HttpSession session, Model model) {
		
		// 구독 여부 전달받아서 같이 리턴해야 함
		
		// int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		int memberNo = 2;
		
		// memberNo 가 담은 Cart 의 상품 정보들 조회
		ArrayList<Cart> clist = orderService.selectCart(memberNo);
		
		ArrayList<Product> plist = new ArrayList<>();
		
		for(int i = 0; i < clist.size(); i++) {
			
			Product p = productService.selectProduct(clist.get(i).getProductNo());
			plist.add(p);
		}
		
		model.addAttribute("clist", clist);
		model.addAttribute("plist", plist);
		
		return "order/paymentPage";	
	}
	
	@RequestMapping("paid")
	public String successPage(String ono, Model model) {
		model.addAttribute("ono", ono);
		return "order/paymentSuccess";
	}
	
	@ResponseBody
	@RequestMapping(value="insert.or", produces="text/html; charset=UTF-8")
	public String insertOrder(Order o, HttpSession session, Model model) {
		
		int oresult = orderService.insertOrder(o);
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// Cart 현재 갯수와 번호들
		ArrayList<Cart> list = orderService.selectCart(memberNo);
		
		int ocresult = 1;
		int cresult = 0;
		
		if(oresult > 0) {
			
			for(int i = 0; i < list.size(); i++) {
				
				// OrderCart 에 insert
				OrderCart oc = new OrderCart(list.get(i).getCartNo(), o.getOrderNo());
				ocresult *= orderService.insertOrderCart(oc);
			}
			
			// CART 테이블에 loginUser 상품들 STATUS = 'N'
			if(ocresult > 0) {
				cresult = orderService.deleteCart(memberNo);
			}
		}
		
		return (oresult * ocresult * cresult > 0) ? "success" : "fail";
	}
}
