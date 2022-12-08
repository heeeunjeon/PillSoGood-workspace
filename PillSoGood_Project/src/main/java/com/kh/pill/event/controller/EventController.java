package com.kh.pill.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	
	/**
	 * 이벤트 작성폼으로 이동하는 메소드
	 */
	@RequestMapping("enrollForm.ev")
	public String enrollForm() {
		return "event/eventEnrollForm";
	}
	
	
	/**
	 * 이벤트 게시글 추가하는 메소드
	 */
	@RequestMapping("insert.ev")
	public ModelAndView insertEvent(Event e, MultipartFile upfile, HttpSession session, ModelAndView mv) {
		
		// 새로 넘어온 첨부파일이 있는 경우 
		if(!upfile.getOriginalFilename().contentEquals("")) {
			
			// 넘어온 첨부파일을 수정명으로 바꾸고 서버에 업로드 
			String ChangeName = saveFile(upfile, session);
			
			// e에 새로넘어온 첨부파일에 대한 수정파일명 필드에 담기 
			e.setEvtImgName("resources/eventUploadFiles/" + ChangeName);
			
			
			// System.out.println(ChangeName);
		}
		
		
		
		int result = eventService.insertEvent(e);
		
		
		
		if (result > 0) { // 성공, 게시글 리스트 페이지로 이동 (list.ev)
			
			session.setAttribute("alertMsg", "성공적으로 이벤트가 등록되었습니다.");
			mv.setViewName("redirect:/list.ev");
			
		} else { // 실패, 에러페이지로 이동 
			
			mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	/**
	 * 이벤트 게시물 업로드할때 파일명 수정해주는 메소드
	 */
	private String saveFile(MultipartFile upfile, HttpSession session) {
		// 파일명 수정 먼저하기 
		String originName = upfile.getOriginalFilename(); // 원본 파일명 
		
		// 시간 형식을 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 뒤에 붙을 5자리 랜덤값 
		int ranNum = (int)(Math.random()*90000) + 10000; // 5자리 랜덤값 
		
		// 원본파일로부터 확장자만 뽑기 (.png)
		String ext = originName.substring(originName.lastIndexOf(".")); 
		
		// 이어 붙이기 
		String ChangeName = currentTime + ranNum + ext;
		
		
		
		// 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기 
		String savePath = session.getServletContext().getRealPath("/resources/eventUploadFiles/");
		
		try {
			upfile.transferTo((new File(savePath + ChangeName)));
		
		} catch (IllegalStateException | IOException e1) {
			
			e1.printStackTrace();
		}
		
		return ChangeName;
	}
	
	/**
	 * 이벤트 게시물 삭제
	 */
	@RequestMapping("delete.ev")
	public String deleteEvent(int eno, String evtImgName, HttpSession session, Model model) {
		
		int result = eventService.deleteEvent(eno);
		
		if(result > 0) { // 게시글 삭제 성공 
			
			// 파일 경로
			// String realPath = session.getServletContext().getRealPath("/resources/eventUploadFiles/");
			
			// 현재 삭제 성공된 게시글에 존재하는 파일 객체의 변수 지정 
			// new File("/"+evtImgName);
			// File file = new File("/"+evtImgName);
			
			// if(file.exists()) { // 파일이 존재하면
			/*
			if(!evtImgName.equals("")) {
				System.out.println(evtImgName);
				
				file.delete(); // 파일 삭제	
			}
			*/
			
			// 게시글 삭제를 위해 실제 경로를 다시 불러와줘야함! 
			// evtImgName에는 수정파일명만 들어있는 상태
			// realPath로 실제경로와 함께 수정명을 담아줘야함 
			String realPath = session.getServletContext().getRealPath(evtImgName); // "/resources/eventUploadFiles/수정명.jpg"
			new File(realPath).delete();
			
			
			
			// 게시판 리스트 페이지로 이동 
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/list.ev";
			
		} else { // 게시글 삭제 실패 
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
		
	}
	
	

}





























