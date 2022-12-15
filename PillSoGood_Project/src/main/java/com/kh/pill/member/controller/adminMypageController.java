package com.kh.pill.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.member.model.service.adminMypageService;
import com.kh.pill.member.model.vo.Member;

@Controller
public class adminMypageController {
	
	

	@Autowired
	private adminMypageService adMypageService; 
	
	
	/**
	 * 관리자 회원 정보 조회
	 */
	@RequestMapping("adminMypage.me")
	public String selectMemberAdMypage(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		// 회원 정보 수 구하기
		int listCount = adMypageService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 회원 정보 조회
		ArrayList<Member> list = adMypageService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		
		return "member/adminMyPage_memList";
		
	}
	
	/**
	 * 관리자 회원 상세 조회
	 */
	@RequestMapping("adMyPageDetail.me")
	public String selectDetailMemberAdMypage(int mno, Model model) {
		
		Member m = adMypageService.selectMember(mno);
		
		if( m == null) {
			
			model.addAttribute("errorMsg", "게시글 상세조회 실패");
			return "common/errorPage";
			
		} else {
			
			model.addAttribute("m", m);
			return "member/adminMyPage_memDetail";
			
		}
		

		
	}
	

}
