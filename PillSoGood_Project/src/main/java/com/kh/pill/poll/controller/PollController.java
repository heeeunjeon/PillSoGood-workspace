package com.kh.pill.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PollController {
	
	@RequestMapping("survey.po")
	public String fowardSurvey() {
		
		return "poll/pollMain";
	}
	
	@RequestMapping("surveyResult.po")
	public String fowardResult() {
		
		return "poll/pollResult";
	}
	

}
