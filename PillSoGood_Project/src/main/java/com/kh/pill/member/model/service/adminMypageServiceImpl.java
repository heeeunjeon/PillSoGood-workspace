package com.kh.pill.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.member.model.dao.adminMyPageDao;
import com.kh.pill.member.model.vo.Member;

@Service
public class adminMypageServiceImpl implements adminMypageService {

	@Autowired
	private adminMyPageDao adMyPageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	/**
	 * 회원정보 수 구하기
	 */
	@Override
	public int selectListCount() {
		
		return adMyPageDao.selectListCount(sqlSession);
	}

	/**
	 * 회원 정보 조회
	 */
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		
		return adMyPageDao.selectList(sqlSession, pi);
	}

	/**
	 * 회원 정보 상세 조회
	 */
	@Override
	public Member selectMember(int mno) {
		
		return adMyPageDao.selectMember(sqlSession, mno);
	}

}
