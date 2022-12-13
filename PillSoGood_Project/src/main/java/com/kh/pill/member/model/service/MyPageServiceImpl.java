package com.kh.pill.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.member.model.dao.MyPageDao;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/**
	 * 설문조사 결과 조회용 서비스
	 */
	@Override
	public ArrayList<PollResult> selectPollResult(int memberNo) {
		
		return myPageDao.selectPollResult(sqlSession, memberNo);
	}



	/**
	 * 설문조사 결과 조회용 서비스
	 */
	@Override
	public ArrayList<Poll> selectPollList(int memberNo) {
		
		return myPageDao.selectPollList(sqlSession, memberNo);
	}

}
