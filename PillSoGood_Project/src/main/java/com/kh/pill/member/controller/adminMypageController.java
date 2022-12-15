package com.kh.pill.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pill.member.model.service.MyPageService;

@Controller
public class adminMypageController {
	
	

	@Autowired
	private MyPageService adminMyPageService;
	
	
	/**
	 * 관리자 회원 정보 조회
	 * @return
	 */
	@RequestMapping("adminMypage.me")
	public String selectMemberAdMypage() {
		
		return "member/adminMyPage_memList";
		
	}
	

}
