package com.kh.pill.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.pill.alarm.model.service.AlarmService;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;

}
