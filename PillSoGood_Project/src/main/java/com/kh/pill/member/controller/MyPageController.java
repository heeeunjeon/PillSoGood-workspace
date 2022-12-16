package com.kh.pill.member.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.member.model.service.MyPageService;
import com.kh.pill.member.model.vo.Member;
import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;
import com.kh.pill.product.model.vo.Product;

@Controller
public class MyPageController {
	
//	
	
	@Autowired
	private MyPageService myPageService;
	
	/**
	 * 주문조회 페이지
	 * @return
	 */
	@RequestMapping("myPage.or")
	public String myPageOrderList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int listCount = myPageService.selectMyOrderListCount(memberNo);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Order> olist = myPageService.selectMyOrderList(pi, memberNo);
		
		for(Order o : olist) {
			
			ArrayList<Product> plist = myPageService.selectMyOrderProducts(o.getOrderNo());
			String[] str = new String[plist.size()];
			
			for(int i = 0; i < plist.size(); i++) {
				 str[i] = plist.get(i).getProductName();
			}
			o.setProductNames(String.join(" & ", str));
			
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("olist", olist);
		
		return "member/myPage_OrderList";
	}
	
	/**
	 * 주문조회 기간별 검색
	 * @return
	 */
	@RequestMapping("search.or")
	public String searchOrderListByDate(@RequestParam(value="cpage", defaultValue="1")int currentPage, String s, String e, HttpSession session, Model model) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// s == 시작날짜 (3, 6, 12 / 지정한 날짜)
		// e == 종료날짜 (0 오늘 / 지정한 날짜)
		LocalDate today = LocalDate.now();
		LocalDate startDate = null;
		LocalDate endDate = today;
		
		if(s.equals("3") || s.equals("6") || s.equals("12")) {
			startDate = today.minusMonths(Integer.parseInt(s));
		} else {
			startDate = LocalDate.parse(s);
			endDate = LocalDate.parse(e);
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("startDate", startDate.toString() + " 00:00:00");
		map.put("endDate", endDate.toString() + " 23:59:59");
		map.put("memberNo", String.valueOf(memberNo));
		
		int listCount = myPageService.searchOrderListByDateCount(map);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Order> olist = myPageService.searchOrderListByDate(pi, map);
		
		for(Order od : olist) {
			
			ArrayList<Product> plist = myPageService.selectMyOrderProducts(od.getOrderNo());
			String[] str = new String[plist.size()];
			
			for(int i = 0; i < plist.size(); i++) {
				 str[i] = plist.get(i).getProductName();
			}
			
			od.setProductNames(String.join(" & ", str));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("olist", olist);
		
		model.addAttribute("s", s);
		model.addAttribute("e", e);
		
		return "member/myPage_OrderList";
	}
	
	/**
	 * 주문 상세조회
	 * @return
	 */
	@RequestMapping("detail.or")
	public String selectMyOrder(String ono, Model model) {
		
		Order o = myPageService.selectMyOrder(ono);
		
		ArrayList<Cart> clist = myPageService.selectMyOrderCarts(ono);
		
		ArrayList<Product> plist = myPageService.selectMyOrderProducts(ono);
		
		model.addAttribute("o", o);
		model.addAttribute("clist", clist);
		model.addAttribute("plist", plist);
		
		return "member/myPage_OrderDetail";
	}
	
	
	
	/**
	 * 구독관리 페이지
	 * @return
	 */
	@RequestMapping("myPage.subs")
	public String myPageSubsList() {
		
		return "member/myPage_SubsList";
	}
	
	/**
	 * 구독 상세조회
	 * @return
	 */
	@RequestMapping("detail.subs")
	public String selectMySubs(HttpSession session, Model model) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		Order o = myPageService.selectMySubs(memberNo);
		
		ArrayList<Product> plist = myPageService.selectMyOrderProducts(o.getOrderNo());
		String str = "";
		
		for(int i = 0; i < plist.size(); i++) {
			 str = plist.get(0).getProductName();
			 break;
		}
		
		str += " 외 " + (plist.size() - 1);
		
		o.setProductNames(str);
		
		// 현재 진행중인 구독의 첫 결제일
		String date = myPageService.selectMyFirstSubs(memberNo);
		
		// 다음 결제 예정일
		LocalDate next = LocalDate.parse(o.getOrderDate());
		next = next.plusMonths(1);
		
		model.addAttribute("o", o);
		model.addAttribute("plist", plist);
		model.addAttribute("next", next.toString());
		model.addAttribute("date", date);
		
		return "member/myPage_SubsDetail";
	}
	
	
	
	
	
	/**
	 * 내 정보 관리 페이지
	 * @return
	 */
	@RequestMapping("myPage.info")
	public String myPageInfoList() {
		
		
		return "member/myPage_InfoList";
	}
	
	
	
	
	/**
	 * 설문조사 페이지
	 * @return
	 */
	@RequestMapping("myPage.poll")
	public String myPagePollList(HttpSession session, Model m) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<Poll> pollList = myPageService.selectPollList(memberNo);
		ArrayList<PollResult> pollResult = myPageService.selectPollResult(memberNo);
		
		m.addAttribute("pollList", pollList);
		m.addAttribute("pollResult", pollResult);
				
		return "member/myPage_PollList";
	}
	
	
	
	/**
	 * 상품 찜목록 페이지
	 * @return
	 */
	@RequestMapping("myPage.prod")
	public String myPageProductList() {
		
		return "member/myPage_ProductList";
	}
	
	
	
	/**
	 * 내 후기조회 페이지
	 * @return
	 */
	@RequestMapping("myPage.re")
	public String myPageReviewList() {
		
		return "member/myPage_ReviewList";
	}
	
	
	
	
	/**
	 * 
	 * 이벤트 좋아요 페이지 
	 * @return
	 */
	@RequestMapping("myPage.ev")
	public String myPageEventList() {
		
		return "member/myPage_EventList";
	}
	
	
	
	

}
