package com.kh.pill.poll.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.pill.member.model.vo.Member;
import com.kh.pill.order.model.vo.Cart;
import com.kh.pill.poll.model.service.PollService;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;

@Controller
public class PollController {
	
	@Autowired
	private PollService pollService;
	
	@RequestMapping("survey.po")
	public String fowardSurvey() {
		
		return "poll/pollMain";
	}
	
	@RequestMapping("surveyResult.po")
	public String fowardResult(HttpSession session, Model m) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<PollResult> prlist = pollService.selectResult(memberNo);
		
		m.addAttribute("prlist", prlist);
		
		return "poll/pollResult";
	}
	
	@ResponseBody
	@RequestMapping(value="insertPoll.po", produces="application/json; charset=UTF-8")
	public String insertPoll(int memberNo) {
		
		int result = pollService.insertPoll(memberNo);
		if(result > 0 ) {
			
			Poll p = pollService.selectPoll(memberNo);
			
			return new Gson().toJson(p);
			
		} else {
			
			return null;
			
		}
		
	};
	
	
	@ResponseBody
	@RequestMapping(value="updateMem.po", produces="text/html; charset=UTF-8")
	public void updateMem(Member m) {
		
		
		pollService.updateMember(m);
		
	}
	
	@ResponseBody
	@RequestMapping(value="insertResultType.po", produces="text/html; charset=UTF-8")
	public void insertResultType(PollResult pr) {
		
		
		pollService.insertResultType(pr);
		
	}
	
	
	@RequestMapping("insertCart.po")
	public String insertCart(String[] productCheck, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int memberNo= m.getMemberNo();
		int result = 1;
		for(int i=0; i < productCheck.length ; i++) {
			
			int productNo = Integer.parseInt(productCheck[i]);
			
			Cart c = new Cart();
			c.setMemberNo(memberNo);
			c.setProductNo(productNo);
			
			result *= pollService.insertCart(c);
			
			
		}
		
		
		if(result > 0) {
			
			return "redirect:/";
			
		} else {
			
			return null;
		}
		
	}

}
