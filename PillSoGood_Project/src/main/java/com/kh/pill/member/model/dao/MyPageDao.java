package com.kh.pill.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;

@Repository
public class MyPageDao {
	
	
	/**
	 * 설문조사 결과 조회용 메소드
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<PollResult> selectPollResult(SqlSessionTemplate sqlSession, int memberNo) {

		return (ArrayList)sqlSession.selectList("pollMapper.selectPollResult", memberNo);
		
	}
	
	
	/**
	 * 설문조사 결과 조회용 메소드
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Poll> selectPollList(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("pollMapper.selectPollList", memberNo);
	}
	

}
