package com.kh.pill.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.event.model.dao.EventDao;
import com.kh.pill.event.model.vo.Event;
import com.kh.pill.event.model.vo.EventReply;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 이벤트 총 게시글수 조회 
	 */
	@Override
	public int selectListCount() {
		
		return eventDao.selectListCount(sqlSession);
	}

	/**
	 * 이벤트 게시글 리스트 전체 조회
	 */
	@Override
	public ArrayList<Event> SelectEventList(PageInfo pi) {
		
		return eventDao.SelectEventList(sqlSession, pi);
		
	}

	/**
	 * 이벤트 게시글 상세조회
	 */
	@Override
	public Event selectEvent(int eno) {
		
		return eventDao.selectEvent(sqlSession, eno);
	}

	@Override
	public int insertEvent(Event b) {
		
		return 0;
	}

	@Override
	public int deleteEvent(int evtNo) {
		
		return 0;
	}

	@Override
	public int updateEvent(Event b) {
		
		return 0;
	}

	/**
	 * 댓글 리스트 조회
	 */
	@Override
	public ArrayList<EventReply> selectReplyList(int evtNo) {
		
		return eventDao.selectReplyList(sqlSession, evtNo);
	}

	@Override
	public int insertReply(EventReply r) {
		
		return 0;
	}

}
