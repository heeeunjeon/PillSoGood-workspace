package com.kh.pill.order.controller;

import java.util.ArrayList;
import java.util.Date;

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
		
		// num == 1 일 때, 현재 진행중인 구독상품이 있는지 확인
		int check = 0;
		if(num == 1) {
			check = orderService.checkSubscribing(memberNo);
		}
		
		if(check > 0) {
			
			session.setAttribute("alertMsg", "현재 정기구독 서비스를 이용 중입니다.\\n\\n새로운 정기구독을 원하실 경우,\\n기존의 정기구독 서비스를 해지 후 이용해주세요.");
			return "redirect:myPage.subs";
		} else {
			
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
	}
	
	@RequestMapping("paid")
	public String successPage(String ono, Model model) {
		model.addAttribute("ono", ono);
		return "order/paymentSuccess";
	}
	
	@ResponseBody
	@RequestMapping(value="delete.or", produces="text/html; charset=UTF-8")
	public String deleteOrder(Order o) {
		
		int result = 0;
		
		if(o.getSubsStatus().equals("N")) {
			result = orderService.deleteOrder(o);
		} else {
			result = orderService.deleteSubs(o);
		}
		
		return (result > 0) ? "success" : "fail";
	}
	

}
