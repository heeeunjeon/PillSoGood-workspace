package com.kh.pill.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.event.model.service.EventService;
import com.kh.pill.event.model.vo.Event;
import com.kh.pill.event.model.vo.EventReply;

@Controller
public class EventController { 
	
	@Autowired
	private EventService eventService;
	
	
	/**
	 * 이벤트 게시판 전체 리스트 조회 페이지
	 */
	@RequestMapping("list.ev")
	public String SelectEventList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) { 
		
		
		int listCount = eventService.selectListCount(); // 이벤트 총 게시글수 조회 
		
		int pageLimit = 10; // 페이징바 갯수 
		int boardLimit = 5; // 페이지에 보여질 게시글 수 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Event> list = eventService.SelectEventList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "event/eventListView";
		
	}
	
	/**
	 * 이벤트 게시글 상세조회 
	 */
	@RequestMapping("detail.ev")
	public ModelAndView selectEvent(int eno, ModelAndView mv) {
		
		Event e = eventService.selectEvent(eno);
		
		if( e == null) {
			
			mv.addObject("errorMsg", "게시글 상세조회 실패").setViewName("common/errorPage");
			
		} else {
			
			mv.addObject("e", e).setViewName("event/eventDetailView");
			
			
		}
		
		return mv;
		
	}
	
	/**
	 * 댓글 리스트 조회
	 */
	@ResponseBody
	@RequestMapping(value="rlist.ev", produces="application/json; charset=UTF-8")
	public String selectReplyList(int eno) {
		
		ArrayList<EventReply> list = eventService.selectReplyList(eno);
		
		
		return new Gson().toJson(list);
		
		
		
	}
	
	

}
