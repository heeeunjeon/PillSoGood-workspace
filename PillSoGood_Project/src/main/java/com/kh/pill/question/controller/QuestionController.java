package com.kh.pill.question.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.common.template.Pagination;
import com.kh.pill.question.model.service.QuestionService;
import com.kh.pill.question.model.vo.Question;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("list.qu")
	public String selectQuestionList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		
		// int memberNo = (session.getAttribute("loginUser")).getMemberNo();
		int memberNo = 1;
		int listCount = questionService.selectListCount(memberNo);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Question> list = questionService.selectQuestionList(memberNo, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "question/questionListView";
	}
	
	@RequestMapping("detail.qu")
	public String selectQuestion(int qno, Model model) {
		
		Question q = questionService.selectQuestion(qno);
		
		model.addAttribute("q", q);
		
		return "question/questionDetailView";
	}
	
	@RequestMapping("enrollForm.qu")
	public String enrollForm() {
		
		return "question/questionEnrollForm";
	}
	
	@RequestMapping("insert.qu")
	public ModelAndView insertQuestion(Question q, MultipartFile upfile, HttpSession session, ModelAndView mv) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String questionImage = saveFile(upfile, session);
			
			q.setQuestionImage("/resources/questionUploadFiles/" + questionImage);
		}
		
		int result = questionService.insertQuestion(q);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "1:1 문의가 등록되었습니다");
			mv.setViewName("redirect:/list.qu");
			
		} else {
			
			mv.addObject("errorMsg", "1:1 문의 작성 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateForm.qu")
	public String updateForm() {
	
		return "question/questionUpdateForm";
	}
	
	@RequestMapping("update.qu")
	public ModelAndView updateQuestion(Question q, MultipartFile reupfile, HttpSession session, ModelAndView mv) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(!q.getQuestionImage().equals("")) {
				
				new File(session.getServletContext().getRealPath(q.getQuestionImage())).delete();
			}
			
			String questionImage = saveFile(reupfile, session);
			
			q.setQuestionImage("/resources/questionUploadFiles/" + questionImage);
		}
		
		int result = questionService.updateQuestion(q);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "1:1 문의가 수정되었습니다");
			mv.setViewName("redirect:/detail.qu?qno=" + q.getQuestionNo());
			
		} else {
			
			mv.addObject("errorMsg", "1:1 문의 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int random = (int)(Math.random() * 90000) + 10000;
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + random + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/questionUploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
