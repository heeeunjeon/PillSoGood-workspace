package com.kh.pill.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.event.model.vo.Event;
import com.kh.pill.event.model.vo.EventReply;

@Repository
public class EventDao {
	
	/**
	 * 이벤트 총 게시글수 조회 
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("eventMapper.selectListCount");
	}
	

	/** 
	 * 이벤트 게시글 리스트 전체 조회
	 */
	public ArrayList<Event> SelectEventList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList", null, rowBounds);
	}

	
	/**
	 * 이벤트 게시글 상세조회 
	 */
	public Event selectEvent(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.selectOne("eventMapper.selectEvent", eno);
	}

	/**
	 *  댓글 리스트 조회
	 */
	public ArrayList<EventReply> selectReplyList(SqlSessionTemplate sqlSession, int evtNo) {
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectReplyList", evtNo);
	}

	/**
	 * 이벤트 게시물 추가
	 */
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		
		return sqlSession.insert("eventMapper.insertEvent", e);
	}

	/**
	 * 이벤트 게시물 삭제 
	 */
	public int deleteEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("eventMapper.deleteEvent", eno);
	}

	/**
	 * 이벤트 게시물 수정
	 */
	public int updateEvent(SqlSessionTemplate sqlSession, Event e) {
		
		return sqlSession.update("eventMapper.updateEvent", e);
	}


	

}
