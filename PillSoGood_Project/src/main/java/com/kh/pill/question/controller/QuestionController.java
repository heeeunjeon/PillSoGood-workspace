package com.kh.pill.question.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {
	
	@RequestMapping("list.qu")
	public String selectQuestionList() {
		
		return "question/questionListView";
	}
	
	@RequestMapping("detail.qu")
	public String selectQuestion() {
		
		return "question/questionDetailView";
	}
	
	@RequestMapping("enrollForm.qu")
	public String enrollForm() {
		
		return "question/questionEnrollForm";
	}
	
	@RequestMapping("insert.qu")
	public String insertQuestion() {
		
		return "";
	}
}
