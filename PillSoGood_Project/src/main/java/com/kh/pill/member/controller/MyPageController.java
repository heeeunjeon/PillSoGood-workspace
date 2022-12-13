package com.kh.pill.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pill.member.model.service.MyPageService;
import com.kh.pill.member.model.vo.Member;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;

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
