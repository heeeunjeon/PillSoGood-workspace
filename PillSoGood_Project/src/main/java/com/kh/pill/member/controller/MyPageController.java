package com.kh.pill.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
//	
	
	
	/**
	 * 주문조회 페이지
	 * @return
	 */
	@RequestMapping("myPage.or")
	public String myPageOrderList() {
		
		return "member/myPage_OrderList";
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
	 * 내 정보 관리 페이지
	 * @return
	 */
	@RequestMapping("myPage.info")
	public String myPageInfoList() {
		
		
		return "member/myPage_InfoList";
	}
	
	
	@RequestMapping("myPage.poll")
	public String myPagePollList() {
		
		return "member/myPage_PollList";
	}
	
	@RequestMapping("myPage.prod")
	public String myPageProductList() {
		
		return "member/myPage_ProductList";
	}
	
	@RequestMapping("myPage.re")
	public String myPageReviewList() {
		
		return "member/myPage_ReviewList";
	}
	
	@RequestMapping("myPage.ev")
	public String myPageEventList() {
		
		return "member/myPage_EventList";
	}
	
	
	
	

}
