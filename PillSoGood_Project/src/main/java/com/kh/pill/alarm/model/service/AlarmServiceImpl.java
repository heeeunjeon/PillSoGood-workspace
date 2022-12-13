package com.kh.pill.alarm.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.alarm.model.dao.AlarmDao;

@Service
public class AlarmServiceImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao alarmDao;

}
