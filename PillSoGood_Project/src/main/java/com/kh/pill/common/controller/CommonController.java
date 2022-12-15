package com.kh.pill.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping("aboutUs.pill")
	public String fowardAboutUs() {
		
		return "common/aboutUs";
	}
	
	@RequestMapping("faq.pill")
	public String fowardFAQ() {
		
		return "common/faq";
	}

}
