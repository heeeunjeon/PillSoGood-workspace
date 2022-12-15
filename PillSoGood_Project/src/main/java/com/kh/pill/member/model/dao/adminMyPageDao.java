package com.kh.pill.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.member.model.vo.Member;

@Repository
public class adminMyPageDao {

	/**
	 * 회원정보 수 구하기
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMypageMapper.selectListCount");
	}

	/**
	 * 회원 정보 조회 
	 */
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMypageMapper.selectList", null, rowBounds);
	}

	/**
	 * 회원 상세 조회
	 */
	public Member selectMember(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("adminMypageMapper.selectMember", mno);
	}

}
