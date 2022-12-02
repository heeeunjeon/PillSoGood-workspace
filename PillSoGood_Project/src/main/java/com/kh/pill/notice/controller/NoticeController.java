package com.kh.pill.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.notice.model.service.NoticeService;
import com.kh.pill.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount= noticeService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeListView";
		
	}
	
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		
		return "notice/noticeEnrollForm";
		
	}
	
	@RequestMapping("insert.no")
	public void insertNotice(Notice n) {
		
	}

}
